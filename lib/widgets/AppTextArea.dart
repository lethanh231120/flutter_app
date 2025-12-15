import 'package:flutter/material.dart';
import 'package:my_app/core/constants/colors.dart';

class AppTextArea extends StatelessWidget {
  final TextEditingController? controller;
  final String label;
  final String hint;
  final int minLines;
  final int maxLines;
  final double? width; // thêm width
  final double borderRadius;
  final Color borderColor;
  final double borderWidth;
  final bool border;
  final Color? backgroundColor;

  const AppTextArea({
    super.key,
    this.controller,
    this.label = '',
    this.hint = '',
    this.minLines = 1,
    this.maxLines = 10,
    this.borderRadius = 10,
    this.borderColor = Colors.grey,
    this.borderWidth = 1,
    this.width,
    this.border = true,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final child = Expanded(
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.multiline,
        minLines: minLines,
        maxLines: maxLines,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          hintStyle: TextStyle(color: AppColors.placeholder),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: border
                ? BorderSide(color: borderColor, width: borderWidth)
                : BorderSide(color: Colors.transparent),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: border
                ? BorderSide(color: borderColor, width: borderWidth)
                : BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: border
                ? BorderSide(color: AppColors.primary, width: borderWidth)
                : BorderSide(color: Colors.transparent),
          ),
          contentPadding: const EdgeInsets.all(12), // padding bên trong
        ),
      ),
    );

    final container = Container(
      // padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.white,
        border: Border.all(
          color: border ? AppColors.border : Colors.transparent,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: child,
    );
    if (width != null) {
      return SizedBox(width: width, child: container);
    }
    return container;
  }
}
