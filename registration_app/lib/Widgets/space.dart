import 'package:flutter/material.dart';
import 'package:registration_app/Responsive/size_config.dart';

Widget widthSpace(double size) {
  return SizedBox(
    width: size * SizeConfig.widthMultiplier!,
  );
}

Widget heightSpace(double size) {
  return SizedBox(
    height: size * SizeConfig.heightMultiplier!,
  );
}
