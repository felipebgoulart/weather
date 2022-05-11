import 'package:flutter/material.dart';
import 'package:weather/core/themes/app_colors.dart';

late BuildContext buildContext;

void setBuildContext(BuildContext context) {
  buildContext = context;
}

TextStyle h1 = const TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w700,
  fontStyle: FontStyle.normal,
);

TextStyle segmentTitle = const TextStyle(
  color: Color(0xffEBEBF5),
  fontSize: 16,
  fontWeight: FontWeight.bold
);

TextStyle weatherCardTitle = TextStyle(
  color: AppColors.white.withOpacity(.5),
  fontSize: 16
);