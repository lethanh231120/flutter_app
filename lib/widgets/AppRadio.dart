import 'package:flutter/material.dart';
import 'package:my_app/core/constants/colors.dart';

class RadioItem extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;
  final String title;

  const RadioItem({
    Key? key,
    required this.isSelected,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(isSelected);
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey),
              color: isSelected ? AppColors.primary : AppColors.white,
            ),
          ),
          SizedBox(width: 8),
          Text(title),
        ],
      ),
    );
  }
}
