import 'package:flutter/material.dart';
import 'package:registration_app/Responsive/responsive.dart';


Widget widthSpace(double size) {
  return SizedBox(
    width: size * Responsive().widthConfig,
  );
}

Widget heightSpace(double size) {
  return SizedBox(
    height: size * Responsive().heightConfig,
  );
}
