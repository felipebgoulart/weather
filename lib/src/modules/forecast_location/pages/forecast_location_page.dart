import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:geolocator/geolocator.dart';
import 'package:timezone/standalone.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:weather/core/routes/app_routes.dart';
import 'package:weather/core/themes/app_colors.dart';
import 'package:weather/core/themes/app_typograph.dart';
import 'package:weather/src/modules/forecast_location/models/city_model.dart';
import 'package:weather/src/modules/forecast_location/stores/forecast_location_interface.dart';
import 'package:weather/src/modules/forecast_location/stores/forecast_location_store.dart';
import 'package:weather/src/modules/home/stores/home_store.dart';
// ignore: implementation_imports
import 'package:timezone/src/location.dart' as location;
import 'package:timezone/data/latest.dart' as tz;
import 'package:lat_lng_to_timezone/lat_lng_to_timezone.dart' as tzmap;


class ForecastLocationPage extends StatefulWidget {
  const ForecastLocationPage({Key? key}) : super(key: key);

  @override
  State<ForecastLocationPage> createState() => _ForecastLocationPageState();
}

class _ForecastLocationPageState extends State<ForecastLocationPage> {
  final IForecastLocation _forecastLocationStore = Modular.get<ForecastLocationStore>();
  final HomeStore _homeStore = Modular.get<HomeStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Weather'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: <Widget> [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryDarker,
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    colors: <Color> [
                      AppColors.grey,
                      AppColors.primaryDarker
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const <double> [0.0, 0.3],
                  ),
                ),
                child: TextField(
                  controller: _forecastLocationStore.searchController,
                  style: TextStyle(
                    color: AppColors.white
                  ),
                  onChanged: (_) => _forecastLocationStore.searchOnChange(),
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(0),
                    prefixIcon: Icon(
                      Icons.search,
                      color: AppColors.white,
                    ),
                    border: InputBorder.none,
                    hintText: 'Search for a city or airport',
                    hintStyle: TextStyle(
                      color: AppColors.white
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Expanded(
                child: Observer(
                  builder: (BuildContext context) {
                    if (_forecastLocationStore.citiesList.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget> [
                            Icon(
                              _forecastLocationStore.citiesList.isEmpty && _forecastLocationStore.searchController.text.isNotEmpty ? Icons.search_off_rounded : Icons.search_outlined,
                              color: AppColors.white, 
                              size: 42,
                            ),
                            Text(
                              _forecastLocationStore.citiesList.isEmpty && _forecastLocationStore.searchController.text.isNotEmpty ? 'city not found' : 'Search for a city',
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                          ],
                        )
                      );
                    } else {
                      return ListView.builder(  
                      itemCount: _forecastLocationStore.citiesList.length,
                      itemBuilder: (BuildContext context, int index) {
                        CityModel city = _forecastLocationStore.citiesList[index];
                  
                        return Column(
                          children: <Widget> [
                            Theme(
                              data: ThemeData(
                                splashColor: AppColors.purpleDarker,
                              ),
                              child: ListTile(
                                key: UniqueKey(),
                                tileColor: city.selected ? AppColors.primaryDarker : AppColors.transparent,
                                contentPadding: const EdgeInsets.symmetric(horizontal: 6),
                                leading: CircleAvatar(
                                  backgroundColor: AppColors.pink,
                                  child: Text(
                                    city.country,
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w700
                                    ),
                                  ),
                                ),
                                title: Text(
                                  city.name,
                                  style: tileTitleStyle
                                ),
                                subtitle: Text(
                                  city.state,
                                  style: tileSubitleStyle,
                                ),
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)
                                  )
                                ),
                                onTap: () {
                                  for (CityModel element in _forecastLocationStore.citiesList) {
                                    element.selected = false;
                                  }
                                  city.selected = !city.selected;
                                  _forecastLocationStore.citiesList.removeAt(index);
                                  _forecastLocationStore.citiesList.insert(index, city);
                                }
                              ),
                            ),
                            AnimatedContainer(
                              duration: Duration(milliseconds: city.selected ? 500 : 0),
                              height: city.selected ? 90 : 0,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: city.selected ? AppColors.primaryDarker : AppColors.transparent,
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)
                                )
                              ),
                              child: GestureDetector(
                                onTap: () async {},
                                child: city.selected
                                ? Padding(
                                  padding: const EdgeInsets.all(24),
                                  child: Row(
                                    children: <Widget> [
                                      Padding(
                                        padding: const EdgeInsets.only(right: 8),
                                        child: IconButton(
                                          onPressed: () async {
                                            _forecastLocationStore.loading = true;
                                            showDialog(
                                              context: context,
                                              builder: (_) {
                                                return const Center(
                                                  child: CircularProgressIndicator()
                                                );
                                              }
                                            );
                                            tz.initializeTimeZones();
                                            String timezone = tzmap.latLngToTimezoneString(city.lat, city.lon);
                                            location.Location detroit = getLocation(timezone);
                                            DateTime detroitNow = TZDateTime.now(detroit);
                                            Position position = Position(longitude: city.lon, latitude: city.lat, timestamp: detroitNow, accuracy: 0, altitude: 0, heading: 0, speed: 0, speedAccuracy: 0);
                                            await _homeStore.getAllForecasts(position: position);
                                              _homeStore.buildForecast(0);
                                              Navigator.pushNamed(
                                              context,
                                              AppRoutes.forecasts,
                                            );
                                            Navigator.pop(context);
                                            _forecastLocationStore.loading = false;
                                          },
                                          icon: Icon(
                                            Icons.location_on_rounded,
                                            color: AppColors.lightBlue,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 8),
                                        child: IconButton(
                                          onPressed: () async {
                                            String googleUrl = 'https://www.google.com/maps/search/?api=1&query=${city.lat},${city.lon}';
                                            if (await canLaunchUrl(Uri.parse(googleUrl))) {
                                              await launchUrl(Uri.parse(googleUrl));
                                            } else {
                                              // ignore: only_throw_errors
                                              throw 'Could not open the map.';
                                            }
                                          },
                                          icon: Icon(
                                            Icons.map_rounded,
                                            color: AppColors.lightBlue,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: <Widget> [
                                            Expanded(
                                              child: Text(
                                                city.lat.toString(),
                                                style: TextStyle(
                                                  color: AppColors.white
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                city.lon.toString(),
                                                style: TextStyle(
                                                  color: AppColors.white
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                                : Container()
                              ),
                            )
                          ],
                        );
                      },
                    );
                    }
                  }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// SizedBox(
//   height: 200,
//   width: MediaQuery.of(context).size.width,
//   child: Stack(
//     children: <Widget> [
//       SvgPicture.asset(
//         AppAssets.rectangle,
//         key: UniqueKey(),
//         color: AppColors.purple,
//       ),
//       Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget> [
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: const <Widget> [
//                 Text(
//                   '19˚',
//                   style: TextStyle(
//                     fontSize: 52
//                   ),
//                 ),
//                 SizedBox(
//                   height: 24,
//                 ),
//                 Text('Montreal, Canada')
//               ],
//             ),
//             Column(
//               children: [
//                 Image.asset(
//                   _forecastLocationStore.getWeatherIcon(),
//                   width: 150,
//                 ),
//               ],
//             )
//           ],
//         ),
//       )
//     ],
//   ),
// );