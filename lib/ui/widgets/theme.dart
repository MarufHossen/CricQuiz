import 'dart:ui';

import 'package:flutter/cupertino.dart';

class CustomColors {

  const CustomColors();

  static const Color loginGradientStart = const Color(0xFF2ecc71);
  static const Color loginGradientEnd = const Color(0xFF16a085);

  static const primaryGradient = const LinearGradient(
    colors: const [loginGradientStart, loginGradientEnd],
    stops: const [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}