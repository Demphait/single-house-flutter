import 'dart:math';

final Random _random = Random();

extension IntRandom on int {
  // static int next(int maxValue) => _random.nextInt(maxValue);
  int get rand => _random.nextInt(this);
}

extension DoubleRandom on double {
  // static int next(int maxValue) => _random.nextInt(maxValue);
  double get rand => _random.nextDouble() * this;
}
