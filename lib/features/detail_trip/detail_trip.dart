import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/core/constants/colors.dart';
import 'package:my_app/core/constants/fonts.dart';
import 'package:my_app/global_styles.dart';
import 'package:my_app/models/customer.dart';
import 'package:my_app/widgets/AppButton.dart';
import '../../models/trip.dart';
import '../../widgets/car_info.dart';
import '../../models/province.dart';
import 'package:go_router/go_router.dart';

class DetailTripPage extends StatefulWidget {
  final String tripId;
  const DetailTripPage({super.key, required this.tripId});

  @override
  State<StatefulWidget> createState() => _DetailTripPage();
}

class _DetailTripPage extends State<DetailTripPage> {
  final trip = Trip(
    id: '1',
    driveImage: 'styles/images/background.jpg',
    owner: 'Nam Trang',
    startPoint: 'Ngọc đới, Quảng Phúc, Quảng Xương, Thanh Hóa',
    endPoint: 'CN1 Bắc Từ Liêm, Hà Nội',
    startTime: '10:30',
    price: '120000',
    startProvince: Province(id: 36, name: 'Thanh Hóa'),
    endProvince: Province(id: 29, name: 'Hà Nội'),
    vehicleType: 'Xe giường nằm',
  );

  final List<Customer> customers = [
    Customer(id: 1, phone: '098765432', avatar: 'assets/icons/user.png'),
    Customer(id: 1, phone: '098765432', avatar: 'assets/icons/user.png'),
    Customer(id: 1, phone: '098765432', avatar: 'assets/icons/user.png'),
    Customer(id: 1, phone: '098765432', avatar: 'assets/icons/user.png'),
    Customer(id: 1, phone: '098765432', avatar: 'assets/icons/user.png'),
    Customer(id: 1, phone: '098765432', avatar: 'assets/icons/user.png'),
    Customer(id: 1, phone: '098765432', avatar: 'assets/icons/user.png'),
    Customer(id: 1, phone: '098765432', avatar: 'assets/icons/user.png'),
    Customer(id: 1, phone: '098765432', avatar: 'assets/icons/user.png'),
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final displayCus = customers.take(4).toList();

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(),
      child: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Container(
              height: size.height * 0.5,
              decoration: const BoxDecoration(
                color: AppColors.primary, // màu xanh của mày
              ),
            ),

            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
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
                              'Thông tin chuyến',
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
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                child: ClipOval(
                                  child: Image.asset(
                                    'assets/icons/user_large.png',
                                    width: 80,
                                    height: 80,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                onTap: () => context.push('/drive-info/3'),
                              ),
                              SizedBox(width: 6),
                              Expanded(
                                child: SizedBox(
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Nguyễn Văn A',
                                            style: TextStyle(
                                              color: AppColors.white,
                                              fontWeight: AppText.bold,
                                              fontSize: AppText.font16,
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '4.5 / 5',
                                                style: GlobalStyles.regularText
                                                    .copyWith(
                                                      color: AppColors.white,
                                                    ),
                                              ),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Số chuyến hoàn thành',
                                            style: TextStyle(
                                              color: AppColors.white,
                                              fontWeight: AppText.bold,
                                              fontSize: AppText.font14,
                                            ),
                                          ),
                                          Text(
                                            '100',
                                            style: GlobalStyles.regularText
                                                .copyWith(
                                                  color: AppColors.white,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'SĐT: 098765432',
                                            style: TextStyle(
                                              color: AppColors.white,
                                              fontWeight: AppText.bold,
                                              fontSize: AppText.font14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: CarInfo(trip: trip, type: 'car'),
                      ),
                      Container(
                        height: size.height * 0.38,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/map.webp'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      Container(
                        width: size.width,
                        margin: EdgeInsetsDirectional.symmetric(horizontal: 12),
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.border),
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
                              'Các hành khách khác',
                              style: TextStyle(
                                color: AppColors.black,
                                fontWeight: AppText.bold,
                                fontSize: AppText.font16,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ...displayCus.map(
                                  (cus) => ClipOval(
                                    child: Image.asset(
                                      cus.avatar,
                                      width: 45,
                                      height: 45,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                if (customers.length > 4)
                                  GestureDetector(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) => CustomerDialog(
                                          customers: customers,
                                          onConfirm: () =>
                                              Navigator.pop(context),
                                          onCancel: () =>
                                              Navigator.pop(context),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      width: 38,
                                      height: 38,
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: AppColors.border,
                                      ),
                                      child: ClipOval(
                                        child: Image.asset(
                                          'assets/icons/dots_black.png',
                                          width: 30,
                                          height: 30,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Gía vé', style: GlobalStyles.textBold14),
                                Text(
                                  '150.000 đ',
                                  style: GlobalStyles.textBold14,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Chi phí phụ khác',
                                  style: GlobalStyles.textBold14.copyWith(
                                    color: AppColors.mediumBlack,
                                  ),
                                ),
                                Text(
                                  '0 đ',
                                  style: GlobalStyles.textBold14.copyWith(
                                    color: AppColors.mediumBlack,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            SizedBox(
                              width: double.infinity,
                              child: AppButton(
                                label: 'Đặt ngay',
                                onPressed: () =>
                                    context.push('/book-ticket', extra: trip),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomerDialog extends StatelessWidget {
  final List<Customer>? customers;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const CustomerDialog({
    Key? key,
    this.customers,
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
            maxWidth: size.width * 0.9,
            maxHeight: size.height * 0.8,
          ),
          child: Material(
            borderRadius: BorderRadius.circular(20),
            color: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Danh sách khách hàng",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),

                  Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...customers!.map(
                        (cus) => Row(
                          children: [
                            // Container(
                            //   padding: EdgeInsets.symmetric(vertical: 8),
                            //   // decoration: Box,
                            // ),
                            ClipOval(
                              child: Image.asset(
                                cus.avatar,
                                width: 45,
                                height: 45,
                                fit: BoxFit.cover,
                              ),
                            ),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cus.phone,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: onConfirm,
                        child: const Text("Hủy"),
                      ),
                      ElevatedButton(
                        onPressed: onCancel,
                        child: const Text("OK"),
                      ),
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
