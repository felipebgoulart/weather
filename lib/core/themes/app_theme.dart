import 'package:flutter/material.dart';
import 'package:weather/core/themes/app_colors.dart';
import 'package:weather/core/themes/app_fonts.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get theme => ThemeData(
    primaryColor: AppColors.primary,
    fontFamily: AppFonts.nunito,
    scaffoldBackgroundColor: AppColors.transparent,
    appBarTheme: AppBarTheme(
      elevation: 0,
      color: AppColors.transparent
    )
  );
}
