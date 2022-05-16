import 'package:flutter/material.dart';
import 'package:weather/core/themes/app_typograph.dart';
import 'package:weather/core/widgets/cards/item_card_widget.dart';
import 'package:weather_icons/weather_icons.dart';

class HumidityCard extends StatelessWidget {
  final num humidity;
  final num dewPoint;

  const HumidityCard({
    Key? key,
    required this.humidity,
    required this.dewPoint
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ItemCard(
      headerTitle: 'Humidity',
      headerIcon: WeatherIcons.humidity,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          Text(
            humidity.toString() + '%',
            style: cardBodyText,
          )
        ],
      ),
      footer: Text(
        'The dew point is ' + dewPoint.ceil().toString() + ' right now',
        style: cardFooterText,
      ),
    );
  }
}