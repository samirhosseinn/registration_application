import 'package:flutter/material.dart';
import 'package:registration_app/Profile/profile.dart';
import 'package:registration_app/Responsive/responsive.dart';

import 'package:registration_app/Widgets/space.dart';
import 'package:registration_app/constants/routes.dart';
import 'package:registration_app/style/style.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: 100 * Responsive().widthConfig,
            height: 40 * Responsive().heightConfig,
            decoration: BoxDecoration(
              color: AppTheme.primaryLightColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(
                  10 * Responsive().imageConfig,
                ),
                bottomRight: Radius.circular(
                  10 * Responsive().imageConfig,
                ),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 32 * Responsive().widthConfig,
                    height: 15 * Responsive().heightConfig,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 0.4 * Responsive().imageConfig,
                      ),
                      borderRadius: BorderRadius.circular(
                        100 * Responsive().imageConfig,
                      ),
                    ),
                    child: Icon(
                      Icons.person_rounded,
                      size: 20 * Responsive().imageConfig,
                      color: Colors.white,
                    ),
                  ),
                  heightSpace(2),
                  Profile().name != null
                      ? Text(
                          Profile().name!,
                          style: AppTheme.whiteText.button,
                        )
                      : Text(
                          "+ add name",
                          style: AppTheme.whiteText.subtitle1,
                        ),
                  heightSpace(1),
                  Text(
                    Profile().email,
                    style: AppTheme.whiteText.button,
                  )
                ],
              ),
            ),
          ),
          heightSpace(10),
          Container(
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
                Profile().username,
                style: AppTheme.whiteText.button,
              ),
            ),
          ),
          heightSpace(25),
          GestureDetector(
            onTap: () {
              Profile().name = null;
              Profile().username = "";
              Profile().email = "";
              Navigator.of(context).pushNamedAndRemoveUntil(
                loginViewRoute,
                (route) => false,
              );
            },
            child: Icon(
              Icons.logout,
              size: 20 * Responsive().imageConfig,
              color: AppTheme.primaryDarkColor,
            ),
          ),
        ],
      ),
    );
  }
}
