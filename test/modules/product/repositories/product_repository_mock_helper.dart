import 'package:cake/core/keys.dart';
import 'package:cake/modules/product/product.dart';
import 'package:mockito/mockito.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class MockProductDatasource extends Mock implements IProductDatasource {}

Future<void> setupParseInstance() async {
  await Parse().initialize(
    Keys.keyApplicationId,
    Keys.keyParseServerUrl,
    clientKey: Keys.keyClientKey,
    debug: true,
  );
}

Product getDummyProduct({
  String name = 'Torta',
  double rating = 4.5,
  bool isPromotion = false,
  List<ProductTag>? tags,
}) {
  return Product(
    category: ProductCategory.torta,
    name: name,
    size: ProductSize.medio,
    rating: rating,
    isPromotion: isPromotion,
    tags: tags,
  );
}

Future<void> deleteFromApi(List<dynamic> results) async {
  if (results.isNotEmpty) {
    for (final ParseObject item in results) {
      await item.delete();
    }
  }
}
