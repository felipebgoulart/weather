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

TextStyle directionsCompass = TextStyle(
  color: AppColors.white,
  fontSize: 14,
  fontWeight: FontWeight.bold
);

TextStyle cardBodyText = TextStyle(
  color: AppColors.white,
  fontSize: 32,
  fontWeight: FontWeight.w700
);

TextStyle title = TextStyle(
  color: AppColors.white,
  fontSize: 34,
  fontWeight: FontWeight.w400
);

TextStyle cardFooterText = TextStyle(
  color: AppColors.white,
  fontSize: 14,
  fontWeight: FontWeight.w500
);

TextStyle tileTitleStyle = TextStyle(
  color: AppColors.lightPink,
  fontWeight: FontWeight.w700
);

TextStyle tileSubitleStyle = TextStyle(
  color: AppColors.lightPink.withOpacity(.5),
  fontWeight: FontWeight.w700
);

TextStyle tileLeadingStyle = TextStyle(
  color: AppColors.lightPink.withOpacity(.5),
  fontWeight: FontWeight.w700
);