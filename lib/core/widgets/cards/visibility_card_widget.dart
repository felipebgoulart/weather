import 'package:flutter/material.dart';
import 'package:weather/core/themes/app_typograph.dart';
import 'package:weather/core/widgets/cards/item_card_widget.dart';

class VisibilityCard extends StatelessWidget {
  final num visibility;

  const VisibilityCard({
    Key? key,
    required this.visibility
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ItemCard(
      headerTitle: 'Visibility',
      headerIcon: Icons.remove_red_eye_rounded,
      body: Column(
        children: <Widget> [
          Text(
            (visibility / 1000).round().toString() + ' KM',
            style: cardBodyText,
          )
        ],
      ),
      footer: Text(
        'Visibility is good',
        style: cardFooterText,
      ),
    );
  }
}