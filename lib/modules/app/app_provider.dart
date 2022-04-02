import 'package:cake/modules/app/app.dart';
import 'package:cake/modules/home/home.dart';
import 'package:cake/modules/search/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injector_container.dart' as di;

class AppProvider extends StatelessWidget {
  const AppProvider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppBloc>(
          create: (_) => di.instance<AppBloc>(),
        ),
        BlocProvider<TabBloc>(
          create: (_) => TabBloc(),
        ),
        BlocProvider<HomeBloc>(
          create: (_) => di.instance<HomeBloc>(),
        ),
        BlocProvider<SearchBloc>(
          create: (_) => di.instance<SearchBloc>(),
        ),
      ],
      // child: AdaptiveTheme(
      //   light: AppThemes.lightTheme,
      //   dark: AppThemes.darkTheme,
      //   initial: AdaptiveThemeMode.light,
      //   builder: (lightTheme, darkTheme) => MaterialApp(
      //     theme: lightTheme,
      //     darkTheme: darkTheme,
      //     debugShowCheckedModeBanner: false,
      //     home: FlowBuilder<AppStatus>(
      //       state: context.select((AppBloc bloc) => bloc.state.status),
      //       onGeneratePages: onGenerateAppViewPages,
      //     ),
      //   ),
      // );
      child: const App(),
    );
  }
}
