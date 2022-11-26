const user = "root";
const pass = "";

final url = Uri.parse("http://192.168.1.102:5000");
final Map loginBody = {
  "user": user,
  "pass": pass,
  "mode": "login",
  "usernameOrEmail": "",
  "password": "",
};

final Map registerBody = {
  "user": user,
  "pass": pass,
  "mode": "register",
  "email": "",
  "username": "",
  "password": "",
};
