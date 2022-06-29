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
import 'package:weather/src/modules/home/widgets/home_tabs.dart';

class ForecastsPage extends StatefulWidget {

  const ForecastsPage({
    Key? key
  }) : super(key: key);

  @override
  State<ForecastsPage> createState() => _ForecastsPageState();
}

class _ForecastsPageState extends State<ForecastsPage> {
  final HomeStore _homeStore = Modular.get<HomeStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryDarker,
      body: SafeArea(
        child: Observer(
          builder: (BuildContext context) => Column(
            children: <Widget> [
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Text(
                      _homeStore.cityName ?? '',
                      style: title,
                    ),
                    Text.rich(
                      TextSpan(
                        text: _homeStore.forecast!.temperature.round().toString() + '˚',
                        style: segmentTitle,
                        children: <TextSpan> [
                          TextSpan(
                            text: ' | ' + _homeStore.forecast!.description,
                            style: segmentTitle,
                          )
                        ]
                      )
                    ),
                  ],
                ),
              ),
              const HomeTabs(),
              Expanded(
                child: SingleChildScrollView(
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
                                    uvIndex: _homeStore.forecast!.uvi,
                                  )
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Expanded(
                                  child: SunPositionCard(
                                    date: _homeStore.forecast!.date,
                                    sunset: _homeStore.forecast!.sunset,
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
                                    windSpeed: _homeStore.forecast!.windSpeed,
                                    windDeg: _homeStore.forecast!.windDeg,
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
                                    temperature: _homeStore.forecast!.feelsLike,
                                    currentTemp: _homeStore.forecast!.temperature,
                                  )
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Expanded(
                                  child: HumidityCard(
                                    humidity: _homeStore.forecast!.humidity,
                                    dewPoint: _homeStore.forecast!.dewPoint,
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
                                _homeStore.forecast!.visibility != null
                                ? Expanded(
                                  child: VisibilityCard(
                                    visibility: _homeStore.forecast!.visibility!,
                                  )
                                )
                                : Container(),
                                SizedBox(
                                  width: _homeStore.forecast!.visibility != null ? 12 : 0,
                                ),
                                Expanded(
                                  child: PressureCard(
                                    pressure: _homeStore.forecast!.pressure,
                                  )
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}