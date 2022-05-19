import 'package:flutter/material.dart';

abstract class AppColors {
  static Color get black => Colors.black;
  static Color get white => Colors.white;
  static Color get red => Colors.red;
  static Color get primary => const Color(0xff5458F7);
  static Color get background => const Color(0xFF1C1C1D);
  static Color get grey => const Color.fromARGB(150, 255, 255, 255);
  static Color get dividingLine =>  Colors.white.withOpacity(0.2);
  static Color get lightBlue => const Color(0xFFB2DFFF);
  static Color get lightGrey => const Color(0xFF3A3A3C);
  static Color get darkBlack => const Color(0xFF060606);
  static Color get darkGrey => const Color(0xFF262628);
  static Color get mediumGrey => const Color(0xFF313131);
}

