import 'package:cake/core/themes/themes.dart';
import 'package:cake/core/widgets/search_bar/search_bar.dart';
import 'package:cake/modules/cake/cake.dart';
import 'package:cake/modules/home/presentation/widgets/last_order_section.dart';
import 'package:cake/modules/home/presentation/widgets/navbar_section.dart';
import 'package:cake/modules/home/presentation/widgets/recomended_section.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: HomePage());

  static const recomended = [
    Cake(
      name: 'Strawberry Birthday Cake',
      type: CakeType.butterCake,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras aliquam tortor in libero imperdiet, vel sodales justo tincidunt. Ut venenatis maximus quam vel pulvinar. Sed aliquet turpis sodales vestibulum malesuada. In dolor elit, venenatis vitae ligula quis, pharetra finibus felis. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nulla vel arcu quam. Praesent sapien justo, auctor eu sapien sit amet, dapibus ornare tortor. Vivamus enim mauris, faucibus at ultrices in, commodo et est. Suspendisse nec laoreet justo, in posuere risus. Etiam magna velit, tincidunt ut arcu at, pellentesque fermentum enim. Praesent convallis ligula a venenatis ornare.',
      rating: 4.4,
      image: null,
    ),
    Cake(
      name: 'Lemon Birthday Cake',
      type: CakeType.angelCake,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras aliquam tortor in libero imperdiet, vel sodales justo tincidunt. Ut venenatis maximus quam vel pulvinar. Sed aliquet turpis sodales vestibulum malesuada. In dolor elit, venenatis vitae ligula quis, pharetra finibus felis. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nulla vel arcu quam. Praesent sapien justo, auctor eu sapien sit amet, dapibus ornare tortor. Vivamus enim mauris, faucibus at ultrices in, commodo et est. Suspendisse nec laoreet justo, in posuere risus. Etiam magna velit, tincidunt ut arcu at, pellentesque fermentum enim. Praesent convallis ligula a venenatis ornare.',
      rating: 4.4,
      image: null,
    ),
    Cake(
      name: 'Mocca Sugar Birthday Cake',
      type: CakeType.spongeCake,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras aliquam tortor in libero imperdiet, vel sodales justo tincidunt. Ut venenatis maximus quam vel pulvinar. Sed aliquet turpis sodales vestibulum malesuada. In dolor elit, venenatis vitae ligula quis, pharetra finibus felis. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nulla vel arcu quam. Praesent sapien justo, auctor eu sapien sit amet, dapibus ornare tortor. Vivamus enim mauris, faucibus at ultrices in, commodo et est. Suspendisse nec laoreet justo, in posuere risus. Etiam magna velit, tincidunt ut arcu at, pellentesque fermentum enim. Praesent convallis ligula a venenatis ornare.',
      rating: 4.4,
      image: null,
    ),
    Cake(
      name: 'Carrot Birthday Cake',
      type: CakeType.vegetableOilCake,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras aliquam tortor in libero imperdiet, vel sodales justo tincidunt. Ut venenatis maximus quam vel pulvinar. Sed aliquet turpis sodales vestibulum malesuada. In dolor elit, venenatis vitae ligula quis, pharetra finibus felis. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nulla vel arcu quam. Praesent sapien justo, auctor eu sapien sit amet, dapibus ornare tortor. Vivamus enim mauris, faucibus at ultrices in, commodo et est. Suspendisse nec laoreet justo, in posuere risus. Etiam magna velit, tincidunt ut arcu at, pellentesque fermentum enim. Praesent convallis ligula a venenatis ornare.',
      rating: 4.4,
      image: null,
    ),
    Cake(
      name: 'Vanilla Birthday Cake',
      type: CakeType.chiffonCake,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras aliquam tortor in libero imperdiet, vel sodales justo tincidunt. Ut venenatis maximus quam vel pulvinar. Sed aliquet turpis sodales vestibulum malesuada. In dolor elit, venenatis vitae ligula quis, pharetra finibus felis. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nulla vel arcu quam. Praesent sapien justo, auctor eu sapien sit amet, dapibus ornare tortor. Vivamus enim mauris, faucibus at ultrices in, commodo et est. Suspendisse nec laoreet justo, in posuere risus. Etiam magna velit, tincidunt ut arcu at, pellentesque fermentum enim. Praesent convallis ligula a venenatis ornare.',
      rating: 4.4,
      image: null,
    ),
  ];

  static const orders = [
    Cake(
      name: 'Mocca Sugar Birthday Cake',
      type: CakeType.butterCake,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras aliquam tortor in libero imperdiet, vel sodales justo tincidunt. Ut venenatis maximus quam vel pulvinar. Sed aliquet turpis sodales vestibulum malesuada. In dolor elit, venenatis vitae ligula quis, pharetra finibus felis. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nulla vel arcu quam. Praesent sapien justo, auctor eu sapien sit amet, dapibus ornare tortor. Vivamus enim mauris, faucibus at ultrices in, commodo et est. Suspendisse nec laoreet justo, in posuere risus. Etiam magna velit, tincidunt ut arcu at, pellentesque fermentum enim. Praesent convallis ligula a venenatis ornare.',
      rating: 4.4,
      image: null,
    ),
    Cake(
      name: 'Mocca Sugar Birthday Cake',
      type: CakeType.butterCake,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras aliquam tortor in libero imperdiet, vel sodales justo tincidunt. Ut venenatis maximus quam vel pulvinar. Sed aliquet turpis sodales vestibulum malesuada. In dolor elit, venenatis vitae ligula quis, pharetra finibus felis. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nulla vel arcu quam. Praesent sapien justo, auctor eu sapien sit amet, dapibus ornare tortor. Vivamus enim mauris, faucibus at ultrices in, commodo et est. Suspendisse nec laoreet justo, in posuere risus. Etiam magna velit, tincidunt ut arcu at, pellentesque fermentum enim. Praesent convallis ligula a venenatis ornare.',
      rating: 4.4,
      image: null,
    ),
  ];

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
              const SearchBar(
                label: 'Pesquise uma delícia aqui',
              ),
              //* Height should be smaller to compensate the button padding
              const SizedBox(height: DefaultStyle.heightSmallSpace),
              RecomendedSection(
                onPressedRecomended: (cake) => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CakeDetails(cake: cake))),
                onPressedMore: () => print('aaaainn'),
                recomended: recomended,
              ),
              //* Height should be smaller to compensate the button padding
              const SizedBox(height: DefaultStyle.heightSmallSpace),
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
