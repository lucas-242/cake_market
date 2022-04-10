import 'package:cake/core/extensions/extensions.dart';
import 'package:cake/core/themes/themes.dart';
import 'package:cake/modules/product/product.dart';
import 'package:cake/modules/search/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  bool _checkOrderIsSelected(
    ProductFilterOrder? order,
    ProductFilterOrder orderSelected,
  ) {
    if (order != null && order == orderSelected) {
      return true;
    }

    return false;
  }

  bool _checkCategoryIsSelect(
    List<ProductCategory>? categories,
    ProductCategory categorySelected,
  ) {
    if (categories == null) return false;

    var found = categories.where((element) => element == categorySelected);
    if (found.isEmpty) return false;

    return true;
  }

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
                        const SizedBox(height: DefaultStyle.heightSpace),
                        GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                            childAspectRatio: 2.0,
                          ),
                          itemCount: ProductCategory.values.length,
                          itemBuilder: (context, index) => FilterCategory(
                            category: ProductCategory.values[index],
                            isSelected: _checkCategoryIsSelect(
                              context
                                  .read<SearchBloc>()
                                  .state
                                  .filter
                                  .categories,
                              ProductCategory.values[index],
                            ),
                            onPressed: (category) => context
                                .read<SearchBloc>()
                                .add(ChangeFilterEvent(category: category)),
                          ),
                        ),
                        const SizedBox(height: DefaultStyle.heightSpace),
                        _getSubtitle('Preço máximo'),
                        const SizedBox(height: DefaultStyle.heightSpace),
                        const FilterPrice(),
                        const SizedBox(height: DefaultStyle.heightSpace),
                        _getSubtitle('Ordernar por'),
                        const SizedBox(height: DefaultStyle.heightSpace),
                        GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                          ),
                          itemCount: ProductFilterOrder.values.length,
                          itemBuilder: (context, index) => FilterOrder(
                            order: ProductFilterOrder.values[index],
                            isSelected: _checkOrderIsSelected(
                              context.read<SearchBloc>().state.filter.order,
                              ProductFilterOrder.values[index],
                            ),
                            onPressed: (order) => context
                                .read<SearchBloc>()
                                .add(ChangeFilterEvent(order: order)),
                          ),
                        ),
                        // const SizedBox(height: DefaultStyle.heightSpace),
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
