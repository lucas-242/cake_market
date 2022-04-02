import 'package:bloc/bloc.dart';
import 'package:cake/modules/cake/cake.dart';
import 'package:equatable/equatable.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchCakes _searchCakes;

  SearchBloc({required SearchCakes searchCakes})
      : _searchCakes = searchCakes,
        super(SearchInitial()) {
    on<SearchEvent>(_onSearchCakes);
  }

  Future<void> _onSearchCakes(
      SearchEvent event, Emitter<SearchState> emit) async {
    emit.call(SearchLoading());
    await _searchCakes.call(event.search).then((cakes) {
      if (cakes.isEmpty) {
        emit.call(SearchNoData());
      } else {
        emit.call(SearchSuccess(cakes: cakes));
      }
    }).catchError((error) =>
        emit.call(const SearchError(errorMessage: 'Erro ao efetuar a busca')));
  }
}
