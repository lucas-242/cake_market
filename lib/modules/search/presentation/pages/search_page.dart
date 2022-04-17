import 'package:cake/core/themes/themes.dart';
import 'package:cake/core/widgets/search_bar/search_bar.dart';
import 'package:cake/modules/search/presentation/widgets/search_result.dart';
import 'package:cake/modules/search/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late SearchBloc _searchBloc;

  @override
  Widget build(BuildContext context) {
    _searchBloc = context.read<SearchBloc>();
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: DefaultStyle.heightSpace),
              const Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: DefaultStyle.paddingValue),
                child: Text(
                  'Busca',
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: DefaultStyle.heightSpace),
              SearchBar(
                label: 'Pesquise uma delícia aqui',
                onTapFilters: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FilterPage())),
                onChange: (String text) =>
                    _searchBloc.add(ChangeFilterEvent(searchText: text)),
                onSubmitted: (String text) => _searchBloc
                    .add(PerformSearchEvent(filter: _searchBloc.state.filter)),
              ),
              const SizedBox(height: DefaultStyle.heightSpace),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: DefaultStyle.paddingValue),
                child: BlocBuilder<SearchBloc, SearchState>(
                  builder: (context, state) {
                    if (state is SearchInitial) {
                      //TODO: Show categories
                      return Container();
                    } else if (state is SearchSuccess) {
                      return SearchResult(products: state.products);
                    } else if (state is SearchError) {
                      return Text(state.errorMessage!);
                    } else if (state is SearchNoData) {
                      return const Text('Não há resultados para a busca');
                    } else if (state is SearchLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
