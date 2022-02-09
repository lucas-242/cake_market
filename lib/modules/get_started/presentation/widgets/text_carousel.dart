import 'package:cake/core/themes/themes.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class TextCarousel extends StatefulWidget {
  final List<String> textList;
  final int currentText;
  final CarouselController carouselController;
  final Function(int, CarouselPageChangedReason) onTextChanged;
  const TextCarousel(
      {Key? key,
      required this.textList,
      required this.currentText,
      required this.carouselController,
      required this.onTextChanged})
      : super(key: key);

  @override
  _TextCarouselState createState() => _TextCarouselState();
}

class _TextCarouselState extends State<TextCarousel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: widget.carouselController,
          options: CarouselOptions(
            height: SizeConfig.height * 0.08,
            enableInfiniteScroll: true,
            viewportFraction: 1.0,
            onPageChanged: widget.onTextChanged,
          ),
          items: widget.textList.map((item) {
            return Builder(
              builder: (BuildContext context) {
                return Text(
                  item,
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: AppColors.white,
                  ),
                );
              },
            );
          }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.textList.asMap().entries.map((text) {
            return GestureDetector(
              onTap: () => widget.carouselController.animateToPage(text.key),
              child: Container(
                width: widget.currentText == text.key ? 20.0 : 12,
                height: 12.0,
                margin: const EdgeInsets.only(top: 8.0, left: 4.0, right: 4.0),
                decoration: widget.currentText == text.key
                    ? BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: const Color(0xFFCB5F5F),
                      )
                    : BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: AppColors.white.withOpacity(0.4),
                      ),
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}
