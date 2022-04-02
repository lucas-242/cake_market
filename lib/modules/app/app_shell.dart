import 'package:cake/core/models/models.dart';
import 'package:cake/core/themes/themes.dart';
import 'package:cake/modules/app/app.dart';
import 'package:cake/modules/home/home.dart';
import 'package:cake/modules/search/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppShell extends StatefulWidget {
  const AppShell({
    Key? key,
  }) : super(key: key);

  static Page page() => const MaterialPage<void>(child: AppShell());

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  @override
  Widget build(BuildContext context) {
    SizeConfig(context, kBottomNavigationBarHeight);

    return BlocBuilder<TabBloc, AppTab>(
      builder: (context, activeTab) {
        return Scaffold(
          body: body(activeTab),
          bottomNavigationBar: AppBottomNavigationBar(
            activeTab: activeTab,
            onTabSelected: (tab) => context.read<TabBloc>().add(UpdateTab(tab)),
          ),
        );
      },
    );
  }

  Widget body(AppTab activeTab) {
    switch (activeTab) {
      case AppTab.search:
        return const SearchPage();
      case AppTab.profile:
        return Container(color: Colors.green);
      default:
        return const HomePage();
    }
  }
}

class AppBottomNavigationBar extends StatelessWidget {
  final AppTab activeTab;
  final Function(AppTab) onTabSelected;

  const AppBottomNavigationBar(
      {Key? key, required this.activeTab, required this.onTabSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.height * 0.1,
      child: BottomNavigationBar(
        elevation: 0,
        currentIndex: AppTab.values.indexOf(activeTab),
        onTap: (index) => onTabSelected(AppTab.values[index]),
        selectedItemColor: AppColors.accent,
        unselectedItemColor: AppColors.icons,
        // unselectedItemColor:
        //     AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
        //         ? AppAppColors.white
        //         : AppColors.text,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Busca',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
