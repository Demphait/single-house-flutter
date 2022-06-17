import 'dart:math';

import 'package:flutter/material.dart';

final Random _random = Random();

extension IntRandom on int {
  // static int next(int maxValue) => _random.nextInt(maxValue);
  int get rand => _random.nextInt(this);
}

extension DoubleRandom on double {
  // static int next(int maxValue) => _random.nextInt(maxValue);
  double get rand => _random.nextDouble() * this;
  Color get randColor => Color((_random.nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
}
