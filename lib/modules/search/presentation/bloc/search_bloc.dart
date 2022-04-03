import 'package:bloc/bloc.dart';
import 'package:cake/modules/product/product.dart';
import 'package:equatable/equatable.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchProducts _searchProducts;

  SearchBloc({required SearchProducts searchProducts})
      : _searchProducts = searchProducts,
        super(SearchInitial()) {
    on<SearchEvent>(_onSearchProducts);
  }

  Future<void> _onSearchProducts(
      SearchEvent event, Emitter<SearchState> emit) async {
    emit.call(SearchLoading());
    var filter = ProductFilter(name: event.search);
    await _searchProducts.call(filter).then((products) {
      if (products.isEmpty) {
        emit.call(SearchNoData());
      } else {
        emit.call(SearchSuccess(products: products));
      }
    }).catchError((error) =>
        emit.call(const SearchError(errorMessage: 'Erro ao efetuar a busca')));
  }
}
