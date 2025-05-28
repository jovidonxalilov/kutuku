sealed class AuthEvent {}

class AuthLoad extends AuthEvent {
  final String email;
  final String password;
  final String username;


  AuthLoad({
    required this.email,
    required this.password,
    required this.username,
  });

  @override
  List<Object?> get props => [email, password, username];
}