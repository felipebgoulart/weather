import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather/core/services/weather/weather_service.dart';
import 'package:weather/core/themes/app_colors.dart';
import 'package:weather/core/widgets/cards/item_card_widget.dart';

class PressureCard extends StatelessWidget {
  final num pressure;
  final WeatherService _weatherService = Modular.get<WeatherService>();
  
  PressureCard({
    Key? key,
    required this.pressure
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ItemCard(
      headerTitle: 'Pressure',
      headerIcon: Icons.speed_rounded,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) => SizedBox(
          height: constraints.maxHeight,
          width: constraints.maxWidth,
          child: Center(
            child: SizedBox(
              width: constraints.maxHeight,
              child: CustomPaint(
                size: Size(constraints.maxWidth, constraints.maxHeight),
                painter: PressurePainter(
                  deg: _weatherService.calculateHpaToCircle(pressure)
                )
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PressurePainter extends CustomPainter {
  final num deg;

  PressurePainter({
    required this.deg
  });

  @override
  void paint(Canvas canvas, Size size) {
    double maxWidth = size.height + 8;
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = maxWidth / 2;

    Paint paintLine = Paint()
    ..color=AppColors.white.withOpacity(.3)
    ..strokeWidth=2;

    double outerCircleRadius = radius;
    double innerCircleRadius = radius - 10;

    // Draw dotted circle
    for (double i = 0; i <= 359; i += 5) {
      bool lastOne = false;

      double x1 = center.dx + outerCircleRadius * cos(i * pi / 180);
      double y1 = center.dy + outerCircleRadius * sin(i * pi / 180);

      double x2 = center.dx + innerCircleRadius * cos(i * pi / 180);
      double y2 = center.dy + innerCircleRadius * sin(i * pi / 180);

      if (i <= deg && i >= deg - 24) {
        Paint pressurePaint = Paint()
        ..color=Colors.white
        ..strokeWidth=4;

        if (deg.round() - i < 0) lastOne = (deg.round() - i) * - 1 >= 5;
        
        lastOne = deg.round() - i >= 5;

        if (lastOne) {
          pressurePaint.maskFilter=const MaskFilter.blur(BlurStyle.normal, 3);
        } else {
          pressurePaint.maskFilter=const MaskFilter.blur(BlurStyle.solid, 0);
        }

        canvas.drawLine(Offset(x1, y1), Offset(x2, y2), pressurePaint);
      }

      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), paintLine);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}