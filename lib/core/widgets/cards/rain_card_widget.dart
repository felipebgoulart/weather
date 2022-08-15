import 'package:flutter/material.dart';
import 'package:weather/core/themes/app_typograph.dart';
import 'package:weather/core/widgets/cards/item_card_widget.dart';

class RainCard extends StatelessWidget {
  final String dayRainMili;
  final String? nextDayRainMili;

  const RainCard({
    Key? key,
    required this.dayRainMili,
    this.nextDayRainMili
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ItemCard(
      headerTitle: 'Rainfall',
      headerIcon: Icons.water_drop_rounded,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          Text(
            dayRainMili + ' mm',
            style: cardBodyText,
          ),
          Text(
            'in last hour',
            style: cardBodyText
          ),
        ],
      ),
      footer: Text(
        nextDayRainMili != null ? nextDayRainMili! + ' mm expected in next day' : '',
        style: cardFooterText
      ),
    );
  }
}