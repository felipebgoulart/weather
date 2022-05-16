import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather/core/themes/app_colors.dart';
import 'package:weather/core/themes/app_typograph.dart';
import 'package:weather/core/widgets/cards/feels_like_card_widget.dart';
import 'package:weather/core/widgets/cards/humidity_card_widget.dart';
import 'package:weather/core/widgets/cards/pressure_card_widget.dart';
import 'package:weather/core/widgets/cards/rain_card_widget.dart';
import 'package:weather/core/widgets/cards/sun_position_card_widget.dart';
import 'package:weather/core/widgets/cards/uv_index_card_widget.dart';
import 'package:weather/core/widgets/cards/visibility_card_widget.dart';
import 'package:weather/core/widgets/cards/wind_speed_card_widget.dart';
import 'package:weather/src/modules/home/stores/home_store.dart';
import 'package:weather/src/modules/home/widgets/forecast_widget.dart';

class BottomSheetWeather extends StatefulWidget {
  const BottomSheetWeather({ Key? key }) : super(key: key);

  @override
  State<BottomSheetWeather> createState() => _BottomSheetWeatherState();
}

class _BottomSheetWeatherState extends State<BottomSheetWeather> {
  final HomeStore _homeStore = Modular.get<HomeStore>();

  Widget _tab(String title, {required int index}) {
    return Expanded(
      child: GestureDetector(
        onTap: () => _homeStore.changeTab(index),
        child: Observer(
          builder: (BuildContext context) => Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  title,
                  style: segmentTitle,
                ),
              ),
              _homeStore.selectedTab == index
                  ? Container(
                      height: 1,
                      decoration: BoxDecoration(
                          color: AppColors.transparent,
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: AppColors.white,
                                blurRadius: 3,
                                offset: const Offset(0, -1))
                          ]),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<DraggableScrollableNotification>(
      onNotification: (DraggableScrollableNotification notification) {
        if (notification.extent < .4) {
          _homeStore.closeAnimate();
        }
        return true;
      },
      child: DraggableScrollableSheet(
        initialChildSize: 0.01,
        expand: true,
        maxChildSize: 0.9,
        minChildSize: 0.01,
        controller: _homeStore.draggableScrollableController,
        builder: (BuildContext context, ScrollController scrollController) {
          return SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color> [
                    const Color(0xff2E335A).withOpacity(.5),
                    const Color(0xff1C1B33).withOpacity(.5),
                  ],
                ),
              ),
              child: BlurryContainer(
                padding: const EdgeInsets.all(0),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 80,
                borderRadius: BorderRadius.circular(50),
                blur: 20,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    children: <Widget> [
                      Center(
                        child: Container(
                          height: 5,
                          width: MediaQuery.of(context).size.width / 8,
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(.7),
                            boxShadow: <BoxShadow> [
                              BoxShadow(
                                color: AppColors.purple,
                                blurRadius: 100,
                                spreadRadius: 50,
                                offset: const Offset(-5, -5)
                              )
                            ]
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                        child: Row(
                          children: <Widget>[
                            _tab('Hourly Forecast', index: 0),
                            const SizedBox(width: 16),
                            _tab('Weekly Forecast', index: 1)
                          ],
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          controller: scrollController,
                          physics: const ClampingScrollPhysics(),
                          child: Column(
                            children: <Widget> [
                              const Forecast(),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                                child: LayoutBuilder(
                                  builder: (BuildContext context, BoxConstraints constraints) => SizedBox(
                                    height: constraints.maxWidth * .55,
                                    child: Row(
                                      children: <Widget> [
                                        Expanded(
                                          child: UvIndexCard(
                                            uvIndex: _homeStore.currentWeather!.uvi,
                                          )
                                        ),
                                        const SizedBox(
                                          width: 12,
                                        ),
                                        Expanded(
                                          child: SunPositionCard(
                                            date: _homeStore.currentWeather!.date,
                                            sunset: _homeStore.currentWeather!.sunset,
                                          )
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                                child: LayoutBuilder(
                                  builder: (BuildContext context, BoxConstraints constraints) => SizedBox(
                                    height: constraints.maxWidth * .55,
                                    child: Row(
                                      children: <Widget> [
                                        Expanded(
                                          child: WindSpeedCard(
                                            windSpeed: _homeStore.currentWeather!.windSpeed,
                                            windDeg: _homeStore.currentWeather!.windDeg,
                                          )
                                        ),
                                        const SizedBox(
                                          width: 12,
                                        ),
                                        _homeStore.currentWeather!.rain != null
                                        ? Expanded(
                                          child: RainCard(
                                            dayRainMili: _homeStore.currentWeather!.rain!.hour.toString(),
                                            nextDayRainMili: _homeStore.weather!.daily[0].rain.toString(),
                                          )
                                        )
                                        : Container()
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                                child: LayoutBuilder(
                                  builder: (BuildContext context, BoxConstraints constraints) => SizedBox(
                                    height: constraints.maxWidth * .55,
                                    child: Row(
                                      children: <Widget> [
                                        Expanded(
                                          child: FeelsLikeCard(
                                            temperature: _homeStore.currentWeather!.feelsLike,
                                            currentTemp: _homeStore.currentWeather!.temperature,
                                          )
                                        ),
                                        const SizedBox(
                                          width: 12,
                                        ),
                                        Expanded(
                                          child: HumidityCard(
                                            humidity: _homeStore.currentWeather!.humidity,
                                            dewPoint: _homeStore.currentWeather!.dewPoint,
                                          )
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                                child: LayoutBuilder(
                                  builder: (BuildContext context, BoxConstraints constraints) => SizedBox(
                                    height: constraints.maxWidth * .55,
                                    child: Row(
                                      children: <Widget> [
                                        Expanded(
                                          child: VisibilityCard(
                                            visibility: _homeStore.currentWeather!.visibility,
                                          )
                                        ),
                                        const SizedBox(
                                          width: 12,
                                        ),
                                        Expanded(
                                          child: PressureCard(
                                            pressure: _homeStore.currentWeather!.pressure,
                                          )
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 80
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}