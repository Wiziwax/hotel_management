import 'package:flutter/material.dart';

class AppShadows {
  static const BoxShadow lightShadow = BoxShadow(
    color: Colors.black12,
    offset: Offset(0, 2),
    blurRadius: 4.0,
  );

  static const BoxShadow darkShadow = BoxShadow(
    color: Colors.black26,
    offset: Offset(0, 4),
    blurRadius: 8.0,
  );

  //
  // Container(
  // decoration: BoxDecoration(
  // color: AppColors.backgroundLight,
  // boxShadow: AppShadows.cardShadow,
  // borderRadius: BorderRadius.circular(AppDimensions.borderRadius),
  // ),
  // );

  static const List<BoxShadow> cardShadow = [lightShadow];
}
