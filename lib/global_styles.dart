import 'package:flutter/material.dart';
import '../core/constants/colors.dart';
import '../core/constants/fonts.dart';

class GlobalStyles {
  static TextStyle get titleStyle => TextStyle(
    fontSize: AppText.font32,
    fontWeight: AppText.extraBold,
    // color: AppColors.black,
  );

  static TextStyle get labelButton => TextStyle(
    fontSize: AppText.font16,
    fontWeight: AppText.semiBold,
    color: AppColors.white,
  );

  static TextStyle get regularText =>
      TextStyle(fontSize: AppText.font14, fontWeight: AppText.regular);

  static TextStyle get inputPlaceholder => TextStyle(
    color: AppColors.placeholder,
    fontSize: AppText.font14,
    fontWeight: AppText.regular,
  );

  static TextStyle get hintText => TextStyle(
    color: AppColors.placeholder,
    fontSize: AppText.font14,
    // fontWeight: AppText.regular,
  );

  static TextStyle get mediumTitle =>
      TextStyle(fontSize: AppText.font20, fontWeight: AppText.bold);
  static TextStyle get textBold12 =>
      TextStyle(fontSize: AppText.font12, fontWeight: AppText.bold);
  static TextStyle get textBold14 =>
      TextStyle(fontSize: AppText.font14, fontWeight: AppText.bold);
  static TextStyle get textBold16 =>
      TextStyle(fontSize: AppText.font16, fontWeight: AppText.bold);
}
