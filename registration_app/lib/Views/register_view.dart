import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:registration_app/Exceptions/exceptions.dart';
import 'package:registration_app/Responsive/responsive.dart';

import 'package:registration_app/Services/auth_service.dart';
import 'package:registration_app/Widgets/space.dart';
import 'package:registration_app/constants/routes.dart';
import 'package:registration_app/style/images.dart';
import 'package:registration_app/style/style.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _usernameController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _usernameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
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
                Images.register,
                width: 90 * Responsive().widthConfig,
                height: 40 * Responsive().heightConfig,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Register",
                  style: AppTheme.darkPrimaryText.headline5,
                ),
              ),
              heightSpace(5),
              TextField(
                onChanged: (_) => setState(() => {}),
                controller: _usernameController,
                decoration: InputDecoration(
                  hintText: "Username",
                  hintStyle: AppTheme.greyText.subtitle1,
                  errorText: _usernameErrorText,
                  errorStyle: TextStyle(
                    color: Colors.red,
                    fontFamily: AppTheme.primaryFontFamily,
                  ),
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.grey,
                    size: 5 * Responsive().imageConfig,
                  ),
                ),
              ),
              heightSpace(3),
              TextField(
                onChanged: (_) => setState(() => {}),
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: "Email",
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
              heightSpace(3),
              TextField(
                onChanged: (_) => setState(() => {}),
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: AppTheme.greyText.subtitle1,
                  errorText: _passwordErrorText,
                  errorStyle: TextStyle(
                    color: Colors.red,
                    fontFamily: AppTheme.primaryFontFamily,
                  ),
                  prefixIcon: Icon(
                    Icons.password,
                    color: Colors.grey,
                    size: 5 * Responsive().imageConfig,
                  ),
                ),
              ),
              heightSpace(4),
              GestureDetector(
                onTap: () async {
                  if (_passwordErrorText == null &&
                      _emailErrorText == null &&
                      _usernameErrorText == null &&
                      _emailController.text.isNotEmpty &&
                      _passwordController.text.isNotEmpty &&
                      _usernameController.text.isNotEmpty) {
                    try {
                      await AuthService.register(
                        email: _emailController.text,
                        username: _usernameController.text,
                        password: _passwordController.text,
                      );
                      log("registred");
                      if (!mounted) return;
                      Navigator.of(context).pushNamed(loginViewRoute);
                    } on UserAlredyExistAuthException {
                      log("user already exist");
                    }
                  }
                },
                child: Container(
                  width: 90 * Responsive().widthConfig,
                  height: 7 * Responsive().heightConfig,
                  decoration: BoxDecoration(
                    color: (_passwordErrorText == null &&
                            _emailErrorText == null &&
                            _usernameErrorText == null &&
                            _emailController.text.isNotEmpty &&
                            _passwordController.text.isNotEmpty &&
                            _usernameController.text.isNotEmpty)
                        ? AppTheme.primaryLightColor
                        : Colors.grey,
                    borderRadius: BorderRadius.circular(
                      2 * Responsive().imageConfig,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Register",
                      style: AppTheme.whiteText.button,
                    ),
                  ),
                ),
              ),
              heightSpace(4),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("have an account ?", style: AppTheme.greyText.subtitle1),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(loginViewRoute);
                    },
                    child: Text(
                      "Login",
                      style: AppTheme.blueText.subtitle1,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? get _passwordErrorText {
    final text = _passwordController.text;

    if (text.isNotEmpty && text.length < 8) {
      return "short password";
    }
    return null;
  }

  String? get _emailErrorText {
    final text = _emailController.text;
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(text);

    if (text.isNotEmpty && !emailValid) {
      return "wronge email";
    }

    return null;
  }

  String? get _usernameErrorText {
    final text = _usernameController.text;

    if (text.isNotEmpty && text.length < 5) {
      return "short username";
    }

    return null;
  }
}
