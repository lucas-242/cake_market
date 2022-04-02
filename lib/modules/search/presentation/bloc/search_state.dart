part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  final List<Cake> cakes;
  final String? errorMessage;

  const SearchState({this.cakes = const [], this.errorMessage});

  @override
  List<Object?> get props => [cakes, errorMessage];
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchNoData extends SearchState {}

class SearchError extends SearchState {
  const SearchError({required String errorMessage})
      : super(errorMessage: errorMessage);
}

class SearchSuccess extends SearchState {
  const SearchSuccess({required List<Cake> cakes}) : super(cakes: cakes);
}
