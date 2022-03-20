import 'package:bloc/bloc.dart';
import 'package:cake/modules/cake/cake.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetRecomendedCakes _getRecomendedCakes;
  HomeBloc({required GetRecomendedCakes getRecomendedCakes})
      : _getRecomendedCakes = getRecomendedCakes,
        super(HomeInitial()) {
    on<HomeEvent>(_onInit);
  }

  Future<void> _onInit(HomeEvent event, Emitter<HomeState> emit) async {
    emit.call(HomeLoading());
    await _getRecomendedCakes
        .call()
        .then((cakes) =>
            emit.call(HomeSuccess(recomended: cakes, orders: const [])))
        .catchError((error) => emit.call(HomeError(errorMessage: 'Erro')));
  }
}
