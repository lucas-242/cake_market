import 'package:cake/core/keys.dart';
import 'package:cake/modules/app/app.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import 'injector_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Parse().initialize(Keys.keyApplicationId, Keys.keyParseServerUrl,
      clientKey: Keys.keyClientKey, autoSendSessionId: true);
  await di.init();
  runApp(const AppProvider());
}
