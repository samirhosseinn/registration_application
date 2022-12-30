import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration_app/Bloc/auth_bloc.dart';
import 'package:registration_app/Bloc/auth_event.dart';
import 'package:registration_app/Bloc/auth_state.dart';
import 'package:registration_app/Responsive/responsive.dart';
import 'package:registration_app/Views/ChangePassword/change_password_view.dart';
import 'package:registration_app/Views/ChangePassword/forgot_password_view.dart';
import 'package:registration_app/Views/Register/confrim_email_view.dart';
import 'package:registration_app/Views/login_view.dart';
import 'package:registration_app/Views/profile_view.dart';
import 'package:registration_app/Views/Register/register_view.dart';
import 'package:registration_app/helpers/loading/loading_screen.dart';

void main() {
  runApp(LayoutBuilder(
    builder: (context, constraints) {
      Responsive().init(constraints: constraints);
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(),
          child: Builder(
            builder: (context) => const MyApp(),
          ),
        ),
      );
    },
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.isLoading) {
          LoadingScreen().show(
            context: context,
            text: state.loadingText ?? "please wait a moment",
          );
        } else {
          LoadingScreen().hide();
        }
      },
      builder: (context, state) {
        if (state is AuthStateLogin) {
          return const LoginView();
        } else if (state is AuthStateRegister) {
          return const RegisterView();
        } else if (state is AuthStateConfirmEmail) {
          return ConfirmEmailView(
            otp: state.otp,
            username: state.username,
            email: state.email,
            password: state.password,
            isUserRegistered: state.isUserRegistered,
          );
        } else if (state is AuthStateProfile) {
          return const ProfileView();
        } else if (state is AuthStateForgotPassword) {
          return const ForgotPasswordView();
        } else if (state is AuthStateChangePassword) {
          return ChangePasswordView(email: state.email);
        } else {
          return const RenderingView();
        }
      },
    );
  }
}

class RenderingView extends StatefulWidget {
  const RenderingView({super.key});

  @override
  State<RenderingView> createState() => _RenderingViewState();
}

class _RenderingViewState extends State<RenderingView> {
  @override
  void initState() {
    renderSizeConfig();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  void renderSizeConfig() async {
    await Future.delayed(const Duration(seconds: 1));
    if (!mounted) return;
    context.read<AuthBloc>().add(const AuthEventLogin());
  }
}
