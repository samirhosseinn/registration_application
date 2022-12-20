import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:registration_app/Responsive/responsive.dart';
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
        size: 5 * Responsive().imageConfig,
      ),
    ),
  );
}

Widget otpTextField(
  BuildContext context,
  TextEditingController controller,
  isLast,
) {
  return SizedBox(
    width: 15 * Responsive().widthConfig,
    child: TextField(
      onChanged: (value) {
        if (value.length == 1 && !isLast) {
          FocusScope.of(context).nextFocus();
        }
      },
      controller: controller,
      cursorColor: AppTheme.primaryLightColor,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppTheme.primaryLightColor),
        ),
      ),
      inputFormatters: [
        LengthLimitingTextInputFormatter(1),
        FilteringTextInputFormatter.digitsOnly,
      ],
    ),
  );
}
