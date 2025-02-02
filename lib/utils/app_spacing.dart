import 'package:flutter/material.dart';

class AppSpacing {
  static const double small = 8.0;
  static const double medium = 16.0;
  static const double large = 24.0;
  static const double extraLarge = 32.0;

  // Custom EdgeInsets
  static const EdgeInsets screenPadding = EdgeInsets.symmetric(
    horizontal: medium,
    vertical: large,
  );

  static const EdgeInsets cardPadding = EdgeInsets.all(medium);
  static const EdgeInsets listItemSpacing = EdgeInsets.symmetric(vertical: small);
}
