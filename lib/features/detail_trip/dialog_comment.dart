import 'package:flutter/material.dart';
import 'package:my_app/core/constants/colors.dart';
import 'package:my_app/global_styles.dart';
import 'package:my_app/widgets/AppButton.dart';
import 'package:my_app/widgets/AppTextArea.dart';

class DialogComment extends StatelessWidget {
  final void Function(BuildContext) onSubmit;
  const DialogComment({super.key, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Material(
      color: Colors.transparent,
      child: Container(
        width: size.width,
        height: size.height * 0.5,
        padding: const EdgeInsets.fromLTRB(12, 30, 12, 40),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Chuyến đi của bạn thế nào?", style: GlobalStyles.mediumTitle),
            const SizedBox(height: 12),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/icons/rating.png',
                  width: 34,
                  height: 34,
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/icons/rating.png',
                  width: 34,
                  height: 34,
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/icons/rating.png',
                  width: 34,
                  height: 34,
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/icons/rating.png',
                  width: 34,
                  height: 34,
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/icons/rating.png',
                  width: 34,
                  height: 34,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            const SizedBox(height: 12),

            AppTextArea(
              backgroundColor: AppColors.grey,
              hint: 'Đánh giá chuyến đi',
              minLines: 8,
              maxLines: 15,
              borderRadius: 12,
              border: false,
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: AppButton(
                label: 'Gửi đánh giá',
                onPressed: () => onSubmit(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
