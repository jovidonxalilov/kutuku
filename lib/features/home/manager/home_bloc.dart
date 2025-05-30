
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kutuku/core/data/repository/product_repository.dart';
import 'package:kutuku/features/home/manager/home_event.dart';
import 'package:kutuku/features/home/manager/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  final ProductRepository _repo;

  HomeBloc({required ProductRepository repo}): _repo = repo,
  super(HomeState.initial()) {
    on<HomeLoadEvent>(_load);
  }

  Future<void> _load(HomeEvent event, Emitter<HomeState> emit)async {
    try {
      emit(state.copyWith(status: HomeStatus.loading));
      final product = await _repo.fetchProduct();
      emit(state.copyWith(status: HomeStatus.idle, product: product));
    } catch(e) {
      print(e);
      emit(state.copyWith(status: HomeStatus.error, errorMessage: e.toString()));
    }
  }
}