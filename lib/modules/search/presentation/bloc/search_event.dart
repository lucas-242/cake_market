part of 'search_bloc.dart';

class SearchEvent extends Equatable {
  final String search;

  const SearchEvent(this.search);

  @override
  List<Object> get props => [search];
}
