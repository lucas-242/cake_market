import 'package:cake/core/models/models.dart';
import 'package:cake/modules/app/app.dart';
import 'package:cake/modules/get_started/get_started.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  List<Page> onGenerateAppViewPages(
      AppStatus state, List<Page<dynamic>> pages) {
    switch (state) {
      case AppStatus.hideGetStarted:
        return [AppShell.page()];
      case AppStatus.showGetStarted:
      default:
        return [GetStarted.page()];
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FlowBuilder<AppStatus>(
        state: context.select((AppBloc bloc) => bloc.state.status),
        onGeneratePages: onGenerateAppViewPages,
      ),
    );
  }
}
