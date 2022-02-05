import 'package:cake/core/themes/themes.dart';
import 'package:cake/core/widgets/rounded_icon_button/rounded_icon_button.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final Function()? onTap;
  final void Function(String)? onChange;
  final void Function(String)? onSubmitted;
  final VoidCallback? onTapFilters;
  final String label;
  final bool showFiltersButton;
  final Color boxColor;
  final Color textColor;
  final EdgeInsets padding;
  final height = 55.0;

  SearchBar({
    Key? key,
    this.label = 'Pesquise algo aqui',
    this.showFiltersButton = true,
    this.onTap,
    this.onTapFilters,
    this.onSubmitted,
    this.onChange,
    Color? boxColor,
    Color? textColor,
    EdgeInsets? padding,
  })  : boxColor = boxColor ?? AppColors.input.withAlpha(100),
        textColor = textColor ?? AppColors.grey,
        padding = padding ?? const EdgeInsets.symmetric(horizontal: 25),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: height,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: boxColor,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: TextField(
                onSubmitted: onSubmitted,
                onTap: onTap,
                onChanged: onChange,
                cursorColor: AppColors.primary,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: label,
                  hintStyle: TextStyle(fontSize: 16, color: textColor),
                  contentPadding: const EdgeInsets.only(
                      left: 10, right: 10, bottom: 7, top: 5),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: AppColors.grey,
                  ),
                ),
              ),
            ),
          ),
          if (showFiltersButton) ...[
            const SizedBox(width: 20),
            RoundedIconButton(
              icon: Icons.tune,
              onPressed: () => onTapFilters,
            ),
          ]
        ],
      ),
    );
  }

  //TextFormField with rounded borders
  // Container(
  //   width: size.width / 1.4,
  //   height: 50,
  //   alignment: Alignment.center,
  //   decoration: BoxDecoration(
  //       color: Colors.grey[200],
  //       borderRadius: BorderRadius.circular(40)),
  //   child: Padding(
  //     padding: EdgeInsets.only(left: 12),
  //     child: TextField(
  //       textCapitalization: TextCapitalization.sentences,
  //       style: AppTextStyles.buttonGrey,
  //       cursorHeight: 18,
  //       cursorColor: AppColors.grey,
  //       decoration: InputDecoration(
  //         enabledBorder: InputBorder.none,
  //         focusedBorder: InputBorder.none,
  //         focusColor: Colors.grey[600],
  //         isDense: true,
  //         icon: Icon(
  //           Icons.search,
  //           size: 30,
  //           color: AppColors.grey,
  //         ),
  //         hintText: "Procurando um livro específico?",
  //         hintStyle: AppTextStyles.input,
  //         counterStyle: AppTextStyles.buttonGrey,
  //       ),
  //     ),
  //   ),
  // ),
}
