import 'package:flutter/material.dart';
import 'package:my_app/core/constants/colors.dart';
import 'package:my_app/core/constants/fonts.dart';
import 'package:my_app/global_styles.dart';
import 'package:my_app/main.dart';
import 'package:my_app/models/customer.dart';
import 'package:my_app/widgets/AppRadio.dart';
import 'package:my_app/widgets/AppTag.dart';

class CustomerItem extends StatelessWidget {
  final Customer data;
  final bool isSelected;
  final VoidCallback onToggle;

  const CustomerItem({
    Key? key,
    required this.data,
    required this.isSelected,
    required this.onToggle,
  }) : super(key: key);

  // Future<void> updateStatusTicket() async {
  //   logger.i('update status ticket');
  //   setState(() => isSelected = !isSelected);
  // }

  @override
  Widget build(BuildContext) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipOval(
          child: Image.asset(
            data.avatar,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        // SizedBox(width: 4),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          data.phone,
                          style: GlobalStyles.textBold14,
                          softWrap: true,
                        ),
                        SizedBox(width: 4),
                        Container(
                          width: 14,
                          height: 14,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: data.active == true
                                ? AppColors.btnSuccess
                                : AppColors.btnError,
                          ),
                        ),
                      ],
                    ),
                  ),

                  if (data.ticketStatus == '1')
                    CustomeTag(text: 'Đã thanh toán', type: 'success'),
                  if (data.ticketStatus == '0')
                    RadioItem(
                      isSelected: isSelected,
                      onTap: onToggle,
                      title: 'Thu tiền',
                    ),
                ],
              ),
              Text(
                data.routeCusCmt!,
                style: TextStyle(
                  color: AppColors.semiBlack,
                  fontSize: AppText.font12,
                ),
                softWrap: true,
              ),
              if (data.ticketStatus == '0')
                Row(
                  children: [
                    Text(
                      'Thu tiền mặt: ',
                      style: TextStyle(
                        color: AppColors.semiBlack,
                        fontSize: AppText.font12,
                      ),
                      softWrap: true,
                    ),
                    Text(
                      '${data.priceRoute!} đ',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: AppText.font12,
                        fontWeight: AppText.semiBold,
                      ),
                      softWrap: true,
                    ),
                  ],
                ),
            ],
          ),
        ),
      ],
    );
  }
}
