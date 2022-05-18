import 'package:flutter/material.dart';

abstract class AppColors {
  static Color get black => Colors.black;
  static Color get white => Colors.white;
  static Color get red => Colors.red;
  static Color get primary => const Color(0xff5458F7);
  static Color get background => const Color(0xFF191A1D);
  static Color get grey => const Color.fromARGB(150, 255, 255, 255);
  static Color get dividingLine =>  Colors.white.withOpacity(0.2);
  static Color get lightBlue => const Color(0xFFB2DFFF);
}

