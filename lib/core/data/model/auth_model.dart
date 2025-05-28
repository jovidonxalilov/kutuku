class AuthModel {
  // final int id;
  final String username;
  final String email;
  final String password;

  AuthModel({
    // required this.id,
      required this.email,
      required this.password,
      required this.username});

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
        // id: json['id'],
        email: json['email'] ?? "",
        password: json['password'] ?? "",
        username: json['username'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      // 'id': id,
      'email': email,
      'password': password,
      'username': username,
    };
  }
}
