import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_started_state.dart';

class GetStartedCubit extends Cubit<GetStartedState> {
  GetStartedCubit() : super(const GetStartedState());

  void textShowChanged(int currentText) {
    emit(state.copyWith(currentText: currentText));
  }
}
