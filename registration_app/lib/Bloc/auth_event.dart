import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract class AuthEvent {
  const AuthEvent();
}

class AuthEventLogin extends AuthEvent {
  final String? usernameOrEmail;
  final String? password;

  const AuthEventLogin({this.usernameOrEmail, this.password});
}

class AuthEventRegister extends AuthEvent {
  final String? email;
  final String? username;
  final String? password;
  const AuthEventRegister({
    this.username,
    this.email,
    this.password,
  });
}

class AuthEventResendOTP extends AuthEvent {
  final int otp;
  final String username;
  final String email;
  final String password;
  final bool isUserRegistered;
  const AuthEventResendOTP({
    required this.otp,
    required this.username,
    required this.email,
    required this.password,
    required this.isUserRegistered,
  });
}

class AuthEventConfirmEmail extends AuthEvent {
  final int otp;
  final String username;
  final String email;
  final String password;
  const AuthEventConfirmEmail({
    required this.otp,
    required this.username,
    required this.email,
    required this.password,
  });
}

class AuthEventForgotPassword extends AuthEvent {
  final String? email;
  const AuthEventForgotPassword({this.email});
}

class AuthEventChangePassword extends AuthEvent {
  final String email;
  final String? password;
  const AuthEventChangePassword({
    required this.email,
    this.password,
  });
}

class AuthEventProfile extends AuthEvent {
  const AuthEventProfile();
}

class AuthEventAddName extends AuthEvent {
  final String name;
  const AuthEventAddName({required this.name});
}
