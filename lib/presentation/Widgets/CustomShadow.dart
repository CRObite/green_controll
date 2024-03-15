
import 'package:flutter/material.dart';

class CustomShadow {
  static List<BoxShadow> shadow  = [
    BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      spreadRadius: 3,
      blurRadius: 3,
      offset: Offset(0, 3),
    ),
  ];
}