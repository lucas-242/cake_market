import 'package:bloc/bloc.dart';
import 'package:cake/modules/product/product.dart';
import 'package:equatable/equatable.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchProducts _searchProducts;

  SearchBloc({required SearchProducts searchProducts})
      : _searchProducts = searchProducts,
        super(const SearchInitial()) {
    on<PerformSearchEvent>(_onSearchProducts);
    on<ChangeFilterEvent>(_onChangeFilter);
  }

  Future<void> _onChangeFilter(
    ChangeFilterEvent event,
    Emitter<SearchState> emit,
  ) async {
    var filter = _setFilter(event);

    emit(SearchStateFactory().chooseStateAcordingFilter(
      state: state,
      filter: filter,
      category: event.category,
    ));
  }

  ProductFilter _setFilter(ChangeFilterEvent event) {
    return ProductFilter(
      name: event.searchText ?? state.filter.name,
      categories: _setFilterCategories(event.category),
      order: event.order ?? state.filter.order,
      maxPrice: event.price ?? state.filter.maxPrice,
    );
  }

  List<ProductCategory> _setFilterCategories(ProductCategory? category) {
    List<ProductCategory> categories = [];
    if (category != null) {
      categories = List.from(state.filter.categories ?? []);
      var indexFound = categories.indexOf(category);
      if (indexFound == -1) {
        categories.add(category);
      } else {
        categories.removeAt(indexFound);
      }
    }
    return categories;
  }

  Future<void> _onSearchProducts(
      PerformSearchEvent event, Emitter<SearchState> emit) async {
    var filter = event.filter;
    emit(SearchLoading());
    await _searchProducts(filter).then((products) {
      if (products.isEmpty) {
        emit(SearchNoData(filter: filter));
      } else {
        emit(SearchSuccess(products: products, filter: filter));
      }
    }).catchError((error) {
      emit(SearchError(
        errorMessage: 'Erro ao efetuar a busca',
        filter: filter,
      ));
    });
  }
}
