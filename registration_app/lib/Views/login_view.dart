import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration_app/Bloc/auth_bloc.dart';
import 'package:registration_app/Bloc/auth_event.dart';
import 'package:registration_app/Bloc/auth_state.dart';
import 'package:registration_app/Exceptions/exceptions.dart';
import 'package:registration_app/Responsive/responsive.dart';
import 'package:registration_app/Widgets/dialogs.dart';
import 'package:registration_app/Widgets/space.dart';
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
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) async {
        if (state is AuthStateLogin) {
          if (state.exception is LoginAuthenticationException) {
            await showErrorDiaog(
              context: context,
              text: "wrong credential",
            );
          } else if (state.exception is InternetConnectionException) {
            await showErrorDiaog(
              context: context,
              text: "check your internet connection",
            );
          } else if (state.exception is GenericException) {
            await showErrorDiaog(
              context: context,
              text: "please try again later",
            );
          }
        }
      },
      child: Scaffold(
        body: DoubleBackToCloseApp(
          snackBar: SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text(
              "Tap back button again to close app",
              style: AppTheme.whiteText.subtitle1,
              textAlign: TextAlign.center,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 5 * Responsive().widthConfig,
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(
                      Images.login,
                      width: 90 * Responsive().widthConfig,
                      height: 40 * Responsive().heightConfig,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Login",
                        style: AppTheme.darkPrimaryText.headline5,
                      ),
                    ),
                    heightSpace(5),
                    TextField(
                      onChanged: (_) => setState(() => {}),
                      controller: _usernameController,
                      decoration: InputDecoration(
                        hintText: "username or email",
                        hintStyle: AppTheme.greyText.subtitle1,
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
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "password",
                        hintStyle: AppTheme.greyText.subtitle1,
                        prefixIcon: Icon(
                          Icons.password,
                          color: Colors.grey,
                          size: 5 * Responsive().imageConfig,
                        ),
                      ),
                    ),
                    heightSpace(8),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          context
                              .read<AuthBloc>()
                              .add(const AuthEventForgotPassword());
                        },
                        child: Text(
                          "forgot password?",
                          style: AppTheme.lightPrimaryText.subtitle1,
                        ),
                      ),
                    ),
                    heightSpace(1),
                    GestureDetector(
                      onTap: () async {
                        if (_usernameController.text.isNotEmpty &&
                            _passwordController.text.isNotEmpty) {
                          context.read<AuthBloc>().add(AuthEventLogin(
                                usernameOrEmail: _usernameController.text,
                                password: _passwordController.text,
                              ));
                        }
                      },
                      child: Container(
                        width: 90 * Responsive().widthConfig,
                        height: 7 * Responsive().heightConfig,
                        decoration: BoxDecoration(
                          color: (_usernameController.text.isNotEmpty &&
                                  _passwordController.text.isNotEmpty)
                              ? AppTheme.primaryLightColor
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(
                            2 * Responsive().imageConfig,
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
                    heightSpace(4),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("New ?", style: AppTheme.greyText.subtitle1),
                        TextButton(
                          onPressed: () {
                            context
                                .read<AuthBloc>()
                                .add(const AuthEventRegister());
                          },
                          child: Text(
                            "Register",
                            style: AppTheme.blueText.subtitle1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
