import 'package:cake/core/keys.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

Future<void> setupParseInstance() async {
  await Parse().initialize(
    Keys.keyApplicationId,
    Keys.keyParseServerUrl,
    clientKey: Keys.keyClientKey,
    debug: true,
  );
}

Future<void> deleteFromApi(List<dynamic> items) async {
  if (items.isNotEmpty) {
    for (final ParseObject item in items) {
      await item.delete();
    }
  }
}
