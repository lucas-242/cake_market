import 'package:cake/core/models/models.dart';
import 'package:cake/core/themes/themes.dart';
import 'package:cake/modules/app/app.dart';
import 'package:cake/modules/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppShell extends StatelessWidget {
  const AppShell({
    Key? key,
  }) : super(key: key);

  static Page page() => const MaterialPage<void>(child: AppShell());

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
      case AppTab.catalog:
        return Container(color: Colors.amber);
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
    return Container(
      decoration: const BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.14),
            blurRadius: 4.0,
            offset: Offset(0, 2),
          ),
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.12),
            blurRadius: 5.0,
            offset: Offset(0, 4),
          ),
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.2),
            blurRadius: 10.0,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: AppTab.values.indexOf(activeTab),
        onTap: (index) => onTabSelected(AppTab.values[index]),
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.text,
        // unselectedItemColor:
        //     AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
        //         ? AppColors.white
        //         : AppColors.text,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.shopping_cart),
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Busca',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.person),
            icon: Icon(Icons.person_outline),
            label: 'Coleção',
          ),
        ],
      ),
    );
  }
}
