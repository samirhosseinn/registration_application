import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:registration_app/Responsive/size_config.dart';
import 'package:registration_app/Widgets/space.dart';
import 'package:registration_app/Widgets/text_filed.dart';
import 'package:registration_app/style/images.dart';
import 'package:registration_app/style/style.dart';

class ConfrimEmailView extends StatefulWidget {
  const ConfrimEmailView({Key? key}) : super(key: key);

  @override
  State<ConfrimEmailView> createState() => _ConfrimEmailViewState();
}

class _ConfrimEmailViewState extends State<ConfrimEmailView> {
  late final TextEditingController _pin1;
  late final TextEditingController _pin2;
  late final TextEditingController _pin3;
  late final TextEditingController _pin4;

  @override
  void initState() {
    _pin1 = TextEditingController();
    _pin2 = TextEditingController();
    _pin3 = TextEditingController();
    _pin4 = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _pin1.dispose();
    _pin2.dispose();
    _pin3.dispose();
    _pin4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 5 * SizeConfig.widthMultiplier!,
        ),
        child: Center(
          child: Column(
            children: [
              Image.asset(
                Images.confrimEmail,
                width: 90 * SizeConfig.widthMultiplier!,
              ),
              heightSpace(5),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Confirm your email",
                  style: AppTheme.darkPrimaryText.button,
                ),
              ),
              heightSpace(7),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                textDirection: TextDirection.ltr,
                children: [
                  otpTextField(context, _pin1, false),
                  otpTextField(context, _pin2, false),
                  otpTextField(context, _pin3, false),
                  otpTextField(context, _pin4, true),
                ],
              ),
              heightSpace(15),
              GestureDetector(
                onTap: () {
                  log("confirm email");
                },
                child: Container(
                  width: 80 * SizeConfig.widthMultiplier!,
                  height: 8 * SizeConfig.heightMultiplier!,
                  decoration: BoxDecoration(
                    color: AppTheme.primaryLightColor,
                    borderRadius: BorderRadius.circular(
                      5 * SizeConfig.imageSizeMultiplier!,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "confirm",
                      style: AppTheme.whiteText.button,
                    ),
                  ),
                ),
              ),
              heightSpace(5),
              GestureDetector(
                onTap: () {
                  log("resend verification email");
                },
                child: Text(
                  "resend verification email",
                  style: AppTheme.lightPrimaryText.button,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
