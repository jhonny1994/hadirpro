import 'package:flutter/material.dart';

class Spacing {
  // Define your spacing values here
  static const double xs = 4; // Extra Small
  static const double sm = 8; // Small
  static const double md = 16; // Medium
  static const double lg = 24; // Large
  static const double xl = 32; // Extra Large
  static const double xxl = 48; // Double Extra Large

  // You can also define vertical and horizontal spacings
  static const EdgeInsets verticalSm = EdgeInsets.symmetric(vertical: sm);
  static const EdgeInsets verticalMd = EdgeInsets.symmetric(vertical: md);
  static const EdgeInsets verticalLg = EdgeInsets.symmetric(vertical: lg);

  static const EdgeInsets horizontalSm = EdgeInsets.symmetric(horizontal: sm);
  static const EdgeInsets horizontalMd = EdgeInsets.symmetric(horizontal: md);
  static const EdgeInsets horizontalLg = EdgeInsets.symmetric(horizontal: lg);
}
