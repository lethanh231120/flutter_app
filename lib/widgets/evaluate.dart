import 'package:flutter/material.dart';
import 'package:my_app/core/constants/colors.dart';
import '../models/evaluate.dart';
import 'package:my_app/global_styles.dart';

class Evaluate extends StatefulWidget {
  final EvaluateModel evaluate;
  const Evaluate({super.key, required this.evaluate});

  @override
  State<Evaluate> createState() => _Evaluate();
}

class _Evaluate extends State<Evaluate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: AppColors.white,
      ),
      alignment: Alignment.centerLeft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipOval(
            child: Image.asset(
              widget.evaluate.customerAvatar,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 8),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('098765432', style: GlobalStyles.textBold16),
                  SizedBox(width: 14),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/icons/rating.png',
                        width: 14,
                        height: 14,
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/icons/rating.png',
                        width: 14,
                        height: 14,
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/icons/rating.png',
                        width: 14,
                        height: 14,
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/icons/rating.png',
                        width: 14,
                        height: 14,
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/icons/rating.png',
                        width: 14,
                        height: 14,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                widget.evaluate.date,
                style: GlobalStyles.textBold14.copyWith(
                  color: AppColors.semiBlack,
                ),
              ),
              Text(widget.evaluate.comment, style: GlobalStyles.textBold14),
            ],
          ),
        ],
      ),
    );
  }
}
