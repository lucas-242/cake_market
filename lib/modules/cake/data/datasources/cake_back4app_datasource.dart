import 'package:cake/modules/cake/cake.dart';
import 'package:cake/modules/cake/data/models/cake_back4app_model.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class CakeBack4AppDatasource extends ICakeDatasource {
  CakeBack4AppDatasource();

  @override
  Future<List<Cake>> get() async {
    QueryBuilder<ParseObject> query =
        QueryBuilder<ParseObject>(ParseObject('Cake'))..includeObject(['tags']);

    final ParseResponse apiResponse = await query.query();
    return _checkApiResponse(apiResponse);
  }

  @override
  Future<List<Cake>> getRecomended() async {
    QueryBuilder<ParseObject> query =
        QueryBuilder<ParseObject>(ParseObject('Cake'))
          ..includeObject(['tags'])
          ..orderByDescending('rating')
          ..setLimit(5);

    final ParseResponse apiResponse = await query.query();
    return _checkApiResponse(apiResponse);
  }

  @override
  Future<List<Cake>> search(String text) async {
    QueryBuilder<ParseObject> query1 =
        QueryBuilder<ParseObject>(ParseObject('Cake'))
          ..includeObject(['tags'])
          ..whereContains('name', text);

    QueryBuilder<ParseObject> query2 =
        QueryBuilder<ParseObject>(ParseObject('Cake'))
          ..includeObject(['tags'])
          ..whereContainedIn('tags', [text]);

    QueryBuilder<ParseObject> mainQuery =
        QueryBuilder.or(ParseObject('Cake'), [query1, query2]);

    final ParseResponse apiResponse = await mainQuery.query();
    return _checkApiResponse(apiResponse);
  }

  Future<ParseResponse> add() async {
    final cakeToSave = ParseObject('Cake')
      ..set('name', 'cake.name')
      ..set('description', 'cake.description')
      ..set('discount', 0)
      ..set('image', null)
      ..set('isPromotion', false)
      ..set('price', 39.5)
      ..set('rating', 4.7)
      ..set('type', 'torta')
      ..set('size', 'pequeno')
      ..addRelation('tags', [
        ParseObject('CakeTag')..objectId = '1bagueYPw5',
        ParseObject('CakeTag')..objectId = 'UNurgnMJQV'
      ]);
    return cakeToSave.save();
  }
}

/// Checks the [apiResponse], get the list and converts to Cake entity
List<Cake> _checkApiResponse(ParseResponse apiResponse) {
  if (apiResponse.success && apiResponse.results != null) {
    var response = apiResponse.results!
        .map((e) => CakeBack4AppModel.fromParseObject(e).toCake())
        .toList();
    return response;
  } else {
    return [];
  }
}
