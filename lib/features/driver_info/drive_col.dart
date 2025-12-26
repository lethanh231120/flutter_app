import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app/core/constants/colors.dart';
import 'package:my_app/core/constants/fonts.dart';
import 'package:my_app/global_styles.dart';

class DriverColumn extends StatefulWidget {
  const DriverColumn({Key? key});

  @override
  State<DriverColumn> createState() => _DriverColumn();
}

class _DriverColumn extends State<DriverColumn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      padding: const EdgeInsets.fromLTRB(0, 0, 6, 0),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              child: ClipOval(
                child: Image.asset(
                  'assets/icons/user_large.png',
                  width: 75,
                  height: 75,
                  fit: BoxFit.cover,
                ),
              ),
              onTap: () => context.push('/drive-info/3'),
            ),
            Expanded(
              child: SizedBox(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Nguyễn Văn A', style: GlobalStyles.textBold16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('4.5', style: GlobalStyles.regularText),
                            Image.asset(
                              'assets/icons/rating.png',
                              width: 18,
                              height: 18,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Số chuyến hoàn thành',
                          style: GlobalStyles.regularText,
                        ),
                        Text('100', style: GlobalStyles.regularText),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('SĐT: 098765432', style: GlobalStyles.regularText),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
