import 'package:flutter/material.dart';
import 'package:registration_app/Responsive/size_config.dart';
import 'package:registration_app/Views/confrim_email_view.dart';
import 'package:registration_app/Views/forgot_password_view.dart';
import 'package:registration_app/Views/login_view.dart';
import 'package:registration_app/Views/main_view.dart';
import 'package:registration_app/Views/register_view.dart';
import 'package:registration_app/constants/routes.dart';

void main() {
  runApp(LayoutBuilder(
    builder: ((context, constraints) {
      return OrientationBuilder(
        builder: ((context, orientation) {
          SizeConfig().init(constraints, orientation);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: const MyApp(),
            routes: {
              loginViewRoute: (context) => const LoginView(),
              registerViewRoute: (context) => const RegisterView(),
              confrimEmailRoute: (context) => const ConfrimEmailView(),
              forgotPasswordViewRoute: (context) => const ForgotPasswordView(),
              mainViewRoute: (context) => const MainView(),
            },
          );
        }),
      );
    }),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    goToLoginView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) => const Center(
          child: Text("Welcom"),
        ),
      ),
    );
  }

  void goToLoginView() async {
    await Future.delayed(const Duration(seconds: 1));
    if (!mounted) return;
    Navigator.of(context).pushNamedAndRemoveUntil(
      loginViewRoute,
      (route) => false,
    );
  }
}
