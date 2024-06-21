import 'package:flutter/material.dart';

class AppColor {
  static final colorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 102, 6, 247),
    surface: const Color.fromARGB(255, 56, 49, 66),
  );

  static const Color darkPurple = Color.fromARGB(255, 24, 20, 30);

  static const Color topBoxTransparent = Color.fromARGB(109, 0, 0, 0);
  static const Color bottomBoxTransparent = Color.fromARGB(210, 0, 0, 0);
}
