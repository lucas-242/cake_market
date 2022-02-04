part of 'app_bloc.dart';

class AppState extends Equatable {
  const AppState._({required this.status});

  const AppState.started() : this._(status: AppStatus.hideGetStarted);

  const AppState.notStarted() : this._(status: AppStatus.showGetStarted);

  final AppStatus status;

  @override
  List<Object> get props => [status];
}
