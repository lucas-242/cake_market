import 'package:cake/core/constants.dart';
import 'package:cake/core/extensions/extensions.dart';
import 'package:cake/core/models/models.dart';
import 'package:cake/modules/product/data/models/product_tag_back4app_model.dart';
import 'package:cake/modules/product/product.dart';
import 'package:cake/modules/product/data/models/product_back4app_model.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class ProductBack4AppDatasource extends IProductDatasource {
  ProductBack4AppDatasource();

  @override
  Future<List<Product>> getRecommended() async {
    try {
      QueryBuilder<ParseObject> query =
          QueryBuilder<ParseObject>(ParseObject('Product'))
            ..includeObject(['tags'])
            ..orderByDescending('rating')
            ..setLimit(Constants.recommendedProductsLimit);

      final ParseResponse apiResponse = await query.query();
      return _checkApiResponse(apiResponse);
    } catch (error) {
      throw ServerException('Error to get recommended products: $error');
    }
  }

  @override
  Future<List<Product>> search(ProductFilter filter) async {
    try {
      var mainQuery = _getFilterQuery(filter);

      final ParseResponse apiResponse = await mainQuery.query();
      return _checkApiResponse(apiResponse);
    } catch (error) {
      throw ServerException('Error to search products: $error');
    }
  }

  /// Checks the [apiResponse], get the list and converts to Product entity
  List<Product> _checkApiResponse(ParseResponse apiResponse) {
    if (apiResponse.success && apiResponse.results != null) {
      var response = apiResponse.results!
          .map((e) => ProductBack4AppModel.fromParseObject(e).toProduct())
          .toList();
      return response;
    } else if (!apiResponse.success) {
      throw ServerException('Status code error: ${apiResponse.error!.code}');
    }

    return [];
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
    if (filter.categories != null && filter.categories!.isNotEmpty) {
      mainQuery.whereContainedIn(
        'category',
        filter.categories!.map((e) => e.toShortString()).toList(),
      );
      // mainQuery.whereEqualTo('category', filter.categories.toShortString());
    }

    //* Max Price filter
    if (filter.maxPrice != null && filter.maxPrice! > 0) {
      mainQuery.whereLessThanOrEqualTo('price', filter.maxPrice);
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
    if (filter.order != ProductFilterOrder.defaultOrder) {
      switch (filter.order) {
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

  @override
  Future<Product> add(Product product) async {
    try {
      final productToSave = ParseObject('Product')
        ..set('name', product.name)
        ..set('description', product.description)
        ..set('discount', product.discount)
        ..set('image', product.image)
        ..set('isPromotion', product.isPromotion)
        ..set('price', product.price)
        ..set('rating', product.rating)
        ..set('category', product.category.toString())
        ..set('size', product.size.toString());

      if (product.tags != null && product.tags!.isNotEmpty) {
        List<ParseObject> tags = product.tags!
            .map((e) => ParseObject('Tag')..objectId = e.id)
            .toList();

        productToSave.setAddAll('tags', tags);
      }

      final ParseResponse apiResponse = await productToSave.save();
      var createdProduct = _checkApiResponse(apiResponse).first;
      createdProduct.copyWith(tags: product.tags);
      return createdProduct;
    } catch (error) {
      throw ServerException('Error trying to adding Product: $error');
    }
  }

  @override
  Future<ProductTag> addTag(ProductTag tag) async {
    try {
      final tagToSave = ParseObject('Tag')..set('name', tag.name);

      return await tagToSave.save().then((response) {
        if (response.success) {
          return ProductTagBack4AppModel.fromParseObject(response.result)
              .toProductTag();
        } else {
          throw ServerException(
              'Error adding tag. Code: ${response.error!.code}');
        }
      });
    } catch (error) {
      throw ServerException('Error adding tag: $error');
    }
  }

  @override
  Future<void> deleteTag(ProductTag tag) async {
    final tagToDelete = ProductTagBack4AppModel.fromProductTag(tag).toParse();
    await tagToDelete.delete();
  }

  // Future<List<ProductTag>> _getTagsByProduct(String id) async {
  //   QueryBuilder<ParseObject> query = QueryBuilder<ParseObject>(
  //       ParseObject('Tag'))
  //     ..whereMatchesKeyInQuery(
  //         'objectId', id, QueryBuilder<ParseObject>(ParseObject('Product')));

  //   final ParseResponse apiResponse = await query.query();

  //   // apiResponse

  //   return tags;
  // }
}
