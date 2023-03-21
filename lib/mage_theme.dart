import 'package:flutter/material.dart';

extension MagaTextTheme on TextTheme {
  TextStyle get regularInfo => const TextStyle();
  TextStyle get title => const TextStyle(fontSize: 24);
  TextStyle get info =>
      const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
}
