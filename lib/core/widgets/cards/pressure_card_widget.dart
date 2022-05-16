import 'package:flutter/material.dart';
import 'package:weather/core/themes/app_typograph.dart';
import 'package:weather/core/widgets/cards/item_card_widget.dart';

class PressureCard extends StatelessWidget {
  final num pressure;
  
  const PressureCard({
    Key? key,
    required this.pressure
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ItemCard(
      headerTitle: 'Pressure',
      headerIcon: Icons.speed_rounded,
      body: Column(
        children: <Widget> [
          Text(
            pressure.toString(),
            style: cardBodyText,
          )
        ],
      ),
    );
  }
}