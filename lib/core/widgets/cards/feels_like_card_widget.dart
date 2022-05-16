import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather/core/services/weather/weather_service.dart';
import 'package:weather/core/themes/app_typograph.dart';
import 'package:weather/core/widgets/cards/item_card_widget.dart';

class FeelsLikeCard extends StatelessWidget {
  final num temperature;
  final num currentTemp;
  final WeatherService _weatherService = Modular.get<WeatherService>();

  FeelsLikeCard({
    Key? key,
    required this.temperature,
    required this.currentTemp
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ItemCard(
      headerTitle: 'Feels Like',
      headerIcon: Icons.thermostat_rounded,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          Text(
            temperature.round().toString() + '˚',
            style: cardBodyText,
          )
        ],
      ),
      footer: Text(
        _weatherService.feelsLikeTempStatus(temperature, currentTemp),
        style: cardFooterText,
      ),
    );
  }
}