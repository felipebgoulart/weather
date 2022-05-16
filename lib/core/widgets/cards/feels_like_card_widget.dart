import 'package:flutter/material.dart';
import 'package:weather/core/themes/app_typograph.dart';
import 'package:weather/core/widgets/cards/item_card_widget.dart';

class FeelsLikeCard extends StatelessWidget {
  final num temperature;

  const FeelsLikeCard({
    Key? key,
    required this.temperature
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
            temperature.toString() + '˚',
            style: cardBodyText,
          )
        ],
      ),
      footer: Text(
        'Similar to the actual temperature',
        style: cardFooterText,
      ),
    );
  }
}