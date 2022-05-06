import 'package:flutter/material.dart';

late BuildContext buildContext;

void setBuildContext(BuildContext context) {
  buildContext = context;
}

TextStyle h1 = const TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w700,
  fontStyle: FontStyle.normal,
);
