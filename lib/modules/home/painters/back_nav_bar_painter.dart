import 'package:flutter/material.dart';

class BackNavBarPainter extends CustomPainter {
  
  @override
  void paint(Canvas canvas, Size size) {
    Path path_1 = Path();
    path_1.moveTo(size.width,size.height*0.01111111);
    
    path_1.lineTo(0,0);
    path_1.lineTo(0, size.height);
    path_1.lineTo(size.width, size.height);
    path_1.lineTo(size.width, 0);
    path_1.lineTo(size.width*0.9973189,size.height*0.008391189);
    path_1.lineTo(size.width,size.height*0.008901233);
    path_1.cubicTo(size.width*0.9963776,size.height*0.009238344,size.width*0.9958163,size.height*0.009739389,size.width*0.9950816,size.height*0.01039490);
    path_1.cubicTo(size.width*0.9829923,size.height*0.02104744,size.width*0.9748061,size.height*0.02815733,size.width*0.9645740,size.height*0.03682878);
    path_1.cubicTo(size.width*0.9441148,size.height*0.05417200,size.width*0.9154796,size.height*0.07776122,size.width*0.8827883,size.height*0.1027452);
    path_1.cubicTo(size.width*0.8173980,size.height*0.1527178,size.width*0.7357908,size.height*0.2082533,size.width*0.6708673,size.height*0.2305644);
    path_1.cubicTo(size.width*0.6036837,size.height*0.2536522,size.width*0.5674413,size.height*0.2638889,size.width*0.5000000,size.height*0.2638889);
    path_1.cubicTo(size.width*0.4325587,size.height*0.2638889,size.width*0.3937628,size.height*0.2536511,size.width*0.3265816,size.height*0.2305644);
    path_1.cubicTo(size.width*0.2616607,size.height*0.2082533,size.width*0.1806898,size.height*0.1527178,size.width*0.1159375,size.height*0.1027460);
    path_1.cubicTo(size.width*0.08356378,size.height*0.07776211,size.width*0.05524923,size.height*0.05417300,size.width*0.03502806,size.height*0.03683000);
    path_1.cubicTo(size.width*0.02491753,size.height*0.02815856,size.width*0.01683051,size.height*0.02104878,size.width*0.01127138,size.height*0.01610700);
    path_1.cubicTo(size.width*0.008491811,size.height*0.01363611,size.width*0.006344235,size.height*0.01170733,size.width*0.004891684,size.height*0.01039631);
    path_1.cubicTo(size.width*0.004165408,size.height*0.009740822,size.width*0.003612883,size.height*0.009239789,size.width*0.003241990,size.height*0.008902689);
    path_1.lineTo(size.width*0.002822883,size.height*0.008521178);
    path_1.lineTo(size.width*0.002717347,size.height*0.008424856);
    path_1.lineTo(0, 0);
    path_1.close();

    Paint paint1Fill = Paint()..style=PaintingStyle.fill;
    paint1Fill.color = const Color(0xff3A3A6A).withOpacity(.5);
    canvas.drawPath(path_1,paint1Fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}