import 'package:kutuku/core/data/model/user_mode.dart';

enum UserStatus {loading, idle,  error }

class UserState {
  final UserStatus status;
  final List<UserModel> user;
  final String? errorMessage;

  UserState(
      {required this.errorMessage, required this.status, required this.user});

  factory UserState.initial() {
    return UserState(status: UserStatus.idle, user: [], errorMessage: null);
  }

  UserState copyWith({
    List<UserModel>? user,
    UserStatus? status,
    String? errorMessage,
  }) {
    return UserState(
        status: status ?? this.status,
        user: user ?? this.user,
        errorMessage: errorMessage ?? this.errorMessage);
  }

  // @override
  // Future<List<Object?>> get props async => [status, user, errorMessage];
}
