import 'package:cake/modules/app/app.dart';
import 'package:flutter/material.dart';

import 'injector_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const AppProvider());
}
