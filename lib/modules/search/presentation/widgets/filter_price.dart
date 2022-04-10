import 'package:cake/core/constants.dart';
import 'package:cake/core/themes/themes.dart';
import 'package:cake/modules/search/search.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FilterPrice extends StatelessWidget {
  final int priceInFilter;
  final Function(int) onPressed;
  const FilterPrice(
      {Key? key, required this.priceInFilter, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _list = List.generate(
        Constants.filterDivisionsPrice,
        (index) =>
            (Constants.filterMaxPrice ~/ Constants.filterDivisionsPrice) *
            (index + 1),
        growable: true);
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: SizeConfig.width * 0.27,
        crossAxisSpacing: 10,
        mainAxisExtent: SizeConfig.height * 0.052,
        mainAxisSpacing: 10,
      ),
      // itemCount: Constants.filterPrices.length,
      // itemBuilder: (context, index) => FilterButton(
      //   text: 'até R\$ ${Constants.filterPrices[index].toStringAsFixed(2)}',
      //   isSelected: priceInFilter == Constants.filterPrices[index],
      //   onPressed: () => onPressed(Constants.filterPrices[index]),
      // ),
      itemCount: _list.length,
      itemBuilder: (context, index) => FilterButton(
        text: 'até ${NumberFormat.currency(
          symbol: 'R\$',
          decimalDigits: 2,
        ).format(_list[index])}',
        isSelected: priceInFilter == _list[index],
        onPressed: () => onPressed(_list[index]),
      ),
    );
    // return Slider(
    //   value: priceInFilter,
    //   max: Constants.filterMaxPrice,
    //   divisions: Constants.filterDivisionsPrice,
    //   label: 'Até R\$${priceInFilter.round()},00',
    //   activeColor: AppColors.accent,
    //   inactiveColor: AppColors.subAccent,
    //   onChanged: onPressed,
    // );
  }
}
