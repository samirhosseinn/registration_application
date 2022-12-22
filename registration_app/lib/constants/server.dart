const user = "root";
const pass = "";

final url = Uri.parse("http://192.168.1.102:5000");
final Map loginBody = {
  "user": user,
  "pass": pass,
  "mode": "login",
  "usernameOrEmail": null,
  "password": null,
};

final Map registerBody = {
  "user": user,
  "pass": pass,
  "mode": "register",
  "email": null,
  "username": null,
  "password": null,
};

final Map sendOTPBody = {
  "user": user,
  "pass": pass,
  "mode": "sendOtp",
  "email": null,
  "otp": null,
};

final Map sendForgotPasswordBody = {
  "user": user,
  "pass": pass,
  "mode": "sendForgotPassword",
  "email": null,
  "otp": null,
};

final Map checkUserExistBody = {
  "user": user,
  "pass": pass,
  "mode": "checkUserExist",
  "email": null,
};

final Map changePasswordBody = {
  "user": user,
  "pass": pass,
  "mode": "changePassword",
  "email": null,
  "password": null,
};

final Map addNameBody = {
  "user": user,
  "pass": pass,
  "mode": "addName",
  "email": null,
  "name": null,
};
