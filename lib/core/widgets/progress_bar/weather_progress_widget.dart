import 'package:flutter/material.dart';
import 'package:weather/core/themes/app_colors.dart';

class WeatherProgress extends StatelessWidget {
  final double progressValue;

  const WeatherProgress({
    Key? key,
    required this.progressValue
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) => SizedBox(
        height: 20,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget> [
            Container(
              height: 10,
              width: constraints.maxWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: LinearGradient(
                  colors: <Color> [
                    AppColors.blue,
                    AppColors.pink
                  ],
                ),
              ),
            ),
            Positioned(
              left: constraints.maxWidth * progressValue - 10,
              child: Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border.all(
                    color: AppColors.primary,
                    width: 3
                  ),
                  borderRadius: BorderRadius.circular(50)
                )
              )
            )
          ],
        ),
      )
    );
  }
}