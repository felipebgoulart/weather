import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather/core/constants/assets_global.dart';
import 'package:weather/core/models/location_weather_model.dart';
import 'package:weather/src/modules/home/stores/home_store.dart';
import 'package:weather/src/modules/home/widgets/bottom_navbar_widget.dart';
import 'package:weather/src/modules/home/widgets/bottom_sheet_weather_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeStore _homeStore = Modular.get<HomeStore>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      decoration: const BoxDecoration(
        color: Color(0xff3A3F54),
        image: DecorationImage(
          image: AssetImage(AppAssets.nightSky),
          fit: BoxFit.cover
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder<LocationWeatherModel>(
          future: _homeStore.getAllForecasts(),
          builder: (BuildContext context, AsyncSnapshot<LocationWeatherModel> asyncSnapshot) {
            if (asyncSnapshot.hasError) {
              return Container();
            } else {
              if (_homeStore.isLoading) {
                return Container();
              } else {
                return Stack(
                  children: <Widget> [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 75),
                      child: Column(
                        children: <Widget> [
                          Expanded(
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget> [
                                  Text(
                                    _homeStore.cityName ?? '',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 34,
                                      fontWeight: FontWeight.w400
                                    ),
                                  ),
                                  Text(
                                    _homeStore.currentWeather!.temperature.round().toString() + '˚',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 96,
                                      fontWeight: FontWeight.w100
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Image.asset(
                              AppAssets.house,
                              width: MediaQuery.of(context).size.width,
                            ),
                          )
                        ],
                      ),
                    ),
                    asyncSnapshot.hasData
                    ? const BottomSheetWeather()
                    : Container(),
                    BottomNavBar(
                      size: size,
                      onMorePressed: () {
                        debugPrint('more pressed');
                        _homeStore.toggleSheetVisibility();
                      },
                      onLocationPressed: () {
                        debugPrint('location pressed');
                      },
                      onDetailPressed: () {
                        debugPrint('detail pressed');
                      },
                    ),
                  ],
                );
              }
            }
          }
        )
      )
    );
  }
}