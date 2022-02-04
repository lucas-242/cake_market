import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cake/core/models/models.dart';
import 'package:equatable/equatable.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState.notStarted()) {
    on<UserGetStarted>(_onUserGetStarted);
    // _userSubscription = _loginRepository.user.listen(
    //   (user) => add(AppUserChanged(user)),
    // );
  }

  void _onUserGetStarted(UserGetStarted event, Emitter<AppState> emit) {
    //TODO: Access shared preferences and change the flag
    emit(const AppState.started());
  }

  @override
  Future<void> close() {
    // _userSubscription.cancel();
    return super.close();
  }
}
