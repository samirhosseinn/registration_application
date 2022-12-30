import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:http/http.dart';
import 'package:registration_app/Exceptions/exceptions.dart';
import 'package:registration_app/Singleton/Profile/profile.dart';
import 'package:registration_app/constants/server.dart';

class AuthService {
  static Future<Map> login({
    required String usernameOrEmail,
    required String password,
  }) async {
    loginBody["usernameOrEmail"] = usernameOrEmail;
    loginBody["password"] = password;
    try {
      var res = await post(url, body: loginBody);
      var data = json.decode(utf8.decode(res.bodyBytes));
      if (data == 404) {
        throw LoginAuthenticationException();
      }
      return data;
    } on LoginAuthenticationException {
      rethrow;
    } on SocketException {
      throw InternetConnectionException();
    } catch (_) {
      throw GenericException();
    }
  }

  static Future<void> register({
    required String email,
    required String username,
    required String password,
  }) async {
    registerBody["email"] = email;
    registerBody["username"] = username;
    registerBody["password"] = password;
    try {
      var res = await post(url, body: registerBody);
      var data = json.decode(utf8.decode(res.bodyBytes));
      if (data == 409) {
        throw UserAlreadyExistException();
      }
    } on UserAlreadyExistException {
      rethrow;
    } on SocketException {
      throw InternetConnectionException();
    } catch (_) {
      throw GenericException();
    }
  }

  static Future<int> sendOTP({required String email}) async {
    int otp = 1000 + Random().nextInt(9999 - 1000);

    sendOTPBody["email"] = email;
    sendOTPBody["otp"] = otp.toString();
    try {
      var res = await post(url, body: sendOTPBody);
      var data = json.decode(utf8.decode(res.bodyBytes));
      if (data != 200) {
        throw EmailNotSentException();
      }
      return otp;
    } on EmailNotSentException {
      rethrow;
    } on SocketException {
      throw InternetConnectionException();
    } catch (_) {
      throw GenericException();
    }
  }

  static Future<int> sendForgotPassword({required String email}) async {
    int otp = 1000 + Random().nextInt(9999 - 1000);

    sendForgotPasswordBody["email"] = email;
    sendForgotPasswordBody["otp"] = otp.toString();

    try {
      var res = await post(url, body: sendForgotPasswordBody);
      var data = json.decode(utf8.decode(res.bodyBytes));
      if (data != 200) {
        throw EmailNotSentException();
      }
      return otp;
    } on EmailNotSentException {
      rethrow;
    } on SocketException {
      throw InternetConnectionException();
    } catch (_) {
      throw GenericException();
    }
  }

  static Future<bool> checkUserExist({required String usernameOrEmail}) async {
    checkUserExistBody["usernameOrEmail"] = usernameOrEmail;

    try {
      var res = await post(url, body: checkUserExistBody);
      if (utf8.decode(res.bodyBytes) == "404") {
        return false;
      } else {
        return true;
      }
    } on SocketException {
      throw InternetConnectionException();
    } catch (_) {
      throw GenericException();
    }
  }

  static Future<void> changePassword({
    required String email,
    required String password,
  }) async {
    changePasswordBody["email"] = email;
    changePasswordBody["password"] = password;

    try {
      var res = await post(url, body: changePasswordBody);
      var data = json.decode(utf8.decode(res.bodyBytes));
      if (data != 200) {
        throw PasswordDoesntChnagedException();
      }
    } on PasswordDoesntChnagedException {
      rethrow;
    } on SocketException {
      throw InternetConnectionException();
    } catch (_) {
      throw GenericException();
    }
  }

  static Future<void> addName({
    required String email,
    required String name,
  }) async {
    addNameBody["email"] = email;
    addNameBody["name"] = name;
    await post(url, body: addNameBody);
  }

  static Future<void> uploadProfileImage({
    required String filePath,
  }) async {
    try {
      //convert image to base64
      final bytes = File(filePath).readAsBytesSync();
      String base64 = base64Encode(bytes);

      // send post request ro imgbb
      uploadProfileImageBody["image"] = base64;
      var res = await post(
        Uri.parse("https://api.imgbb.com/1/upload"),
        body: uploadProfileImageBody,
      );
      Map data = json.decode(utf8.decode(res.bodyBytes));

      // add profile image link to database
      addProfileImageBody["email"] = Profile().email;
      addProfileImageBody["image_url"] = data["data"]["url"];
      var res2 = await post(url, body: addProfileImageBody);
      var data2 = json.decode(utf8.decode(res2.bodyBytes));
      if (data2 != 200) {
        throw NameDoesntChangedExcpetion();
      }
      // update cache
      Profile().imageUrl = data["data"]["url"];
    } on NameDoesntChangedExcpetion {
      rethrow;
    } on SocketException {
      throw InternetConnectionException();
    } catch (_) {
      throw GenericException();
    }
  }
}
