import 'package:cake/core/extensions/extensions.dart';
import 'package:cake/core/themes/themes.dart';
import 'package:cake/modules/product/product.dart';
import 'package:cake/modules/search/search.dart';
import 'package:flutter/material.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_back_ios_new),
                ),
                Text('Filtros'),
                TextButton(
                  onPressed: () {},
                  child: Text('Limpar'),
                )
              ],
            ),
            SingleChildScrollView(
              child: Form(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _getText('Categorias'),
                      const SizedBox(height: 15),
                      GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                          childAspectRatio: 2.5,
                        ),
                        itemCount: ProductCategory.values.length,
                        itemBuilder: (context, index) => CategoryCheckbox(),
                      ),
                      const SizedBox(height: 15),
                      _getText('Preço máximo'),
                      const SizedBox(height: 15),
                      PriceSlider(),
                      const SizedBox(height: 15),
                      _getText('Ordernar por'),
                      const SizedBox(height: 15),
                      GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          // crossAxisSpacing: 30.0,
                          // mainAxisSpacing: 15.0,
                        ),
                        itemCount: ProductFilterOrder.values.length,
                        itemBuilder: (context, index) => OrderCheckbox(),
                      ),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getText(String text) {
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
