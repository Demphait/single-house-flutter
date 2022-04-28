import 'package:flutter/material.dart';

abstract class AppColors {
  static Color get black => Colors.black;
  static Color get white => Colors.white;
  static Color get primary => const Color(0xff5458F7);
  static Color get background => const Color(0xFF191A1D);
  static Color get search => const Color.fromARGB(150, 255, 255, 255);
  static Color get unactiveFolder => const Color(0xFFB2DFFF);
  static Color get dividingLine =>  Colors.white.withOpacity(0.2);
  static Color get colorMenu => const Color(0xFFB2DFFF);
}

