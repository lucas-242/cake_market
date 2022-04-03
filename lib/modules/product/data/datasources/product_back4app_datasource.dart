import 'package:cake/core/extensions/extensions.dart';
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
  Future<List<Product>> search(ProductFilter filter) async {
    var mainQuery = _getFilterQuery(filter);

    final ParseResponse apiResponse = await mainQuery.query();
    return _checkApiResponse(apiResponse);
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

  QueryBuilder<ParseObject> _getFilterQuery(ProductFilter filter) {
    var mainQuery = QueryBuilder<ParseObject>(ParseObject('Product'))
      ..includeObject(['tags']);

    //* Name filter
    if (filter.name != null && filter.name!.isNotEmpty) {
      QueryBuilder<ParseObject> inner =
          QueryBuilder<ParseObject>(ParseObject('Tag'))
            ..whereContains('name', filter.name!);

      QueryBuilder<ParseObject> query1 =
          QueryBuilder<ParseObject>(ParseObject('Product'))
            ..includeObject(['tags'])
            ..whereMatchesQuery('tags', inner);

      QueryBuilder<ParseObject> query2 =
          QueryBuilder<ParseObject>(ParseObject('Product'))
            ..includeObject(['tags'])
            ..whereContains('name', filter.name!);

      mainQuery = QueryBuilder.or(ParseObject('Product'), [query1, query2]);
    }

    //* Category filter
    if (filter.category != null) {
      mainQuery.whereEqualTo('category', filter.category.toShortString());
    }

    //* Price filter
    if (filter.price != null && filter.price! > 0) {
      mainQuery.whereLessThanOrEqualTo('price', filter.price);
    }

    //* Rating filter
    if (filter.rating != null && filter.rating! > 0) {
      mainQuery.whereGreaterThanOrEqualsTo('rating', filter.rating);
    }

    //* Size filter
    if (filter.size != null) {
      mainQuery.whereEqualTo('size', filter.size.toShortString());
    }

    //* IsPromotion filter
    if (filter.isPromotion != null) {
      mainQuery.whereEqualTo('isPromotion', true);
    }

    //* Order
    if (filter.order != null &&
        filter.order != ProductFilterOrder.defaultOrder) {
      switch (filter.order!) {
        case ProductFilterOrder.asc:
          mainQuery.orderByAscending('name');
          break;
        case ProductFilterOrder.desc:
          mainQuery.orderByDescending('name');
          break;
        case ProductFilterOrder.priceLower:
          mainQuery.orderByAscending('price');
          break;
        case ProductFilterOrder.rating:
          mainQuery.orderByDescending('rating');
          break;
        default:
          mainQuery.orderByAscending('name');
      }
    }

    return mainQuery;
  }

  // Future<ParseResponse> add() async {
  //   final productToSave = ParseObject('Product')
  //     ..set('name', 'product.name')
  //     ..set('description', 'product.description')
  //     ..set('discount', 0)
  //     ..set('image', null)
  //     ..set('isPromotion', false)
  //     ..set('price', 39.5)
  //     ..set('rating', 4.7)
  //     ..set('category', 'torta')
  //     ..set('size', 'pequeno')
  //     ..addRelation('tags', [
  //       ParseObject('ProductTag')..objectId = '1bagueYPw5',
  //       ParseObject('ProductTag')..objectId = 'UNurgnMJQV'
  //     ]);
  //   return productToSave.save();
  // }

}
