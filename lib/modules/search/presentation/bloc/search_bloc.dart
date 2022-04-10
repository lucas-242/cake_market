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
    on<PerformSearchEvent>(_onSearchProducts);
    on<ChangeFilterEvent>(_onChangeFilter);
  }

  Future<void> _onChangeFilter(
      ChangeFilterEvent event, Emitter<SearchState> emit) async {
    List<ProductCategory> categories = [];
    if (event.category != null) {
      if (state.filter.categories == null || state.filter.categories!.isEmpty) {
        categories.add(event.category!);
      } else {
        categories = List.from(state.filter.categories!);
        var indexToRemove = categories.indexOf(event.category!);
        if (indexToRemove > -1) {
          categories.removeAt(indexToRemove);
        } else {
          categories.add(event.category!);
        }
      }
    }

    var filter = ProductFilter(
      name: event.searchText ?? state.filter.name,
      categories: categories,
      order: event.order ?? state.filter.order,
    );

    if (state is SearchSuccess) {
      emit.call(SearchSuccess(products: state.products, filter: filter));
    } else if (state is SearchNoData) {
      emit.call(SearchNoData(filter: filter));
    } else if (state is SearchError) {
      emit.call(SearchError(errorMessage: state.errorMessage!, filter: filter));
    }
  }

  Future<void> _onSearchProducts(
      PerformSearchEvent event, Emitter<SearchState> emit) async {
    var filter = event.filter;
    emit.call(SearchLoading());
    await _searchProducts.call(filter).then((products) {
      if (products.isEmpty) {
        emit.call(SearchNoData(filter: filter));
      } else {
        emit.call(SearchSuccess(products: products, filter: filter));
      }
    }).catchError(
      (error) => emit.call(SearchError(
        errorMessage: 'Erro ao efetuar a busca',
        filter: filter,
      )),
    );
  }
}
