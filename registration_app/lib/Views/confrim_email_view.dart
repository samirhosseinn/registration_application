import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:registration_app/Responsive/responsive.dart';
import 'package:registration_app/Services/auth_service.dart';
import 'package:registration_app/Views/change_password_view.dart';
import 'package:registration_app/Widgets/space.dart';
import 'package:registration_app/Widgets/text_filed.dart';
import 'package:registration_app/constants/routes.dart';
import 'package:registration_app/style/images.dart';
import 'package:registration_app/style/style.dart';

class ConfrimEmailView extends StatefulWidget {
  final int firstOtp;
  final String username;
  final String email;
  final String password;
  final bool isUserRegistered;
  const ConfrimEmailView({
    Key? key,
    required this.firstOtp,
    required this.email,
    required this.username,
    required this.password,
    this.isUserRegistered = false,
  }) : super(key: key);

  @override
  State<ConfrimEmailView> createState() => _ConfrimEmailViewState();
}

class _ConfrimEmailViewState extends State<ConfrimEmailView> {
  late final TextEditingController _pin1;
  late final TextEditingController _pin2;
  late final TextEditingController _pin3;
  late final TextEditingController _pin4;

  late int otp;

  @override
  void initState() {
    _pin1 = TextEditingController();
    _pin2 = TextEditingController();
    _pin3 = TextEditingController();
    _pin4 = TextEditingController();
    otp = widget.firstOtp;
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
          horizontal: 5 * Responsive().widthConfig,
        ),
        child: Center(
          child: Column(
            children: [
              Image.asset(
                Images.confrimEmail,
                width: 90 * Responsive().widthConfig,
                height: 40 * Responsive().heightConfig,
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
                onTap: () async {
                  int enteredOTP = int.parse(
                      _pin1.text + _pin2.text + _pin3.text + _pin4.text);

                  if (enteredOTP == otp) {
                    if (widget.isUserRegistered) {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            ChangePasswordView(email: widget.email),
                      ));
                    } else {
                      await AuthService.register(
                        email: widget.email,
                        username: widget.username,
                        password: widget.password,
                      );
                      log("registred");
                      if (!mounted) return;
                      Navigator.of(context).pushNamed(loginViewRoute);
                    }
                  } else {
                    log("wronge otp");
                  }
                },
                child: Container(
                  width: 80 * Responsive().widthConfig,
                  height: 8 * Responsive().heightConfig,
                  decoration: BoxDecoration(
                    color: AppTheme.primaryLightColor,
                    borderRadius: BorderRadius.circular(
                      5 * Responsive().imageConfig,
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
                onTap: () async {
                  if (widget.isUserRegistered) {
                    int newOtp = await AuthService.sendForgotPassword(
                        email: widget.email);
                    setState(() {
                      otp = newOtp;
                    });
                  } else {
                    int newOtp = await AuthService.sendOTP(email: widget.email);
                    setState(() {
                      otp = newOtp;
                    });
                  }
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
