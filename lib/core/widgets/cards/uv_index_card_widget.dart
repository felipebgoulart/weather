import 'package:flutter/material.dart';
import 'package:weather/core/services/weather/weather_service.dart';
import 'package:weather/core/themes/app_colors.dart';
import 'package:weather/core/themes/app_typograph.dart';
import 'package:weather/core/widgets/cards/item_card_widget.dart';
import 'package:weather/core/widgets/progress_bar/weather_progress_widget.dart';

class UvIndexCard extends StatelessWidget {
  final num uvIndex;

  const UvIndexCard({
    Key? key,
    required this.uvIndex
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ItemCard(
      header: Row(
        children: <Widget> [
          Container(
            margin: const EdgeInsets.only(right: 8),
            child: Icon(
              Icons.sunny,
              color: AppColors.white.withOpacity(.5),
            ),
          ),
          Text(
            'UV INDEX',
            style: weatherCardTitle,
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          Text(
            uvIndex.toString(),
            style: TextStyle(
              color: AppColors.white,
              fontSize: 28
            )
          ),
          Text(
            WeatherService.findUVIndexLabel(uvIndex),
            style: TextStyle(
              color: AppColors.white,
              fontSize: 28
            )
          )
        ],
      ),
      footer: WeatherProgress(
        progressValue: WeatherService.calculateUVIndexTax(uvIndex),
      ),
    );
  }
}