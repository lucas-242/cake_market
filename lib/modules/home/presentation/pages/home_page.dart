import 'package:cake/core/themes/themes.dart';
import 'package:cake/modules/product/product.dart';
import 'package:cake/modules/home/home.dart';
import 'package:cake/modules/home/presentation/widgets/last_order_section.dart';
import 'package:cake/modules/home/presentation/widgets/navbar_section.dart';
import 'package:cake/modules/home/presentation/widgets/recomended_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: HomePage());

  static const orders = [
    Product(
      name: 'Mocca Sugar Birthday Product',
      category: ProductCategory.torta,
      size: ProductSize.pequeno,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras aliquam tortor in libero imperdiet, vel sodales justo tincidunt. Ut venenatis maximus quam vel pulvinar. Sed aliquet turpis sodales vestibulum malesuada. In dolor elit, venenatis vitae ligula quis, pharetra finibus felis. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nulla vel arcu quam. Praesent sapien justo, auctor eu sapien sit amet, dapibus ornare tortor. Vivamus enim mauris, faucibus at ultrices in, commodo et est. Suspendisse nec laoreet justo, in posuere risus. Etiam magna velit, tincidunt ut arcu at, pellentesque fermentum enim. Praesent convallis ligula a venenatis ornare.',
      rating: 4.4,
      image: null,
    ),
    Product(
      name: 'Mocca Sugar Birthday Product',
      category: ProductCategory.torta,
      size: ProductSize.pequeno,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras aliquam tortor in libero imperdiet, vel sodales justo tincidunt. Ut venenatis maximus quam vel pulvinar. Sed aliquet turpis sodales vestibulum malesuada. In dolor elit, venenatis vitae ligula quis, pharetra finibus felis. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nulla vel arcu quam. Praesent sapien justo, auctor eu sapien sit amet, dapibus ornare tortor. Vivamus enim mauris, faucibus at ultrices in, commodo et est. Suspendisse nec laoreet justo, in posuere risus. Etiam magna velit, tincidunt ut arcu at, pellentesque fermentum enim. Praesent convallis ligula a venenatis ornare.',
      rating: 4.4,
      image: null,
    ),
  ];

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const NavbarSection(),
              const SizedBox(height: DefaultStyle.heightSpace),
              //* Height should be smaller to compensate the button padding
              const SizedBox(height: DefaultStyle.heightSmallSpace),
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is HomeError) {
                    return Text(state.errorMessage!);
                  } else if (state is HomeNoData) {
                    return const Text('Não há dados');
                  } else if (state is HomeInitial) {
                    context.read<HomeBloc>().add(const InitHomeEvent());
                    return Container();
                  } else if (state is HomeLoading) {
                    return const CircularProgressIndicator();
                  } else {
                    return RecomendedSection(
                      onPressedRecomended: (product) => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ProductDetails(product: product))),
                      onPressedMore: () => print('aaaainn'),
                      recomended: state.recomended,
                    );
                  }
                },
              ),
              //* Height should be smaller to compensate the button padding
              const SizedBox(height: DefaultStyle.heightSmallSpace),
              LastOrderSection(
                onPressedMore: () => print('aaaaaaeeenn'),
                orders: HomePage.orders,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
