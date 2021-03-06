import 'package:flutter/material.dart';

import 'app_colors.dart';

enum SnackBarType { success, error, none }

SnackBar getAppSnackBar({
  VoidCallback? onClose,
  SnackBarType type = SnackBarType.none,
  required String message,
}) {
  return SnackBar(
    content: Text(message),
    duration: const Duration(seconds: 4),
    backgroundColor: type == SnackBarType.error
        ? AppColors.error
        : (type == SnackBarType.success ? AppColors.success : AppColors.alert),
    action: SnackBarAction(
      label: 'x',
      textColor: AppColors.secondaryTexts,
      onPressed: () => onClose,
    ),
  );
}
