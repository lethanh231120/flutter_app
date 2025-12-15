import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app/core/constants/colors.dart';
import 'package:my_app/core/constants/fonts.dart';
import 'package:my_app/global_styles.dart';
import 'package:my_app/models/chat.dart';
import 'package:my_app/widgets/AppButton.dart';
import 'package:my_app/widgets/AppTag.dart';

class NotificationItem extends StatefulWidget {
  final ChatOverview notiItem;
  const NotificationItem({super.key, required this.notiItem});

  @override
  State<NotificationItem> createState() => _NotificationItem();
}

class _NotificationItem extends State<NotificationItem> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => context.push(
        '/chat-detail',
        extra: {'ownerId': 2, 'customerId': widget.notiItem.userId},
      ),
      child: Container(
        width: size.width,
        padding: EdgeInsets.only(bottom: 6),
        margin: EdgeInsets.only(bottom: 6),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.border)),
          // color: AppColors.white,
        ),
        // alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: widget.notiItem.status == 1
                        ? AppColors.semiBlack
                        : AppColors.primary,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  'Tuyến mới',
                  style: GlobalStyles.textBold14.copyWith(
                    color: widget.notiItem.status == 1
                        ? AppColors.semiBlack
                        : AppColors.black,
                  ),
                  softWrap: true,
                ),
              ],
            ),

            Wrap(
              spacing: 6, // khoảng cách ngang giữa các phần tử
              // runSpacing: 2, // khoảng cách giữa các dòng
              children: [
                Text(
                  'Bạn đã được Lê Thành phân công tuyến',
                  style: TextStyle(
                    color: AppColors.semiBlack,
                    fontSize: AppText.font12,
                  ),
                ),
                Text(
                  'Hà Nội -> Hải Phòng',
                  style: GlobalStyles.textBold12.copyWith(
                    color: AppColors.primary,
                  ),
                ),
                Text(
                  'Giờ xuất phát: 12:30 Ngày 25/10/2025',
                  style: TextStyle(
                    color: AppColors.semiBlack,
                    fontSize: AppText.font12,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Thứ 2, 10 Thg 10 2025',
                  style: TextStyle(
                    color: AppColors.semiBlack,
                    fontSize: AppText.font12,
                  ),
                ),
                // CustomeTag(text: 'Xác nhận', type: 'primary'),
                AppButton(
                  label: 'Xem thêm',
                  type: ButtonType.underline,
                  size: 'small',
                  suffixIcon: Image.asset(
                    "assets/icons/arrow_right_black.png",
                    width: 18,
                    height: 18,
                  ),
                ),
              ],
            ),
          ],
        ),
        // Row(
        //   children: [
        //     SizedBox(
        //       child: Container(
        //         width: 60,
        //         height: 60,
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(10),
        //           image: DecorationImage(
        //             image: AssetImage(widget.notiItem.userAvatar),
        //             fit: BoxFit.cover,
        //           ),
        //         ),
        //       ),
        //     ),
        //     SizedBox(width: 8),
        //     Expanded(
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           Row(
        //             children: [
        //               Text(
        //                 widget.notiItem.userPhone!,
        //                 style: GlobalStyles.textBold14.copyWith(
        //                   color: widget.notiItem.status == 1
        //                       ? AppColors.semiBlack
        //                       : AppColors.black,
        //                 ),
        //                 softWrap: true,
        //               ),
        //               SizedBox(width: 8),

        //               Spacer(),
        //               Text(
        //                 widget.notiItem.time,
        //                 style: GlobalStyles.textBold12.copyWith(
        //                   color: widget.notiItem.status == 1
        //                       ? AppColors.semiBlack
        //                       : AppColors.black,
        //                 ),
        //                 softWrap: true,
        //               ),
        //             ],
        //           ),

        //           Text(
        //             widget.notiItem.message,
        //             style: GlobalStyles.textBold12.copyWith(
        //               color: AppColors.semiBlack,
        //             ),
        //             softWrap: true,
        //           ),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
