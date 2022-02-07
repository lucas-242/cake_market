import 'package:cake/core/themes/themes.dart';
import 'package:cake/core/widgets/search_bar/search_bar.dart';
import 'package:cake/modules/home/presentation/widgets/last_order_section.dart';
import 'package:cake/modules/home/presentation/widgets/navbar_section.dart';
import 'package:cake/modules/home/presentation/widgets/recomended_section.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: HomePage());

  static const recomended = [
    {'name': 'Mocca Sugar Birthday Cake', 'image': AppImages.logo},
    {'name': 'Mocca Sugar Birthday Cake', 'image': AppImages.logo},
    {'name': 'Mocca Sugar Birthday Cake', 'image': AppImages.logo},
    {'name': 'Mocca Sugar Birthday Cake', 'image': AppImages.logo},
    {'name': 'Mocca Sugar Birthday Cake', 'image': AppImages.logo},
  ];

  static const orders = [
    {
      'name': 'Blackforrest Mocca',
      'type': 'Birthday Cake',
      'image': AppImages.logo
    },
    {
      'name': 'Blackforrest Mocca',
      'type': 'Birthday Cake',
      'image': AppImages.logo
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFCF5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const NavbarSection(),
              const SizedBox(height: 25),
              SearchBar(
                label: 'Pesquise uma delícia aqui',
              ),
              //* Height should be smaller to compensate the button padding
              const SizedBox(height: 10),
              RecomendedSection(
                onPressedMore: () => print('aaaainn'),
                recomended: recomended,
              ),
              //* Height should be smaller to compensate the button padding
              const SizedBox(height: 10),
              LastOrderSection(
                onPressedMore: () => print('aaaaaaeeenn'),
                orders: orders,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
