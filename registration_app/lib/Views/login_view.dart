import 'package:flutter/material.dart';
import 'package:registration_app/Responsive/size_config.dart';
import 'package:registration_app/Widgets/space.dart';
import 'package:registration_app/Widgets/text_filed.dart';
import 'package:registration_app/constants/routes.dart';
import 'package:registration_app/style/images.dart';
import 'package:registration_app/style/style.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
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
            customTextField(
              controller: _emailController,
              hintText: "Email",
              icon: Icons.email,
            ),
            heightSpace(3),
            customTextField(
              controller: _passwordController,
              hintText: "Password",
              icon: Icons.password,
              isPassword: true,
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
            heightSpace(4),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 1 * SizeConfig.widthMultiplier!,
              ),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  width: 90 * SizeConfig.widthMultiplier!,
                  height: 7 * SizeConfig.heightMultiplier!,
                  decoration: BoxDecoration(
                    color: AppTheme.primaryLightColor,
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
