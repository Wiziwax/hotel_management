import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppGradients {
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [AppColors.lightPrimaryColor, AppColors.primaryColor],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient backgroundGradient = LinearGradient(
    colors: [AppColors.backgroundLight, AppColors.backgroundDark],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // Container(
  // decoration: BoxDecoration(
  // gradient: AppGradients.primaryGradient,
  // ),
  // );

}
