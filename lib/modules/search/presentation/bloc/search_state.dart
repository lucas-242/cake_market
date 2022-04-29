part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  final List<Product> products;
  final ProductFilter filter;
  final String? errorMessage;

  const SearchState({
    this.products = const [],
    this.errorMessage,
    ProductFilter? filter,
  }) : filter = filter ?? const ProductFilter();

  @override
  List<Object?> get props => [products, filter, errorMessage];
}

class SearchInitial extends SearchState {
  const SearchInitial({ProductFilter? filter}) : super(filter: filter);
}

class SearchLoading extends SearchState {}

class SearchNoData extends SearchState {
  const SearchNoData({required ProductFilter filter}) : super(filter: filter);
}

class SearchError extends SearchState {
  const SearchError({
    required String errorMessage,
    required ProductFilter filter,
  }) : super(errorMessage: errorMessage, filter: filter);
}

class SearchSuccess extends SearchState {
  const SearchSuccess(
      {required List<Product> products, required ProductFilter filter})
      : super(products: products, filter: filter);
}

abstract class ISearchStateFactory {
  SearchState chooseStateAcordingFilter(
      {required SearchState state, required ProductFilter filter});
}

class SearchStateFactory extends ISearchStateFactory {
  @override
  SearchState chooseStateAcordingFilter({
    required SearchState state,
    required ProductFilter filter,
    ProductCategory? category,
  }) {
    if (state is SearchSuccess) {
      if ((filter.name == null || filter.name!.isEmpty) && category == null) {
        return SearchInitial(filter: filter);
      }
      return SearchSuccess(products: state.products, filter: filter);
    } else if (state is SearchInitial) {
      return SearchInitial(filter: filter);
    } else if (state is SearchNoData) {
      return SearchNoData(filter: filter);
    } else if (state is SearchError) {
      return SearchError(errorMessage: state.errorMessage!, filter: filter);
    } else {
      return SearchError(
          errorMessage: 'Fatal error, please, restart the app.',
          filter: filter);
    }
  }
}
