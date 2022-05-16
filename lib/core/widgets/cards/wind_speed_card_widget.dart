import 'dart:math';

import 'package:flutter/material.dart';
import 'package:weather/core/themes/app_colors.dart';
import 'package:weather/core/themes/app_typograph.dart';
import 'package:weather/core/widgets/cards/item_card_widget.dart';

class WindSpeedCard extends StatelessWidget {
  final num windSpeed;
  final num windDeg;

  const WindSpeedCard({
    Key? key,
    required this.windSpeed,
    required this.windDeg
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ItemCard(
      headerTitle: 'Wind',
      headerIcon: Icons.air_outlined,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) => SizedBox(
          height: constraints.maxHeight,
          width: constraints.maxWidth,
          child: Center(
            child: SizedBox(
              width: constraints.maxHeight,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CustomPaint(
                    size: Size(constraints.maxWidth, constraints.maxHeight),
                    painter: WindCompassPainter(windDeg.toDouble()),
                  ),
                  Positioned(
                    right: 8,
                    child: Text(
                      'E',
                      style: directionsCompass,
                    )
                  ),
                  Positioned(
                    left: 8,
                    child: Text(
                      'W',
                      style: directionsCompass
                    )
                  ),
                  Positioned(
                    top: 8,
                    child: Text(
                      'N',
                      style: directionsCompass
                    )
                  ),
                  Positioned(
                    bottom: 8,
                    child: Text(
                      'S',
                      style: directionsCompass
                    )
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            windSpeed.toString(),
                            style: directionsCompass,
                          ),
                          Text(
                            'KM/h',
                            style: directionsCompass
                          ),
                        ],
                      )
                    )
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class WindCompassPainter extends CustomPainter {
  final double deg;

  WindCompassPainter(
    this.deg
  );

  @override
  void paint(Canvas canvas, Size size) {
    double maxWidth = size.height + 8;
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = maxWidth / 2;

    Paint paintLine = Paint()
    ..strokeWidth=2;

    double outerCircleRadius = radius;
    double innerCircleRadius = radius - 10;

    // Draw dotted circle
    for (double i = 0; i <= 360; i += 5) {
      double x1 = center.dx + outerCircleRadius * cos(i * pi / 180);
      double y1 = center.dy + outerCircleRadius * sin(i * pi / 180);

      double x2 = center.dx + innerCircleRadius * cos(i * pi / 180);
      double y2 = center.dy + innerCircleRadius * sin(i * pi / 180);

      if (i == 0 || i == 180 || i == 90 || i == 270) {
        paintLine.color=AppColors.white;
      } else {
        paintLine.color=AppColors.white.withOpacity(.3);
      }

      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), paintLine);
    }

    // Draw end of arrow
    Paint paintArrow = Paint()
    ..strokeWidth=2
    ..color=AppColors.white;

    double x1 = center.dx - radius * cos(deg * pi / 180);
    double y1 = center.dy - radius * sin(deg * pi / 180);

    double x2 = center.dx - 30 * cos(deg * pi / 180);
    double y2 = center.dy - 30 * sin(deg * pi / 180);

    canvas.drawLine(Offset(x1, y1), Offset(x2, y2), paintArrow);

    Paint paintEndArrow = Paint()
    ..strokeWidth=2
    ..color=AppColors.white
    ..style=PaintingStyle.stroke;

    canvas.drawCircle(Offset(x1, y1), 5, paintEndArrow);

    // Draw start of arrow
    double xx1 = center.dx + 30 * cos(deg * pi / 180);
    double yy1 = center.dy + 30 * sin(deg * pi / 180);

    double xx2 = center.dx + radius * cos(deg * pi / 180);
    double yy2 = center.dy + radius * sin(deg * pi / 180);

    canvas.drawLine(Offset(xx1, yy1), Offset(xx2, yy2), paintArrow);

    Paint paintStartArrow = Paint()
    ..color=AppColors.white;

    canvas.drawCircle(Offset(xx2, yy2), 6, paintStartArrow);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}