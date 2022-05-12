
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather/core/services/weather/weather_service.dart';
import 'package:weather/core/themes/app_colors.dart';
import 'package:weather/core/widgets/cards/item_card_widget.dart';

class SunPositionCard extends StatefulWidget {
  final int date;

  const SunPositionCard({
    Key? key,
    required this.date
  }) : super(key: key);

  @override
  State<SunPositionCard> createState() => _SunPositionCardState();
}

class _SunPositionCardState extends State<SunPositionCard> with SingleTickerProviderStateMixin {
  final WeatherService _weatherService = Modular.get<WeatherService>();
  late Path _path;

  Path _drawPath(BoxConstraints constraints){
    Size size = Size(constraints.maxWidth, constraints.maxHeight);
    Path path = Path();
    path.moveTo(0, size.height * .99);
    path.cubicTo(size.width * .03, size.height, size.width * .24, size.height * .5, size.width * .5, size.height * .55);
    path.cubicTo(size.width * .7, size.height * .63, size.width * .8, size.height, size.width, size.height);
    return path;
  }

  Offset _calculate() {
    double value = _weatherService.calculateSunPosition(widget.date);
    ui.PathMetrics pathMetrics = _path.computeMetrics();
    ui.PathMetric pathMetric = pathMetrics.elementAt(0);
    value = pathMetric.length * value;
    ui.Tangent? pos = pathMetric.getTangentForOffset(value);
    return pos!.position;
  }
  
  @override
  Widget build(BuildContext context) {
    return ItemCard(
      headerTitle: 'Sunrise',
      headerIcon: Icons.sunny_snowing,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          _path = _drawPath(constraints);
          return Stack(
            children: [
              Positioned(
                top: 12,
                width: constraints.maxWidth,
                child: Text(
                  '12:22 AM',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    color: AppColors.white,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              CustomPaint(
                size: Size(constraints.maxWidth, constraints.maxHeight),
                painter: SunrisePainter(),
              ),
              Positioned(
                top: _calculate().dy,
                left: _calculate().dx,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  width: 10,
                  height: 10,
                ),
              ),
              Positioned(
                bottom: 10,
                width: constraints.maxWidth,
                child: Divider(
                  color: AppColors.white,
                ),
              )
            ],
          );
        }
      ),
    );
  }
}

class SunrisePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(0, size.height);
    path.cubicTo(size.width * .18, size.height, size.width * .25, size.height * .6, size.width * .5, size.height * .6);
    path.cubicTo(size.width * .7, size.height * .63, size.width * .8, size.height, size.width, size.height);

    Paint paintStroke = Paint()
    ..style=PaintingStyle.stroke
    ..strokeWidth=size.width * .03
    ..color=AppColors.lightBlue
    ..shader = ui.Gradient.linear(
      const ui.Offset(0, 0),
      ui.Offset(size.width, size.height),
      <Color> [
        AppColors.darkBlue,
        AppColors.lightBlue,
        AppColors.darkBlue,
      ],
      <double> [
        .42,
        .48,
        .85
      ]
    );

    canvas.drawPath(path, paintStroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}