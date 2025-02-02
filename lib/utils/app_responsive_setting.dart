import 'package:flutter/cupertino.dart';

double responsiveValue(BuildContext context, double small, double large) {
  return MediaQuery.of(context).size.width < 600 ? small : large;
}
