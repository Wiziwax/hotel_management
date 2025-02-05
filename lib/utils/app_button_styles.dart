import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_dimensions.dart';
import 'app_text_styles.dart';

class AppButtonStyles {
  static ButtonStyle primaryButton = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primaryColor,
    padding: EdgeInsets.symmetric(
      vertical: AppDimensions.paddingMedium,
      horizontal: AppDimensions.paddingLarge,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppDimensions.borderRadius),
    ),
    textStyle: AppTextStyles.mediumText.copyWith(color: AppColors.textLight),
  );

  static ButtonStyle secondaryButton = OutlinedButton.styleFrom(
    side: BorderSide(color: AppColors.primaryColor),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppDimensions.borderRadius),
    ),
    padding: EdgeInsets.symmetric(
      vertical: AppDimensions.paddingSmall,
      horizontal: AppDimensions.paddingMedium,
    ),
    textStyle: AppTextStyles.mediumText.copyWith(color: AppColors.textDark),
  );

  // Usage
  //
  // ElevatedButton(
  // onPressed: () {},
  // style: AppButtonStyles.primaryButton,
  // child: Text('Primary Button'),
  // );
  //
  // OutlinedButton(
  // onPressed: () {},
  // style: AppButtonStyles.secondaryButton,
  // child: Text('Secondary Button'),
  // );

}


