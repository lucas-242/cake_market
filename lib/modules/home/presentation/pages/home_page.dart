import 'package:cake/core/themes/themes.dart';
import 'package:cake/core/widgets/search_bar/search_bar.dart';
import 'package:cake/modules/home/presentation/widgets/home_navbar.dart';
import 'package:cake/modules/home/presentation/widgets/home_recomended.dart';
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
            const SizedBox(height: 25),
            SearchBar(
              label: 'Pesquise uma delícia aqui',
            ),
            //* Height should be smaller to compensate the button padding
            const SizedBox(height: 10),
            HomeRecomended(
              onPressedMore: () => print('aaaainn'),
            )
          ],
        ),
      ),
    );
  }
}
