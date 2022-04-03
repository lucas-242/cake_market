import 'package:cake/modules/product/product.dart';
import 'package:cake/modules/product/data/models/product_back4app_model.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class ProductBack4AppDatasource extends IProductDatasource {
  ProductBack4AppDatasource();

  @override
  Future<List<Product>> get() async {
    QueryBuilder<ParseObject> query =
        QueryBuilder<ParseObject>(ParseObject('Product'))
          ..includeObject(['tags']);

    final ParseResponse apiResponse = await query.query();
    return _checkApiResponse(apiResponse);
  }

  @override
  Future<List<Product>> getRecomended() async {
    QueryBuilder<ParseObject> query =
        QueryBuilder<ParseObject>(ParseObject('Product'))
          ..includeObject(['tags'])
          ..orderByDescending('rating')
          ..setLimit(5);

    final ParseResponse apiResponse = await query.query();
    return _checkApiResponse(apiResponse);
  }

  @override
  Future<List<Product>> search(String text) async {
    QueryBuilder<ParseObject> inner =
        QueryBuilder<ParseObject>(ParseObject('Tag'))
          ..whereContains('name', text);

    //* Query by tags
    QueryBuilder<ParseObject> query1 =
        QueryBuilder<ParseObject>(ParseObject('Product'))
          ..includeObject(['tags'])
          ..whereMatchesQuery('tags', inner);

    //* Query by name
    QueryBuilder<ParseObject> query2 =
        QueryBuilder<ParseObject>(ParseObject('Product'))
          ..includeObject(['tags'])
          ..whereContains('name', text);

    QueryBuilder<ParseObject> mainQuery =
        QueryBuilder.or(ParseObject('Product'), [query1, query2]);

    final ParseResponse apiResponse = await mainQuery.query();
    return _checkApiResponse(apiResponse);
  }

  Future<ParseResponse> add() async {
    final productToSave = ParseObject('Product')
      ..set('name', 'product.name')
      ..set('description', 'product.description')
      ..set('discount', 0)
      ..set('image', null)
      ..set('isPromotion', false)
      ..set('price', 39.5)
      ..set('rating', 4.7)
      ..set('type', 'torta')
      ..set('size', 'pequeno')
      ..addRelation('tags', [
        ParseObject('ProductTag')..objectId = '1bagueYPw5',
        ParseObject('ProductTag')..objectId = 'UNurgnMJQV'
      ]);
    return productToSave.save();
  }
}

/// Checks the [apiResponse], get the list and converts to Product entity
List<Product> _checkApiResponse(ParseResponse apiResponse) {
  if (apiResponse.success && apiResponse.results != null) {
    var response = apiResponse.results!
        .map((e) => ProductBack4AppModel.fromParseObject(e).toProduct())
        .toList();
    return response;
  } else {
    return [];
  }
}
