import 'package:bloc/bloc.dart';
import 'package:cake/modules/product/product.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetRecomendedProducts _getRecomendedProducts;
  HomeBloc({required GetRecomendedProducts getRecomendedProducts})
      : _getRecomendedProducts = getRecomendedProducts,
        super(HomeInitial()) {
    on<HomeEvent>(_onInit);
  }

  Future<void> _onInit(HomeEvent event, Emitter<HomeState> emit) async {
    emit.call(HomeLoading());
    await _getRecommendedProducts()
        .then((products) =>
            emit.call(HomeSuccess(recomended: products, orders: const [])))
        .catchError(
            (error) => emit.call(HomeError(errorMessage: error.message)));
  }

  Future<List<Product>> _getRecommendedProducts() async {
    return await _getRecomendedProducts
        .call()
        .then((products) => products)
        .catchError((error) => error);
  }
}
