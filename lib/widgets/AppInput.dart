import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/core/constants/colors.dart';
import 'package:my_app/global_styles.dart';

class AppInput extends StatelessWidget {
  final String? label;
  final String? placeholder;
  final TextEditingController? controller;
  final bool obscureText;
  final bool border;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double? width; // thêm width
  final double? height;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final Color? backgroundColor;
  final double? borderRadius;
  final String? type;

  const AppInput({
    super.key,
    this.label,
    this.placeholder,
    this.controller,
    this.obscureText = false,
    this.border = true,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.prefixIcon,
    this.width,
    this.height,
    this.inputFormatters,
    this.focusNode,
    this.onChanged,
    this.backgroundColor,
    this.borderRadius,
    this.type = 'default',
  });

  @override
  Widget build(BuildContext context) {
    final rowContent = Row(
      children: [
        if (prefixIcon != null) ...[prefixIcon!],

        Expanded(
          child: TextField(
            controller: controller,
            focusNode: focusNode,
            obscureText: obscureText,
            keyboardType: keyboardType,
            style: GlobalStyles.regularText.copyWith(
              fontSize: type == 'square' ? 18 : 16,
            ),
            inputFormatters: inputFormatters,
            onChanged: onChanged,
            textAlign: TextAlign.start,
            decoration: InputDecoration(
              hintText: placeholder,
              hintStyle: GlobalStyles.hintText.copyWith(fontSize: 16),
              border: InputBorder.none, // border do Container quản lý
              isDense: true,
              contentPadding: EdgeInsets.zero,
            ),
          ),
        ),

        if (suffixIcon != null) ...[suffixIcon!],
      ],
    );

    final container = Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.white,
        border: Border.all(
          color: border ? AppColors.border : Colors.transparent,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(borderRadius ?? 8),
      ),
      child: rowContent,
    );

    if (width != null || height != null) {
      return SizedBox(width: width, height: height, child: container);
    }

    return container;
  }
}
