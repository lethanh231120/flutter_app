import 'package:flutter/widgets.dart';
import 'package:my_app/core/constants/colors.dart';
import 'package:my_app/global_styles.dart';

class CustomeTag extends StatefulWidget {
  final String text;
  final String type;

  const CustomeTag({required this.text, required this.type, super.key});

  @override
  State<CustomeTag> createState() => _CustomeTag();
}

class _CustomeTag extends State<CustomeTag> {
  Color getBackground(String type) {
    switch (type.toLowerCase()) {
      case 'primary':
        return AppColors.primary;
      case 'success':
        return AppColors.btnSuccess;
      case 'warning':
        return AppColors.btnWarning;
      case 'error':
        return AppColors.btnError;
      default:
        return AppColors.grey;
    }
  }

  Color getColorTag(String type) {
    switch (type.toLowerCase()) {
      case 'success':
        return AppColors.white;
      case 'warning':
        return AppColors.white;
      case 'error':
        return AppColors.white;
      case 'primary':
        return AppColors.white;
      default:
        return AppColors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      decoration: BoxDecoration(
        color: getBackground(widget.type),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        widget.text,
        maxLines: 1,
        style: GlobalStyles.textBold12.copyWith(
          color: getColorTag(widget.type),
        ),
      ),
    );
  }
}
