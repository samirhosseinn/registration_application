import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:registration_app/Responsive/size_config.dart';
import 'package:registration_app/Widgets/space.dart';
import 'package:registration_app/constants/routes.dart';
import 'package:registration_app/style/images.dart';
import 'package:registration_app/style/style.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _emailOrUsernameController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    _emailOrUsernameController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailOrUsernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 5 * SizeConfig.widthMultiplier!,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              Images.login,
            ),
            Text(
              "Login",
              style: AppTheme.darkPrimaryText.headline5,
            ),
            heightSpace(5),
            TextField(
              onChanged: (_) => setState(() => {}),
              controller: _emailOrUsernameController,
              decoration: InputDecoration(
                hintText: "Email or Username",
                hintStyle: AppTheme.greyText.subtitle1,
                errorText: _emailErrorText,
                errorStyle: TextStyle(
                  color: Colors.red,
                  fontFamily: AppTheme.primaryFontFamily,
                ),
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.grey,
                  size: 5 * SizeConfig.imageSizeMultiplier!,
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
                  size: 5 * SizeConfig.imageSizeMultiplier!,
                ),
              ),
            ),
            heightSpace(2),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(forgotPasswordViewRoute);
                },
                child: Text(
                  "Forgot Password?",
                  style: AppTheme.blueText.subtitle1,
                ),
              ),
            ),
            heightSpace(8),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 1 * SizeConfig.widthMultiplier!,
              ),
              child: GestureDetector(
                onTap: () {
                  if(_passwordErrorText == null &&
                      _emailErrorText == null &&
                      _emailOrUsernameController.text.isNotEmpty &&
                      _passwordController.text.isNotEmpty){
                        log("logging in ...");
                      }
                },
                child: Container(
                  width: 90 * SizeConfig.widthMultiplier!,
                  height: 7 * SizeConfig.heightMultiplier!,
                  decoration: BoxDecoration(
                    color: (_passwordErrorText == null &&
                            _emailErrorText == null &&
                            _emailOrUsernameController.text.isNotEmpty &&
                            _passwordController.text.isNotEmpty)
                        ? AppTheme.primaryLightColor
                        : Colors.grey,
                    borderRadius: BorderRadius.circular(
                      2 * SizeConfig.imageSizeMultiplier!,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Login",
                      style: AppTheme.whiteText.button,
                    ),
                  ),
                ),
              ),
            ),
            heightSpace(4),
            Padding(
              padding: EdgeInsets.only(
                left: 28 * SizeConfig.widthMultiplier!,
              ),
              child: Row(
                children: [
                  Text("New ?", style: AppTheme.greyText.subtitle1),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(registerViewRoute);
                    },
                    child: Text(
                      "Register",
                      style: AppTheme.blueText.subtitle1,
                    ),
                  ),
                ],
              ),
            ),
          ],
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
    final text = _emailOrUsernameController.text;
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(text);

    if (text.isNotEmpty && !emailValid) {
      return "wronge email";
    }

    return null;
  }
}
