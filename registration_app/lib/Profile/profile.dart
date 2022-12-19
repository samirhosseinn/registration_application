class Profile {
  String username;
  String email;
  String? name;

  Profile._sharedConstructor({
    required this.username,
    required this.email,
    required this.name,
  });
  static final Profile _shared = Profile._sharedConstructor(
    username: "",
    email: "",
    name: null,
  );
  factory Profile() => _shared;
}
