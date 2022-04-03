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
  @override
  Widget build(BuildContext context) {
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
                onSubmitted: (String text) =>
                    context.read<SearchBloc>().add(SearchEvent(text)),
              ),
              const SizedBox(height: DefaultStyle.heightSpace),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: DefaultStyle.paddingValue),
                child: BlocBuilder<SearchBloc, SearchState>(
                  builder: (context, state) {
                    if (state is SearchInitial) {
                      //TODO: Show types
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
