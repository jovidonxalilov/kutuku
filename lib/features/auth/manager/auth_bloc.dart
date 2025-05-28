

import 'package:bloc/bloc.dart';
import 'package:kutuku/core/data/repository/auth_repository.dart';
import 'package:kutuku/features/auth/manager/auth_event.dart';
import 'package:kutuku/features/auth/manager/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _repo;

  AuthBloc({required AuthRepository repo})
      : _repo = repo,
        super(AuthState.initial()) {
    on<AuthLoad>(_load);
  }

  Future<void> _load( event, Emitter<AuthState> emit) async {
    try {
      emit(state.copyWith(status: AuthStatus.loading));
      final auth = await _repo.register(email: event.email, password: event.password, username: event.username);
      emit(state.copyWith(status: AuthStatus.idle, auth: auth));
    } catch (e) {
      emit(state.copyWith(status: AuthStatus.error));
    }
  }
}
