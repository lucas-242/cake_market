import 'package:bloc/bloc.dart';
import 'package:cake/modules/cake/cake.dart';
import 'package:equatable/equatable.dart';

part 'cake_event.dart';
part 'cake_state.dart';

class CakeBloc extends Bloc<CakeEvent, CakeState> {
  final GetCakes _getCakes;

  CakeBloc({required GetCakes getCakes})
      : _getCakes = getCakes,
        super(CakeInitial()) {
    on<CakeEvent>(_onGetCakes);
  }

  Future<void> _onGetCakes(CakeEvent event, Emitter<CakeState> emit) async {
    emit.call(CakeLoading());
    await _getCakes
        .call()
        .then((result) => emit.call(CakeSuccess(cakes: result)))
        .catchError((error) => emit.call(CakeError(errorMessage: error)));
  }
}
