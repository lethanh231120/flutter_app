import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app/global_styles.dart';

class ItemProfileInfo extends StatelessWidget {
  final String icon;
  final String text;
  final String arrow;
  final double? size;
  final String? urlRedirect;

  const ItemProfileInfo({
    required this.icon,
    required this.text,
    required this.arrow,
    this.size = 22,
    this.urlRedirect,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (urlRedirect != null) {
          context.push(urlRedirect!);
        }
      },
      child: Row(
        children: [
          Image.asset(icon, width: size, height: size, fit: BoxFit.cover),
          SizedBox(width: 8),
          Text(text, style: GlobalStyles.textBold14),
          Spacer(),
          ClipOval(
            child: Image.asset(arrow, width: 22, height: 22, fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }
}
