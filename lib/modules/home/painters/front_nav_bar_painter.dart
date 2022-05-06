import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class FrontNavBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
            
  Path path_0 = Path();
  path_0.moveTo(size.width*0.4210526,0);
  path_0.lineTo(size.width*0.5789474,0);
  path_0.cubicTo(size.width*0.6992481,0,size.width*0.7349662,size.height*0.2235167,size.width*0.7734286,size.height*0.4509120);
  path_0.cubicTo(size.width*0.8132519,size.height*0.6863398,size.width*0.8533835,size.height*0.9259259,size.width*0.9849624,size.height);
  path_0.lineTo(size.width*0.01503759,size.height);
  path_0.cubicTo(size.width*0.1466165,size.height*0.9259259,size.width*0.1867492,size.height*0.6863398,size.width*0.2265703,size.height*0.4509120);
  path_0.cubicTo(size.width*0.2650331,size.height*0.2235167,size.width*0.3007519,0,size.width*0.4210526,0);
  path_0.close();

  Paint paint0Fill = Paint()..style=PaintingStyle.fill;
  paint0Fill.shader = ui.Gradient.linear(Offset(size.width*0.6902820,size.height*0.9259259), Offset(size.width*0.6902820,0), [Color(0xff262C51).withOpacity(1),Color(0xff3E3F74).withOpacity(1)], [0,1]);
  canvas.drawPath(path_0,paint0Fill);

  Path path_1 = Path();
  path_1.moveTo(size.width*0.4210526,size.height*0.002314815);
  path_1.lineTo(size.width*0.5789474,size.height*0.002314815);
  path_1.cubicTo(size.width*0.6388083,size.height*0.002314815,size.width*0.6775526,size.height*0.05786796,size.width*0.7061579,size.height*0.1416722);
  path_1.cubicTo(size.width*0.7338722,size.height*0.2228676,size.width*0.7520789,size.height*0.3305935,size.width*0.7706541,size.height*0.4405093);
  path_1.cubicTo(size.width*0.7712895,size.height*0.4442713,size.width*0.7719248,size.height*0.4480361,size.width*0.7725602,size.height*0.4518028);
  path_1.lineTo(size.width*0.7729474,size.height*0.4540907);
  path_1.cubicTo(size.width*0.7927180,size.height*0.5709741,size.width*0.8127068,size.height*0.6891426,size.width*0.8440752,size.height*0.7782213);
  path_1.cubicTo(size.width*0.8705714,size.height*0.8534556,size.width*0.9051729,size.height*0.9079120,size.width*0.9545451,size.height);
  path_1.lineTo(size.width*0.04545639,size.height);
  path_1.cubicTo(size.width*0.09482519,size.height*0.9079120,size.width*0.1294274,size.height*0.8534556,size.width*0.1559233,size.height*0.7782213);
  path_1.cubicTo(size.width*0.1872951,size.height*0.6891417,size.width*0.2072820,size.height*0.5709731,size.width*0.2270511,size.height*0.4540898);
  path_1.lineTo(size.width*0.2274380,size.height*0.4518028);
  path_1.cubicTo(size.width*0.2280752,size.height*0.4480361,size.width*0.2287113,size.height*0.4442713,size.width*0.2293470,size.height*0.4405102);
  path_1.cubicTo(size.width*0.2479222,size.height*0.3305935,size.width*0.2661274,size.height*0.2228676,size.width*0.2938417,size.height*0.1416722);
  path_1.cubicTo(size.width*0.3224462,size.height*0.05786796,size.width*0.3611921,size.height*0.002314815,size.width*0.4210526,size.height*0.002314815);
  path_1.close();

  Paint paint1Stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.001879699;
  paint1Stroke.color=Color(0xff7582F4).withOpacity(0.5);
  canvas.drawPath(path_1,paint1Stroke);

  Paint paint1Fill = Paint()..style=PaintingStyle.fill;
  paint1Fill.color = Color(0xff262C51).withOpacity(1.0);
  canvas.drawPath(path_1,paint1Fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
      return true;
  }
}