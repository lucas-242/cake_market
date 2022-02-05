import 'package:cake/core/themes/themes.dart';
import 'package:cake/modules/app/app.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  State<GetStarted> createState() => _GetStartedState();

  static Page page() => const MaterialPage<void>(child: GetStarted());
}

class _GetStartedState extends State<GetStarted> {
  final CarouselController _controller = CarouselController();
  final textList = [
    'Encontre as mais deliciosas tortas e doces com qualidade incomparável',
    'Experimente também nossos salgados feito com todo o amor',
    'Entregamos em todo o Rio de Janeiro no conforto da sua casa',
  ];
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig(context, kBottomNavigationBarHeight);

    return Scaffold(
      body: Container(
        color: const Color(0xFFFFFCF5),
        child: Stack(
          children: [
            Image.asset(
              AppImages.logo,
              height: SizeConfig.height * 0.6,
            ),
            CustomPaint(
              size: Size(SizeConfig.width, SizeConfig.height),
              painter: CurvedPainter(),
            ),
            Positioned(
              width: SizeConfig.width,
              height: SizeConfig.height * 0.46,
              bottom: SizeConfig.height * 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        _getText(),
                        const SizedBox(height: 12),
                        Column(
                          children: [
                            CarouselSlider(
                              carouselController: _controller,
                              options: CarouselOptions(
                                  height: SizeConfig.height * 0.08,
                                  enableInfiniteScroll: true,
                                  viewportFraction: 1.0,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      _current = index;
                                    });
                                  }),
                              items: textList.map((item) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return Text(
                                      item,
                                      textAlign: TextAlign.center,
                                      maxLines: 3,
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.white,
                                      ),
                                    );
                                  },
                                );
                              }).toList(),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: textList.asMap().entries.map((entry) {
                                return GestureDetector(
                                  onTap: () =>
                                      _controller.animateToPage(entry.key),
                                  child: Container(
                                    width: 20.0,
                                    height: 12.0,
                                    margin: const EdgeInsets.only(
                                        top: 8.0, left: 4.0, right: 4.0),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                        color: (_current == entry.key
                                            ? const Color(0xFFCB5F5F)
                                            // ? const Color(0xFF1D321D)
                                            : Colors.white.withOpacity(0.4))
                                        // .withOpacity(_current == entry.key
                                        //     ? 0.9
                                        //     : 0.4)
                                        ),
                                  ),
                                );
                              }).toList(),
                            )
                          ],
                        ),
                        // _getCarousel(
                        //     context, _controller, size, textList, _current),
                      ],
                    ),
                    _getButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getButton() => ElevatedButton(
        onPressed: () => context.read<AppBloc>().add(const UserGetStarted()),
        child: const Text('Quero Provar'),
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(const Color(0xFFCB5F5F)),
          // MaterialStateProperty.all<Color>(const Color(0xFF1D321D)),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          padding:
              MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 40,
          )),
          textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(
            color: Colors.white,
            fontSize: 20,
          )),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
        ),
        // style: ElevatedButton.styleFrom(
        //   primary: const Color(0xFFD8B6A9),
        //   onPrimary: Colors.white,
        //   padding: const EdgeInsets.symmetric(
        //     vertical: 20,
        //     horizontal: 40,
        //   ),
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(50.0),
        //   ),
        //   // shape: OutlinedBorder(side: BorderSide.none),
        //   textStyle: const TextStyle(
        //     color: Colors.white,
        //     fontSize: 20,
        //   ),
        // ),
      );

  Widget _getText() => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 25.0),
            child: Center(
              child: Text(
                'Busque e Encontre as',
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          RichText(
            text: const TextSpan(
              text: 'Melhores ',
              children: [
                TextSpan(
                  text: 'Tortas',
                  style: TextStyle(color: Color(0xFFCB5F5F)),
                  // style: TextStyle(color: Color(0xFF1D321D)),
                )
              ],
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
              ),
            ),
          ),
        ],
      );
}

class CurvedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      // ..color = Color(0xFFD8B6A9)
      // ..color = Color(0xFFFFFCF5)
      // ..color = const Color(0xFFCB5F5F)
      ..color = const Color(0xFF1D321D)
      // ..color = const Color(0xFF109172)
      ..strokeWidth = 1;

    var path = Path();

    path.moveTo(0, size.height * 0.585);
    path.quadraticBezierTo(
        size.width / 1.85, size.height * 0.5, size.width, size.height * 0.573);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
