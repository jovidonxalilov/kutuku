import 'package:bloc/bloc.dart';
import 'package:kutuku/core/data/repository/product_repository.dart';
import 'package:kutuku/features/user/manager/user_event.dart';
import 'package:kutuku/features/user/manager/user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final ProductRepository _repo;

  UserBloc({required ProductRepository repo}): _repo = repo,
  super(UserState.initial()) {
    on<UserLoadEvent>(_load);
    // add(UserLoadEvent());
  }

  Future<void> _load(UserLoadEvent event, Emitter<UserState> emit) async {
    try {
      emit(state.copyWith(status: UserStatus.loading));
      final detail = await _repo.fetchUser();
      emit(state.copyWith(user: detail,status: UserStatus.idle));
    } catch (e) {
      emit(state.copyWith(status: UserStatus.error, errorMessage: e.toString()));
    }
  }
}