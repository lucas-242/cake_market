import 'package:cake/core/themes/themes.dart';
import 'package:cake/modules/product/domain/domain.dart';
import 'package:cake/modules/search/search.dart';
import 'package:flutter/material.dart';

class SearchResult extends StatelessWidget {
  final List<Product> products;
  const SearchResult({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.height * 0.8,
      child: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) => SearchTile(product: products[index]),
      ),
    );
  }
}
