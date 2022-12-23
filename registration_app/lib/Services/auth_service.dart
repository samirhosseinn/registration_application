import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:http/http.dart';
import 'package:registration_app/Exceptions/exceptions.dart';
import 'package:registration_app/Profile/profile.dart';
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

  static Future<int> sendForgotPassword({required String email}) async {
    int otp = 1000 + Random().nextInt(9999 - 1000);

    sendForgotPasswordBody["email"] = email;
    sendForgotPasswordBody["otp"] = otp.toString();

    await post(url, body: sendForgotPasswordBody);
    return otp;
  }

  static Future<bool> checkUserExist({required String email}) async {
    checkUserExistBody["email"] = email;

    var res = await post(url, body: checkUserExistBody);
    if (utf8.decode(res.bodyBytes) == "true") {
      return true;
    } else {
      return false;
    }
  }

  static Future<void> changePassword({
    required String email,
    required String password,
  }) async {
    changePasswordBody["email"] = email;
    changePasswordBody["password"] = password;

    await post(url, body: changePasswordBody);
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
    await post(url, body: addProfileImageBody);

    // update cache
    Profile().imageUrl = data["data"]["url"];
  }
}
