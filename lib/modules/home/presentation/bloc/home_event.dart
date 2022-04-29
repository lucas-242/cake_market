part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class InitHomeEvent extends HomeEvent {
  const InitHomeEvent();
}

class RefreshHomeEvent extends HomeEvent {
  const RefreshHomeEvent();
}

class SearchProductHomeEvent extends HomeEvent {
  final String search;

  const SearchProductHomeEvent(this.search);

  @override
  List<Object> get props => [search];
}
