part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class InitHomeEvent extends HomeEvent {
  const InitHomeEvent();
}

class SearchCakeHomeEvent extends HomeEvent {
  final String search;

  const SearchCakeHomeEvent(this.search);

  @override
  List<Object> get props => [search];
}
