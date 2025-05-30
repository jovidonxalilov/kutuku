import 'package:kutuku/core/data/model/product_model.dart';

enum HomeStatus {loading, idle, error}

class HomeState {
  final HomeStatus status;
  final List<ProductModel> product;
  final String? errorMessage;

  HomeState({required this.status, required this.product, required this.errorMessage});

  factory HomeState.initial() {
      return HomeState(status: HomeStatus.idle, product: [], errorMessage: null);
  }

  HomeState copyWith({
    List<ProductModel>? product,
    HomeStatus? status,
    String? errorMessage,
}) {
    return HomeState(status: status ?? this.status, product: product ?? this.product, errorMessage: errorMessage ?? this.errorMessage);
  }

  @override
  Future<List<Object?>> get props async => [status, product, errorMessage];
}

