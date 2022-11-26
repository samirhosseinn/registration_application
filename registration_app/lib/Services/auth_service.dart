import 'dart:convert';
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
}
