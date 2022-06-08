import 'package:flutter/material.dart';

class AppColors {
  static String primary = "#2196f3";
  static String secondary = "#fff709";
  static String dark = "#252324";
  static String background = "#181818";
  static String error = "#f1f1f1";

  static Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  static Color getPrimary() {
    return hexToColor(primary);
  }

  static Color getSecondary() {
    return hexToColor(secondary);
  }

  static Color getDark() {
    return hexToColor(dark);
  }

  static Color getBackground() {
    return hexToColor(background);
  }

  static Color getError() {
    return hexToColor(error);
  }
}