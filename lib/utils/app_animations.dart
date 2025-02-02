import 'package:flutter/animation.dart';

class AppAnimations {
  static const Duration shortDuration = Duration(milliseconds: 200);
  static const Duration mediumDuration = Duration(milliseconds: 400);
  static const Duration longDuration = Duration(milliseconds: 600);

  static const Curve easeInOut = Curves.easeInOut;
  static const Curve fastOutSlowIn = Curves.fastOutSlowIn;

  // AnimatedContainer(
  // duration: AppAnimations.mediumDuration,
  // curve: AppAnimations.easeInOut,
  // color: AppColors.primaryColor,
  // width: 100.0,
  // height: 100.0,
  // );

}
