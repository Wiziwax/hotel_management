import 'package:flutter/material.dart';

// General Theme Colors
class AppColors {
  // Primary Colors
  static const primaryColor = Color(0xFF2A4331);
  static const primaryBlue = Color(0xFF2A5A9E);
  static const lightPrimaryColor = Color(0xFF59A9B4);
  static const darkPrimaryColor = Color(0xFFFFFFFF);

  // Background Colors
  static const backgroundLight = Color(0xFFFFFFFF); // Light mode background
  static const backgroundDark = Color(0xFF272626); // Dark mode background

  // Text Colors
  static const textLight = Color(0xFF000000); // Text color in light mode
  static const textDark = Color(0xFFFFFFFF); // Text color in dark mode

  // Error Color
  static const errorColor = Color(0xFFCF6679);

  // Additional Colors
  static const myColor = Color(0xFF6E6586);
  static const myBlue = Color(0xFF2A5A9E);
  static const myBlueBackground = Color(0xFFE6F2F9);
  static const sweetGreen = Color(0xFF92E3A9);
  static const prettyOrange = Color(0xFFFF725E);

  // Gradients
  static LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      primaryColor,
      primaryBlue,
      lightPrimaryColor,
    ],
  );

  static LinearGradient secondaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      sweetGreen,
      prettyOrange,
    ],
  );

  static const leaderboardBackground = Color(0xFFF0F0F0); // Example background color
  static const rankTextColor = Color(0xFF333333); // Example rank text color
  static const pointsTextColor = Color(0xFF555555); // Example points text color
  static const nameTextColor = Color(0xFF000000); // Example name text color
  static const lovelyYellow = Color(0xFFFFC727); // Example name text color


}

// Helper function for dynamic spacing
EdgeInsetsGeometry appPadding(double value) {
  return EdgeInsets.all(value);
}