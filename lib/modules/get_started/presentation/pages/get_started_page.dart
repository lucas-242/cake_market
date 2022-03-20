import 'package:cake/core/themes/themes.dart';
import 'package:cake/modules/app/app.dart';
import 'package:cake/modules/get_started/get_started.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injector_container.dart' as di;

class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  State<GetStarted> createState() => _GetStartedState();

  static Page page() => const MaterialPage<void>(child: GetStarted());
}

class _GetStartedState extends State<GetStarted> {
  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    SizeConfig(context, kBottomNavigationBarHeight);

    return Scaffold(
      body: BlocProvider(
        create: (_) => di.instance<GetStartedCubit>(),
        child: Container(
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
                          const CallText(),
                          const SizedBox(height: 12),
                          BlocBuilder<GetStartedCubit, GetStartedState>(
                              builder: (context, state) {
                            return TextCarousel(
                              textList: state.texts,
                              currentText: state.currentText,
                              carouselController: _carouselController,
                              onTextChanged: (index, reason) => context
                                  .read<GetStartedCubit>()
                                  .textShowChanged(index),
                            );
                          }),
                        ],
                      ),
                      ActionButton(
                        onPressed: () =>
                            context.read<AppBloc>().add(const UserGetStarted()),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
