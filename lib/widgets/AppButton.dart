// lib/widgets/app_button.dart
import 'package:flutter/material.dart';
import '../core/constants/colors.dart';
import '../core/constants/fonts.dart';
import '../global_styles.dart';

enum ButtonType { primary, outline, success, warning, error, text, underline }

class AppButton extends StatelessWidget {
  final String label;
  final Widget? icon;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final ButtonType type;
  final bool enabled;
  final bool loading;
  final VoidCallback? onPressed;
  final String? size;

  const AppButton({
    Key? key,
    required this.label,
    this.icon,
    this.suffixIcon,
    this.prefixIcon,
    this.type = ButtonType.primary,
    this.enabled = true,
    this.loading = false,
    this.onPressed,
    this.size = 'default',
  }) : super(key: key);

  Color get _bgColor {
    if (!enabled) return AppColors.border;
    return switch (type) {
      ButtonType.primary => AppColors.primary,
      ButtonType.success => AppColors.btnSuccess,
      ButtonType.warning => AppColors.btnWarning,
      ButtonType.error => AppColors.btnError,
      _ => Colors.transparent,
    };
  }

  Color get _foregroundColor {
    if (!enabled) return AppColors.mediumBlack;
    return switch (type) {
      ButtonType.primary => AppColors.white,
      ButtonType.success => AppColors.white,
      ButtonType.warning => AppColors.white,
      ButtonType.error => AppColors.white,
      ButtonType.outline => AppColors.primary,
      ButtonType.text => AppColors.primary,
      ButtonType.underline => AppColors.black,
    };
  }

  Color get _borderColor {
    if (!enabled) return AppColors.border;
    return type == ButtonType.outline ? AppColors.primary : Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    final borderStyles = {
      ButtonType.outline: Border.all(color: _borderColor, width: 2),
      ButtonType.underline: Border(
        bottom: BorderSide(color: AppColors.black, width: 1),
      ),
      // ).all(color: Colors.green, width: 2),
    };

    final bool canClick = enabled && !loading && onPressed != null;

    return Opacity(
      opacity: enabled ? 1.0 : 0.5,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          // borderRadius: type == ButtonType.underline
          //     ? null
          //     : BorderRadius.circular(25),
          onTap: canClick ? onPressed : null,
          child: Container(
            constraints: BoxConstraints(minHeight: size == 'small' ? 0 : 45),
            padding: EdgeInsets.symmetric(
              vertical: size == 'small' ? 0 : 16,
              horizontal: type == ButtonType.underline ? 0 : 6,
            ),
            decoration: BoxDecoration(
              color: _bgColor,
              borderRadius: type == ButtonType.underline
                  ? null
                  : BorderRadius.circular(25),
              border: borderStyles[type],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (loading) ...[
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.5,
                      valueColor: AlwaysStoppedAnimation(_foregroundColor),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    "Đang xử lý...",
                    style: TextStyle(
                      color: _foregroundColor,
                      fontSize: size == 'small'
                          ? AppText.font12
                          : AppText.font16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ] else ...[
                  // if (icon != null) ...[
                  //   DefaultTextStyle(
                  //     style: TextStyle(color: _foregroundColor),
                  //     child: IconTheme(
                  //       data: IconThemeData(color: _foregroundColor, size: 20),
                  //       child: icon!,
                  //     ),
                  //   ),
                  //   const SizedBox(width: 8),
                  // ],
                  if (prefixIcon != null) ...[prefixIcon!],
                  SizedBox(width: 6),
                  Text(
                    label,
                    style: size == 'small'
                        ? GlobalStyles.textBold12.copyWith(
                            color: _foregroundColor,
                          )
                        : GlobalStyles.labelButton.copyWith(
                            color: _foregroundColor,
                          ),
                  ),
                  SizedBox(width: 6),
                  if (suffixIcon != null) ...[suffixIcon!],
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
