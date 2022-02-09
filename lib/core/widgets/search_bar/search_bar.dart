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

  const SearchBar({
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
  })  : boxColor = boxColor ?? AppColors.white,
        textColor = textColor ?? AppColors.inputText,
        padding = padding ?? DefaultStyle.paddingHorizontal,
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
                borderRadius: DefaultStyle.roundedTinyShapeRadius,
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
                  prefixIcon: const Icon(
                    Icons.search,
                    color: AppColors.inputText,
                  ),
                ),
              ),
            ),
          ),
          if (showFiltersButton) ...[
            const SizedBox(width: DefaultStyle.widthSpace),
            RoundedIconButton(
              icon: Icons.tune,
              onPressed: () => onTapFilters,
            ),
          ]
        ],
      ),
    );
  }
}
