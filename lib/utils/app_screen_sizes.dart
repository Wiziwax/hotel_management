import 'package:flutter/cupertino.dart';

class ScreenSize {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 &&
          MediaQuery.of(context).size.width < 1200;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;



  // double getPadding(BuildContext context) {
  //   if (ScreenSize.isDesktop(context)) return AppSpacing.large;
  //   if (ScreenSize.isTablet(context)) return AppSpacing.medium;
  //   return AppSpacing.small;
  // }

}
