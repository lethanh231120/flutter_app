import 'package:flutter/material.dart';
import 'package:my_app/core/constants/colors.dart';
import 'package:my_app/core/constants/fonts.dart';
import 'package:my_app/global_styles.dart';

class RadioItem extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;
  final String title;
  final bool checkboxLeading;
  final bool isBold;

  const RadioItem({
    Key? key,
    required this.isSelected,
    required this.onTap,
    required this.title,
    this.checkboxLeading = false,
    this.isBold = false,
  }) : super(key: key);

  Widget _buildRadio() {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? AppColors.primary : AppColors.grey,
          width: 2,
        ),
      ),
      child: isSelected
          ? Center(
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary,
                ),
              ),
            )
          : null,
    );
  }

  Widget _buildText() {
    return Text(
      title,
      style: GlobalStyles.regularText.copyWith(fontWeight: AppText.semiBold),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: checkboxLeading
            ? [_buildRadio(), SizedBox(width: 8), _buildText()]
            : [_buildText(), SizedBox(width: 8), _buildRadio()],
      ),
    );
  }
}
