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
