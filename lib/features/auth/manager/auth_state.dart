
import 'package:kutuku/core/data/model/auth_model.dart';

enum AuthStatus { idle, loading, error }

class AuthState {
  final AuthModel? auth;
  final AuthStatus status;

  AuthState({required this.status, required this.auth});

  factory AuthState.initial() {
    return AuthState(status: AuthStatus.idle, auth: null);
  }

  AuthState copyWith({
    AuthModel? auth,
    AuthStatus? status,
  }) {
    return AuthState(
      status: status ?? this.status,
      auth: auth ?? this.auth,
    );
  }
}
