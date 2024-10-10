import 'package:flutter/material.dart';

extension MySize on int {
  SizedBox get h => SizedBox(
        height: toDouble(),
      );
}
