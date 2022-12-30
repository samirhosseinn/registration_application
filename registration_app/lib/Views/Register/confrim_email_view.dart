import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration_app/Bloc/auth_bloc.dart';
import 'package:registration_app/Bloc/auth_event.dart';
import 'package:registration_app/Bloc/auth_state.dart';
import 'package:registration_app/Exceptions/exceptions.dart';
import 'package:registration_app/Responsive/responsive.dart';
import 'package:registration_app/Widgets/space.dart';
import 'package:registration_app/Widgets/text_filed.dart';
import 'package:registration_app/style/images.dart';
import 'package:registration_app/style/style.dart';

class ConfirmEmailView extends StatefulWidget {
  final int otp;
  final String username;
  final String email;
  final String password;
  final bool isUserRegistered;
  const ConfirmEmailView({
    Key? key,
    required this.otp,
    required this.email,
    required this.username,
    required this.password,
    required this.isUserRegistered,
  }) : super(key: key);

  @override
  State<ConfirmEmailView> createState() => _ConfirmEmailViewState();
}

class _ConfirmEmailViewState extends State<ConfirmEmailView> {
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
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthStateConfirmEmail) {
          if (state.exception is RegisteredSuccessfully) {
            log("registered successfully");
            context.read<AuthBloc>().add(const AuthEventLogin());
          } else if (state.exception is InternetConnectionException) {
            log("check your internet");
          } else if (state.exception is GenericException) {
            log('please try again later');
          }
        }
      },
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 5 * Responsive().widthConfig,
          ),
          child: Center(
            child: SingleChildScrollView(
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
                  heightSpace(2),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.email,
                      style: AppTheme.greyText.subtitle1,
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
                      if (widget.otp == enteredOTP) {
                        if (widget.isUserRegistered) {
                          context.read<AuthBloc>().add(
                              AuthEventChangePassword(email: widget.email));
                        } else {
                          context.read<AuthBloc>().add(AuthEventConfirmEmail(
                                otp: widget.otp,
                                username: widget.username,
                                email: widget.email,
                                password: widget.password,
                              ));
                        }
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
                    onTap: () {
                      context.read<AuthBloc>().add(AuthEventResendOTP(
                            otp: widget.otp,
                            username: widget.username,
                            email: widget.email,
                            password: widget.password,
                            isUserRegistered: widget.isUserRegistered,
                          ));
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
        ),
      ),
    );
  }
}
