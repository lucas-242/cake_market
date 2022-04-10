import 'package:cake/core/themes/themes.dart';
import 'package:flutter/material.dart';

class FilterNavbar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onBack;
  final VoidCallback? onClean;
  const FilterNavbar({Key? key, this.onBack, this.onClean}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: SizedBox(
        height: SizeConfig.height * 0.2,
        child: Padding(
          padding: const EdgeInsets.only(
              top: 35,
              left: DefaultStyle.paddingValue / 2,
              right: DefaultStyle.paddingValue),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: onBack,
                padding: EdgeInsets.zero,
                splashColor: Colors.transparent,
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: AppColors.icons,
                ),
              ),
              const Text(
                'Filtros',
                style: TextStyle(
                  fontSize: 20,
                  color: AppColors.accent,
                  fontWeight: FontWeight.w700,
                ),
              ),

              TextButton(
                onPressed: onClean,
                child: const Text(
                  'Limpar',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.icons,
                  ),
                ),
              ),
              // actions != null ? Row(children: actions!) : Container(width: 50),
            ],
          ),
        ),
      ),
      // child: Padding(
      //   padding: const EdgeInsets.only(
      //       left: DefaultStyle.paddingValue / 2,
      //       right: DefaultStyle.paddingValue),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       IconButton(
      //         onPressed: onBack,
      //         padding: EdgeInsets.zero,
      //         splashColor: Colors.transparent,
      //         icon: const Icon(
      //           Icons.arrow_back_ios_new,
      //           color: AppColors.icons,
      //         ),
      //       ),
      //       const Text(
      //         'Filtros',
      //         style: TextStyle(
      //           fontSize: 20,
      //           color: AppColors.accent,
      //           fontWeight: FontWeight.w700,
      //         ),
      //       ),
      //       TextButton(
      //         onPressed: onClean,
      //         child: const Text(
      //           'Limpar',
      //           style: TextStyle(
      //             fontSize: 16,
      //             color: AppColors.icons,
      //           ),
      //         ),
      //       )
      //     ],
      //   ),
      // ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(SizeConfig.height * 0.07);
}
