import 'package:cake/core/themes/themes.dart';
import 'package:cake/core/widgets/search_bar/search_bar.dart';
import 'package:cake/modules/search/presentation/bloc/search_bloc.dart';
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
            children: [
              const SizedBox(height: DefaultStyle.heightSpace),
              SearchBar(
                label: 'Pesquise uma delícia aqui',
                onSubmitted: (String text) =>
                    context.read<SearchBloc>().add(SearchEvent(text)),
              ),
              const SizedBox(height: DefaultStyle.heightSpace),
              BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  if (state is SearchSuccess) {
                    return SizedBox(
                      height: SizeConfig.height * 0.8,
                      child: ListView.builder(
                        itemCount: state.cakes.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Text(state.cakes[index].name),
                          );
                        },
                      ),
                    );
                  } else if (state is SearchError) {
                    return Text(state.errorMessage!);
                  } else if (state is SearchNoData) {
                    return const Text('Não há resultados para a busca');
                  } else if (state is SearchLoading) {
                    return const CircularProgressIndicator();
                  } else {
                    return Container();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}