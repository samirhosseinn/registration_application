import 'package:flutter/material.dart';
import 'package:registration_app/Responsive/size_config.dart';
import 'package:registration_app/style/style.dart';

Widget customTextField({
  required TextEditingController controller,
  required String hintText,
  required IconData icon,
  bool isPassword = false,
}) {
  return TextField(
    controller: controller,
    obscureText: isPassword,
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: AppTheme.greyText.subtitle1,
      prefixIcon: Icon(
        icon,
        color: Colors.grey,
        size: 5 * SizeConfig.imageSizeMultiplier!,
      ),
    ),
  );
}
