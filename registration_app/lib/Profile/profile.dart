class Profile {
  String username;
  String email;
  String? name;
  String? imageUrl;

  Profile._sharedConstructor({
    required this.username,
    required this.email,
    required this.name,
    required this.imageUrl,
  });
  static final Profile _shared = Profile._sharedConstructor(
    username: "",
    email: "",
    name: null,
    imageUrl: null,
  );
  factory Profile() => _shared;
}
