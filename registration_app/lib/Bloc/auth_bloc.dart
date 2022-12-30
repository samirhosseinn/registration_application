import 'package:bloc/bloc.dart';
import 'package:registration_app/Bloc/auth_event.dart';
import 'package:registration_app/Bloc/auth_state.dart';
import 'package:registration_app/Exceptions/exceptions.dart';
import 'package:registration_app/Services/auth_service.dart';
import 'package:registration_app/Singleton/Profile/profile.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const RenderingState()) {
    on<AuthEventLogin>((event, emit) async {
      if (event.password != null) {
        emit(const AuthStateLogin(isLoading: true));
        try {
          Map userData = await AuthService.login(
            usernameOrEmail: event.usernameOrEmail!,
            password: event.password!,
          );
          Profile().email = userData["email"];
          Profile().username = userData["username"];
          Profile().name =
              userData["name"].isNotEmpty ? userData["name"] : null;
          Profile().imageUrl =
              userData["image_url"].isNotEmpty ? userData["image_url"] : null;
          emit(const AuthStateProfile());
        } on Exception catch (e) {
          emit(AuthStateLogin(exception: e));
        }
      } else {
        emit(const AuthStateLogin());
      }
    });

    on<AuthEventRegister>((event, emit) async {
      if (event.email != null) {
        emit(const AuthStateRegister(isLoading: true));
        try {
          if (await AuthService.checkUserExist(
                  usernameOrEmail: event.username!) ||
              await AuthService.checkUserExist(usernameOrEmail: event.email!)) {
            throw UserAlreadyExistException();
          }
          int otp = await AuthService.sendOTP(
            email: event.email!,
          );
          emit(AuthStateConfirmEmail(
            otp: otp,
            email: event.email!,
            username: event.username!,
            password: event.password!,
            isUserRegistered: false,
          ));
        } on Exception catch (e) {
          emit(AuthStateRegister(exception: e));
        }
      } else {
        emit(const AuthStateRegister());
      }
    });

    on<AuthEventConfirmEmail>((event, emit) async {
      emit(AuthStateConfirmEmail(
        isLoading: true,
        otp: event.otp,
        username: event.username,
        email: event.email,
        password: event.password,
        isUserRegistered: false,
      ));

      try {
        await AuthService.register(
          email: event.email,
          username: event.username,
          password: event.password,
        );
        emit(AuthStateConfirmEmail(
          otp: event.otp,
          username: event.username,
          email: event.email,
          password: event.password,
          isUserRegistered: false,
          exception: RegisteredSuccessfully(),
        ));
      } on Exception catch (e) {
        emit(AuthStateConfirmEmail(
          otp: event.otp,
          username: event.username,
          email: event.email,
          password: event.password,
          isUserRegistered: false,
          exception: e,
        ));
      }
    });

    on<AuthEventResendOTP>((event, emit) async {
      emit(AuthStateConfirmEmail(
        isLoading: true,
        otp: 0,
        username: event.username,
        email: event.email,
        password: event.password,
        isUserRegistered: event.isUserRegistered,
      ));
      try {
        if (event.isUserRegistered) {
          int newOtp = await AuthService.sendForgotPassword(email: event.email);
          emit(AuthStateConfirmEmail(
            otp: newOtp,
            username: event.username,
            email: event.email,
            password: event.password,
            isUserRegistered: event.isUserRegistered,
          ));
        } else {
          int newOtp = await AuthService.sendOTP(email: event.email);
          emit(AuthStateConfirmEmail(
            otp: newOtp,
            username: event.username,
            email: event.email,
            password: event.password,
            isUserRegistered: event.isUserRegistered,
          ));
        }
      } on Exception catch (e) {
        emit(AuthStateConfirmEmail(
          otp: event.otp,
          username: event.username,
          email: event.email,
          password: event.password,
          isUserRegistered: event.isUserRegistered,
          exception: e,
        ));
      }
    });

    on<AuthEventForgotPassword>((event, emit) async {
      if (event.email != null) {
        emit(const AuthStateForgotPassword(isLoading: true));
        try {
          if (!await AuthService.checkUserExist(
              usernameOrEmail: event.email!)) {
            throw UserNotExistException();
          }
          int otp = await AuthService.sendForgotPassword(email: event.email!);
          emit(AuthStateConfirmEmail(
            otp: otp,
            username: "",
            email: event.email!,
            password: "",
            isUserRegistered: true,
          ));
        } on Exception catch (e) {
          emit(AuthStateForgotPassword(exception: e));
        }
      } else {
        emit(const AuthStateForgotPassword());
      }
    });

    on<AuthEventChangePassword>((event, emit) async {
      if (event.password != null) {
        emit(AuthStateChangePassword(
          email: event.email,
          isLoading: true,
        ));
        try {
          await AuthService.changePassword(
            email: event.email,
            password: event.password!,
          );
          emit(AuthStateChangePassword(
            email: event.email,
            exception: PasswordChangedSuccessfully(),
          ));
        } on Exception catch (e) {
          emit(AuthStateChangePassword(
            email: event.email,
            exception: e,
          ));
        }
      } else {
        emit(AuthStateChangePassword(email: event.email));
      }
    });

    on<AuthEventAddName>((event, emit) async {
      emit(const AuthStateProfile(isLoading: true, isShowed: true));
      try {
        await AuthService.addName(
          email: Profile().email,
          name: event.name,
        );
        Profile().name = event.name;
        emit(const AuthStateProfile());
      } on Exception catch (e) {
        emit(AuthStateProfile(exception: e));
      }
    });
  }
}
