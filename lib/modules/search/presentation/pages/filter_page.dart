import 'package:cake/core/constants.dart';
import 'package:cake/core/themes/themes.dart';
import 'package:cake/modules/search/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FilterNavbar(
        onBack: () => Navigator.pop(context),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: DefaultStyle.heightSmallSpace),
              BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
                return Form(
                  child: Padding(
                    padding: DefaultStyle.paddingHorizontal,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _getSubtitle('Categorias'),
                        // const SizedBox(height: DefaultStyle.heightSpace),
                        // Wrap(
                        //   direction: Axis.horizontal,
                        //   runSpacing: 10,
                        //   spacing: 10,
                        //   children: _getWrapWIdgets(),

                        // ),
                        const SizedBox(height: DefaultStyle.heightSpace),
                        FilterCategory(
                          categoriesInFilter: state.filter.categories,
                          onPressed: (category) => context
                              .read<SearchBloc>()
                              .add(ChangeFilterEvent(category: category)),
                        ),
                        const SizedBox(height: DefaultStyle.heightSpace),
                        _getSubtitle('Ordernar por'),
                        const SizedBox(height: DefaultStyle.heightSpace),
                        FilterOrder(
                          orderSelectedInFilter: state.filter.order,
                          onPressed: (order) => context
                              .read<SearchBloc>()
                              .add(ChangeFilterEvent(order: order)),
                        ),
                        const SizedBox(height: DefaultStyle.heightSpace),
                        _getSubtitle('Preço máximo'),
                        const SizedBox(height: DefaultStyle.heightSpace),
                        FilterPrice(
                          priceInFilter:
                              state.filter.maxPrice ?? Constants.filterMaxPrice,
                          onPressed: (int value) => context
                              .read<SearchBloc>()
                              .add(ChangeFilterEvent(price: value)),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  // List<Widget> _getWrapWIdgets() {
  //   List<Widget> response = [];

  //   ProductCategory.values.asMap().forEach((index, element) {
  //     response.add(
  //       FilterCategory(
  //         category: ProductCategory.values[index],
  //         isSelected: _checkCategoryIsSelect(
  //           context.read<SearchBloc>().state.filter.categories,
  //           ProductCategory.values[index],
  //         ),
  //         onPressed: (category) => context
  //             .read<SearchBloc>()
  //             .add(ChangeFilterEvent(category: category)),
  //       ),
  //     );
  //   });
  //   return response;
  // }

  Widget _getSubtitle(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 20,
        color: AppColors.primary,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
