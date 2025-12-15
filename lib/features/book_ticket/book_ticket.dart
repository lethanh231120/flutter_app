import 'package:flutter/material.dart';
import 'package:my_app/core/constants/colors.dart';
import 'package:my_app/core/constants/fonts.dart';
import 'package:my_app/global_styles.dart';
import 'package:my_app/models/trip.dart';
import 'package:my_app/widgets/AppButton.dart';
import 'package:my_app/widgets/AppRadioGroup.dart';
import 'package:my_app/widgets/AppTextArea.dart';
// import 'package:my_app/widgets/car_info.dart';
import 'package:go_router/go_router.dart';

class BookTicket extends StatefulWidget {
  final Trip trip;
  const BookTicket({Key? key, required this.trip}) : super(key: key);

  @override
  State<BookTicket> createState() => _BookTicketState();
}

class _BookTicketState extends State<BookTicket> {
  @override
  Widget build(BuildContext context) {
    final controller = CustomRadioController<String>();
    controller.value = 'money';
    final TextEditingController noteController = TextEditingController();
    final size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Container(
            height: size.height * 0.55,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
              color: AppColors.primary, // màu xanh của mày
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Image.asset(
                          'assets/icons/arrow_left_white.png',
                          width: 24,
                          height: 24,
                        ),
                      ),
                      Text(
                        'Xác nhận đặt vé',
                        style: GlobalStyles.mediumTitle.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                      GestureDetector(
                        child: Image.asset(
                          'assets/icons/chat_white.png',
                          width: 24,
                          height: 24,
                        ),
                        onTap: () => context.go(
                          '/chat-detail',
                          extra: {'ownerId': 1, 'customerId': 2},
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(14),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.semiBlack,
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Điểm đón: Số 17 Tôn Thất Thuyến, Mỹ Đình, Nam Từ Liêm, Hà Nội',
                          style: GlobalStyles.regularText,
                          softWrap: true,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Điểm trả: Số 17 Tôn Thất Thuyến, Mỹ Đình, Nam Từ Liêm, Hà Nội',
                          style: GlobalStyles.regularText,
                          softWrap: true,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Thời gian xuất phát: 14:00 25/11/2025',
                          style: GlobalStyles.regularText,
                          softWrap: true,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Loại xe: Toyota Vios',
                          style: GlobalStyles.regularText,
                          softWrap: true,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'SĐT Tài xế: 098765432',
                          style: GlobalStyles.regularText,
                          softWrap: true,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Tổng tiền thanh toán: 150.000 đ',
                          style: GlobalStyles.regularText,
                          softWrap: true,
                        ),
                        SizedBox(height: 10),
                        Divider(thickness: 2, color: AppColors.border),
                        SizedBox(height: 10),
                        Text(
                          'Phương thức thanh toán',
                          style: TextStyle(
                            color: AppColors.black,
                            fontWeight: AppText.bold,
                            fontSize: AppText.font16,
                          ),
                        ),
                        SizedBox(height: 10),
                        CustomRadioGroup<String>(
                          controller: controller,
                          items: [
                            CustomRadioItem(
                              value: 'wallet',
                              label: 'Ví điện tử',
                            ),
                            CustomRadioItem(
                              value: 'bank',
                              label: 'Tài khoản ngân hàng',
                            ),
                            CustomRadioItem(value: 'money', label: 'Tiền mặt'),
                          ],
                        ),
                        SizedBox(height: 10),
                        AppTextArea(
                          controller: noteController,
                          hint: 'Nhập ghi chú của bạn',
                          minLines: 5,
                          maxLines: 10,
                          borderRadius: 12,
                          borderColor: AppColors.border,
                          borderWidth: 2,
                        ),
                        Spacer(),
                        SizedBox(
                          width: double.infinity,
                          child: AppButton(
                            label: 'Xác nhận & Thanh toán',
                            onPressed: () => showDialog(
                              context: context,
                              builder: (context) => BookTicketSuccessDialog(
                                onConfirm: () => Navigator.pop(context),
                                onCancel: () => Navigator.pop(context),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BookTicketSuccessDialog extends StatelessWidget {
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const BookTicketSuccessDialog({
    Key? key,
    required this.onConfirm,
    required this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: UnconstrainedBox(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: size.width * 0.93,
            // maxHeight: size.height * 0.6,
          ),
          child: Material(
            borderRadius: BorderRadius.circular(20),
            color: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipOval(
                    child: Image.asset(
                      'assets/icons/checked_primary.png',
                      width: 85,
                      height: 85,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    "Đặt vé thành công !",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: AppText.semiBold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Biển số xe: 30A - 23456',
                        style: GlobalStyles.regularText,
                        softWrap: true,
                      ),
                      Text(
                        'SĐT: 098765432',
                        style: GlobalStyles.regularText,
                        softWrap: true,
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Loại xe: Toyota Vios',
                        style: GlobalStyles.regularText,
                        softWrap: true,
                      ),
                      Text(
                        'Tài xế: Nguyễn Thanh Huyền',
                        style: GlobalStyles.regularText,
                        softWrap: true,
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Thời gian xuất phát: 12:00 08/12/2025',
                        style: GlobalStyles.regularText,
                        softWrap: true,
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Điểm đón: Số 17 Tôn Thất Thuyết, Mỹ Đình, Nam Từ Liêm, Hà Nội',
                    style: GlobalStyles.regularText,
                    softWrap: true,
                  ),

                  // Space(),
                  SizedBox(height: 40),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: AppButton(
                          label: 'Về trang chủ',
                          onPressed: () => {
                            context.go('/home'),
                            Navigator.pop(context),
                          },
                        ),
                      ),
                      // SizedBox(height: 8),
                      // SizedBox(
                      //   width: double.infinity,
                      //   child: AppButton(
                      //     label: 'Xem chi tiết chuyến đi',
                      //     onPressed: () => {
                      //       context.go('/trip/123'),
                      //       Navigator.pop(context),
                      //     },
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
