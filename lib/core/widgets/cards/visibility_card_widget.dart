import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather/core/services/weather/weather_service.dart';
import 'package:weather/core/themes/app_typograph.dart';
import 'package:weather/core/widgets/cards/item_card_widget.dart';

class VisibilityCard extends StatelessWidget {
  final num visibility;
  final WeatherService _weatherService = Modular.get<WeatherService>();

  VisibilityCard({
    Key? key,
    required this.visibility
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ItemCard(
      headerTitle: 'Visibility',
      headerIcon: Icons.remove_red_eye_rounded,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          Text(
            _weatherService.convertVisibilityToKm(visibility),
            style: cardBodyText,
          )
        ],
      ),
      footer: Text(
        _weatherService.findVisibilityStatus(visibility),
        style: cardFooterText,
      ),
    );
  }
}