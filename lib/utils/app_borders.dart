import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_dimensions.dart';


class AppBorders {
  static BorderSide thinBorder = BorderSide(color: AppColors.primaryColor, width: 1.0);
  static BorderSide thickBorder = BorderSide(color: AppColors.primaryColor, width: 2.0);

  static OutlineInputBorder inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(AppDimensions.borderRadius),
    borderSide: BorderSide(color: AppColors.primaryColor),
  );

  // TextField(
  // decoration: InputDecoration(
  // border: AppBorders.inputBorder,
  // focusedBorder: AppBorders.inputBorder,
  // enabledBorder: AppBorders.inputBorder,
  // ),
  // );

}
