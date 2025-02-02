import 'package:flutter/material.dart';
import 'package:hotel_management/utils/app_text_styles.dart';
import 'app_colors.dart';
import 'app_dimensions.dart';
import 'app_fonts.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    brightness: Brightness.light,
    fontFamily: AppFonts.primaryFont,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      brightness: Brightness.light,
      primary: AppColors.primaryColor,
      secondary: AppColors.lightPrimaryColor,
    ),
    textTheme: TextTheme(
      bodyLarge: AppTextStyles.largeText,
      bodyMedium: AppTextStyles.mediumText,
      bodySmall: AppTextStyles.normalText,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        padding: EdgeInsets.all(AppDimensions.paddingMedium),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.borderRadius),
        ),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.darkPrimaryColor,
    scaffoldBackgroundColor: AppColors.backgroundDark, // Default dark background
    brightness: Brightness.dark,
    fontFamily: AppFonts.primaryFont,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.darkPrimaryColor,
      brightness: Brightness.dark,
      primary: AppColors.darkPrimaryColor,
      secondary: AppColors.lightPrimaryColor,
    ),
    textTheme: TextTheme(
      bodyLarge: AppTextStyles.largeText.copyWith(color: AppColors.textDark),
      bodyMedium: AppTextStyles.mediumText.copyWith(color: AppColors.textDark),
      bodySmall: AppTextStyles.normalText.copyWith(color: AppColors.textDark),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.darkPrimaryColor,
        padding: EdgeInsets.all(AppDimensions.paddingMedium),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.borderRadius),
        ),
      ),
    ),
  );

  // Gradient for dark mode
  static BoxDecoration darkBackgroundDecoration = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Colors.grey.shade900,
        Colors.grey.shade800,
        Colors.grey.shade700,
      ],
    ),
  );
}