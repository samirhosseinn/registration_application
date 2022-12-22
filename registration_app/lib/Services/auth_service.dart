import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart';
import 'package:registration_app/Exceptions/exceptions.dart';
import 'package:registration_app/constants/server.dart';

class AuthService {
  static Future<Map> login({
    required String usernameOrEmail,
    required String password,
  }) async {
    loginBody["usernameOrEmail"] = usernameOrEmail;
    loginBody["password"] = password;
    var res = await post(url, body: loginBody);
    try {
      Map data = json.decode(utf8.decode(res.bodyBytes));
      return data;
    } catch (_) {
      throw CanNotLoginAuthException();
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
    var res = await post(url, body: registerBody);
    int statusCode = int.parse(utf8.decode(res.bodyBytes));
    if (statusCode != 0) {
      throw UserAlredyExistAuthException();
    }
  }

  static Future<int> sendOTP({required String email}) async {
    int otp = 1000 + Random().nextInt(9999 - 1000);

    sendOTPBody["email"] = email;
    sendOTPBody["otp"] = otp.toString();

    await post(url, body: sendOTPBody);
    return otp;
  }
}
