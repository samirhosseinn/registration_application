import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract class AuthState {
  final bool isLoading;
  final String? loadingText;
  const AuthState(
      {required this.isLoading, this.loadingText = "please wait a moment"});
}

class RenderingState extends AuthState {
  const RenderingState() : super(isLoading: false);
}

class AuthStateLogin extends AuthState {
  final Exception? exception;
  const AuthStateLogin({
    bool isLoading = false,
    String? loadingText,
    this.exception,
  }) : super(
          isLoading: isLoading,
          loadingText: loadingText,
        );
}

class AuthStateRegister extends AuthState {
  final Exception? exception;
  const AuthStateRegister({
    bool isLoading = false,
    String? loadingText,
    this.exception,
  }) : super(
          isLoading: isLoading,
          loadingText: loadingText,
        );
}

class AuthStateConfirmEmail extends AuthState {
  final int otp;
  final String username;
  final String email;
  final String password;
  final bool isUserRegistered;
  final Exception? exception;
  const AuthStateConfirmEmail({
    bool isLoading = false,
    String? loadingText,
    required this.otp,
    required this.email,
    required this.username,
    required this.password,
    required this.isUserRegistered,
    this.exception,
  }) : super(
          isLoading: isLoading,
          loadingText: loadingText,
        );
}

class AuthStateForgotPassword extends AuthState {
  final Exception? exception;
  const AuthStateForgotPassword({
    bool isLoading = false,
    String? loadingText,
    this.exception,
  }) : super(
          isLoading: isLoading,
          loadingText: loadingText,
        );
}

class AuthStateChangePassword extends AuthState {
  final String email;
  final Exception? exception;
  const AuthStateChangePassword({
    bool isLoading = false,
    String? loadingText,
    required this.email,
    this.exception,
  }) : super(
          isLoading: isLoading,
          loadingText: loadingText,
        );
}

class AuthStateProfile extends AuthState {
  final bool isShowed;
  final Exception? exception;
  const AuthStateProfile({
    bool isLoading = false,
    String? loadingText,
    this.isShowed = false,
    this.exception,
  }) : super(
          isLoading: isLoading,
          loadingText: loadingText,
        );
}
