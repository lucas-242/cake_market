import 'package:cake/core/widgets/search_bar/search_bar.dart';
import 'package:cake/modules/home/presentation/widgets/home_navbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: HomePage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const HomeNavbar(),
            SearchBar(
              label: 'Pesquise uma delícia aqui',
            )
          ],
        ),
      ),
    );
  }
}
