import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:weather/core/themes/app_colors.dart';
import 'package:weather/src/modules/home/models/forecast_item_model.dart';

class ForecastItem extends StatelessWidget {
  final ForecastItemModel forecastItem;

  const ForecastItem({
    Key? key,
    required this.forecastItem
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          boxShadow: const <BoxShadow> [
            BoxShadow(
              blurRadius: 4,
              color: Colors.black26,
              offset: Offset(6, 2)
            )
          ]
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: AppColors.purple
            ),
          ),
          child: BlurryContainer(
            borderRadius: BorderRadius.circular(50),
            height: double.infinity,
            width: 70,
            bgColor: AppColors.primaryDarker.withOpacity(0.1),
            blur: 1,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: Column(
              children: <Widget> [
                Text(
                  forecastItem.title,
                  style: TextStyle(
                    fontSize: 15,
                    color: AppColors.white,
                    fontWeight: FontWeight.w500
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                      Image.asset(forecastItem.iconPath),
                      Text(
                        forecastItem.humidity,
                        style: TextStyle(
                          color: AppColors.lightBlue,
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  ),
                ),
                Text(
                  forecastItem.temp,
                  style: TextStyle(
                    fontSize: 15,
                    color: AppColors.white
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}