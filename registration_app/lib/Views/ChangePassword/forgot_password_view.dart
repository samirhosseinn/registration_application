import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration_app/Bloc/auth_bloc.dart';
import 'package:registration_app/Bloc/auth_event.dart';
import 'package:registration_app/Bloc/auth_state.dart';
import 'package:registration_app/Exceptions/exceptions.dart';
import 'package:registration_app/Responsive/responsive.dart';
import 'package:registration_app/Widgets/space.dart';
import 'package:registration_app/style/images.dart';
import 'package:registration_app/style/style.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  late final TextEditingController _email;

  @override
  void initState() {
    _email = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthStateForgotPassword) {
          if (state.exception is UserNotExistException) {
            log("user not exist");
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
                    Images.forgotPassword,
                    width: 90 * Responsive().widthConfig,
                    height: 40 * Responsive().heightConfig,
                  ),
                  heightSpace(5),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Enter your email to get verification code",
                      style: AppTheme.darkPrimaryText.headline6,
                    ),
                  ),
                  heightSpace(7),
                  TextField(
                    onChanged: (_) => setState(() => {}),
                    controller: _email,
                    decoration: InputDecoration(
                      hintText: "email",
                      hintStyle: AppTheme.greyText.subtitle1,
                      errorText: _emailErrorText,
                      errorStyle: TextStyle(
                        color: Colors.red,
                        fontFamily: AppTheme.primaryFontFamily,
                      ),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.grey,
                        size: 5 * Responsive().imageConfig,
                      ),
                    ),
                  ),
                  heightSpace(10),
                  GestureDetector(
                    onTap: () async {
                      if (_email.text.isNotEmpty && _emailErrorText == null) {
                        context
                            .read<AuthBloc>()
                            .add(AuthEventForgotPassword(email: _email.text));
                      }
                    },
                    child: Container(
                      width: 90 * Responsive().widthConfig,
                      height: 7 * Responsive().heightConfig,
                      decoration: BoxDecoration(
                        color:
                            (_email.text.isNotEmpty && _emailErrorText == null)
                                ? AppTheme.primaryLightColor
                                : Colors.grey,
                        borderRadius: BorderRadius.circular(
                          2 * Responsive().imageConfig,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "send email",
                          style: AppTheme.whiteText.button,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String? get _emailErrorText {
    final text = _email.text;
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(text);

    if (text.isNotEmpty && !emailValid) {
      return "wronge email";
    }

    return null;
  }
}
