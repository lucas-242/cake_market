import 'package:bloc/bloc.dart';
import 'package:cake/modules/cake/cake.dart';
import 'package:equatable/equatable.dart';

part 'cake_event.dart';
part 'cake_state.dart';

class CakeBloc extends Bloc<CakeEvent, CakeState> {
  final GetCakes _getCakes;

  CakeBloc({required GetCakes getCakes})
      : _getCakes = getCakes,
        super(CakeInitial());
}
