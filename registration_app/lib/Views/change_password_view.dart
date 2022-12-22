import 'package:flutter/material.dart';
import 'package:registration_app/Responsive/responsive.dart';
import 'package:registration_app/Services/auth_service.dart';
import 'package:registration_app/Widgets/space.dart';
import 'package:registration_app/constants/routes.dart';
import 'package:registration_app/style/images.dart';
import 'package:registration_app/style/style.dart';

class ChangePasswordView extends StatefulWidget {
  final String email;
  const ChangePasswordView({
    super.key,
    required this.email,
  });

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  late final TextEditingController _password;
  late final TextEditingController _rePassword;

  @override
  void initState() {
    _password = TextEditingController();
    _rePassword = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _password.dispose();
    _rePassword.dispose();
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
                Images.forgotPassword,
                width: 90 * Responsive().widthConfig,
                height: 40 * Responsive().heightConfig,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Enter your new password",
                  style: AppTheme.darkPrimaryText.button,
                ),
              ),
              heightSpace(5),
              TextField(
                onChanged: (_) => setState(() => {}),
                controller: _password,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "password",
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
              heightSpace(5),
              TextField(
                onChanged: (_) => setState(() => {}),
                controller: _rePassword,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "re-enter your password",
                  hintStyle: AppTheme.greyText.subtitle1,
                  errorText: _rePasswordErrorText,
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
              heightSpace(10),
              GestureDetector(
                onTap: () async {
                  if (_password.text.isNotEmpty &&
                      _rePassword.text.isNotEmpty &&
                      _passwordErrorText == null &&
                      _rePasswordErrorText == null) {
                    await AuthService.changePassword(
                      email: widget.email,
                      password: _password.text,
                    );

                    if (!mounted) return;
                    Navigator.of(context).pushNamed(loginViewRoute);
                  }
                },
                child: Container(
                  width: 90 * Responsive().widthConfig,
                  height: 7 * Responsive().heightConfig,
                  decoration: BoxDecoration(
                    color: (_password.text.isNotEmpty &&
                            _rePassword.text.isNotEmpty &&
                            _passwordErrorText == null &&
                            _rePasswordErrorText == null)
                        ? AppTheme.primaryLightColor
                        : Colors.grey,
                    borderRadius: BorderRadius.circular(
                      5 * Responsive().imageConfig,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "change password",
                      style: AppTheme.whiteText.button,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? get _passwordErrorText {
    final text = _password.text;

    if (text.isNotEmpty && text.length < 8) {
      return "short password";
    }
    return null;
  }

  String? get _rePasswordErrorText {
    final text = _rePassword.text;

    if (text.isNotEmpty && text != _password.text) {
      return "passwords not mached";
    }

    return null;
  }
}
