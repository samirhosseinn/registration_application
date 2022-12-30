class Register {
  String email;
  String username;
  String password;
  int otp;

  Register._sharedConstructor({
    required this.email,
    required this.username,
    required this.password,
    required this.otp,
  });

  static final Register _shared = Register._sharedConstructor(
    email: "",
    username: "",
    password: "",
    otp: 0,
  );

  factory Register() => _shared;
}
