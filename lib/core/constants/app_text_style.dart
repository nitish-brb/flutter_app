import 'package:flutter/material.dart';
import 'constant_imports.dart';

class AppTextStyles {
  static TextStyle header() {
    return AppTextStyles.boldText(fontSize: Dimensions.px30);
  }

  static TextStyle regularText({
    double? height,
    Color color = ColorConstants.black,
    bool isUnderline = false,
    double fontSize = Dimensions.px15,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
      color: color,
      height: height,
      fontFamily: 'Gilroy',
      decoration: isUnderline ? TextDecoration.underline : TextDecoration.none,
    );
  }
  static TextStyle regularTextWithFutura({
    double? height,
    Color color = ColorConstants.black,
    bool isUnderline = false,
    double fontSize = Dimensions.px15,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
      color: color,
      height: height,
      fontFamily: 'Futura',
      decoration: isUnderline ? TextDecoration.underline : TextDecoration.none,
    );
  }
  static TextStyle mediumText({
    double? height,
    Color color = ColorConstants.black,
    bool isUnderline = false,
    double fontSize = Dimensions.px15,
  }) {
    return TextStyle(
      fontFamily: 'Gilroy',
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
      color: color,
      height: height,
      decoration: isUnderline ? TextDecoration.underline : TextDecoration.none,
    );
  }

  static TextStyle mediumTextWithFutura({
    double? height,
    Color color = ColorConstants.black,
    bool isUnderline = false,
    double fontSize = Dimensions.px15,
  }) {
    return TextStyle(
      fontFamily: 'Futura',
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
      color: color,
      height: height,
      decoration: isUnderline ? TextDecoration.underline : TextDecoration.none,
    );
  }

  static TextStyle semiBoldText({
    double? height,
    Color color = ColorConstants.black,
    bool isUnderline = false,
    double fontSize = Dimensions.px15,
  }) {
    return TextStyle(
      fontFamily: 'Gilroy',
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
      color: color,
      height: height,
      decoration: isUnderline ? TextDecoration.underline : TextDecoration.none,
    );
  }

  static TextStyle semiBoldTextWithFutura({
    double? height,
    Color color = ColorConstants.black,
    bool isUnderline = false,
    double fontSize = Dimensions.px15,
  }) {
    return TextStyle(
      fontFamily: 'Futura',
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
      color: color,
      height: height,
      decoration: isUnderline ? TextDecoration.underline : TextDecoration.none,
    );
  }

  static TextStyle boldText({
    double? height,
    Color color = ColorConstants.black,
    bool isUnderline = false,
    double fontSize = Dimensions.px15,
  }) {
    return TextStyle(
      fontFamily: 'Futura',
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: color,
      height: height,
      decoration: isUnderline ? TextDecoration.underline : TextDecoration.none,
    );
  }

  static TextStyle boldTextWithFutura({
    double? height,
    Color color = ColorConstants.black,
    bool isUnderline = false,
    double fontSize = Dimensions.px15,
  }) {
    return TextStyle(
      fontFamily: 'Futura',
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: color,
      height: height,
      decoration: isUnderline ? TextDecoration.underline : TextDecoration.none,
    );
  }
}
