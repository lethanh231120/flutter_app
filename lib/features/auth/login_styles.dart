import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/fonts.dart';

class LoginStyles {
  // static TextStyle get titleStyle => TextStyle(
  //   fontSize: AppText.font32,
  //   fontWeight: AppText.extraBold,
  //   color: AppColors.black,
  // );

  // static TextStyle get inputTextStyle => TextStyle(
  //   color: AppColors.placeholder,
  //   fontSize: AppText.font14,
  //   fontWeight: AppText.regular,
  // );

  static TextStyle get textUnderline => TextStyle(
    fontSize: AppText.font14,
    fontWeight: AppText.semiBold,
    color: AppColors.primary,
    decoration: TextDecoration.combine([TextDecoration.underline]),
    decorationColor: AppColors.primary,
    decorationThickness: 1.5,
  );

  static TextStyle get subTitle => TextStyle(
    color: AppColors.black,
    fontWeight: AppText.medium,
    fontSize: AppText.font16,
  );

  static TextStyle get textStyle => TextStyle(
    color: AppColors.black,
    fontWeight: AppText.medium,
    fontSize: AppText.font14,
  );
}
