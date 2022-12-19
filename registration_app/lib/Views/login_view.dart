import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:registration_app/Exceptions/exceptions.dart';
import 'package:registration_app/Profile/profile.dart';
import 'package:registration_app/Responsive/size_config.dart';
import 'package:registration_app/Services/auth_service.dart';
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
  late final TextEditingController _usernameController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
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
              controller: _usernameController,
              decoration: InputDecoration(
                hintText: "Username",
                hintStyle: AppTheme.greyText.subtitle1,
                prefixIcon: Icon(
                  Icons.person,
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
                prefixIcon: Icon(
                  Icons.password,
                  color: Colors.grey,
                  size: 5 * SizeConfig.imageSizeMultiplier!,
                ),
              ),
            ),
            heightSpace(8),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 1 * SizeConfig.widthMultiplier!,
              ),
              child: GestureDetector(
                onTap: () async {
                  if (_usernameController.text.isNotEmpty &&
                      _passwordController.text.isNotEmpty) {
                    try {
                      Map userData = await AuthService.login(
                        usernameOrEmail: _usernameController.text,
                        password: _passwordController.text,
                      );
                      Profile().email = userData["email"];
                      Profile().username = userData["username"];
                      Profile().name =
                          userData["name"].isNotEmpty ? userData["name"] : null;
                      if (!mounted) return;
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        profileViewRoute,
                        (route) => false,
                      );
                    } on CanNotLoginAuthException {
                      log("could not login");
                    }
                  }
                },
                child: Container(
                  width: 90 * SizeConfig.widthMultiplier!,
                  height: 7 * SizeConfig.heightMultiplier!,
                  decoration: BoxDecoration(
                    color: (_usernameController.text.isNotEmpty &&
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
}
