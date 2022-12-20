import 'package:flutter/cupertino.dart';

class Responsive {
  double widthConfig;
  double heightConfig;
  double textConfig;
  double imageConfig;

  Responsive._sharedConstructor({
    required this.widthConfig,
    required this.heightConfig,
    required this.imageConfig,
    required this.textConfig,
  });

  static final Responsive _shared = Responsive._sharedConstructor(
    widthConfig: 0,
    heightConfig: 0,
    imageConfig: 0,
    textConfig: 0,
  );

  factory Responsive() => _shared;

  void init({required BoxConstraints constraints}) {
    widthConfig = constraints.maxWidth / 100;
    heightConfig = constraints.maxHeight / 100;
    imageConfig = constraints.maxWidth / 100;
    textConfig = constraints.maxHeight / 100;
  }
}
