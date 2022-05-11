import 'package:flutter/material.dart';
import 'package:weather/core/widgets/cards/item_card_widget.dart';

class SunPositionCard extends StatefulWidget {
  const SunPositionCard({ Key? key }) : super(key: key);

  @override
  State<SunPositionCard> createState() => _SunPositionCardState();
}

class _SunPositionCardState extends State<SunPositionCard> {
  @override
  Widget build(BuildContext context) {
    return ItemCard(
      headerTitle: 'Sunrise',
      headerIcon: Icons.sunny_snowing,
      body: Container(),
    );
  }
}