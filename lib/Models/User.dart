class User {
  final String userId;
  final String username;
  final String email;
  final String pfp;

  User(
      {required this.userId,
      required this.username,
      required this.email,
      required this.pfp});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['user_id'],
      username: json['username'],
      email: json['email'],
      pfp: json['pfp'],
    );
  }
}
