class Profile {
  String username;
  String email;

  Profile._sharedConstructor({required this.username, required this.email});
  static final Profile _shared =
      Profile._sharedConstructor(username: "", email: "");
  factory Profile() => _shared;
}
