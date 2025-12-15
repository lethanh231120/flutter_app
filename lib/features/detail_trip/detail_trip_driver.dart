import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/core/constants/colors.dart';
import 'package:my_app/core/constants/fonts.dart';
import 'package:my_app/global_styles.dart';
import 'package:my_app/models/customer.dart';
import 'package:my_app/widgets/AppButton.dart';
import 'package:my_app/widgets/AppRadio.dart';
import 'package:my_app/widgets/AppRadioGroup.dart';
import '../../models/trip.dart';
import '../../widgets/car_info.dart';
import '../../models/province.dart';
import 'package:go_router/go_router.dart';

class DetailTripDrivePage extends StatefulWidget {
  final String tripId;
  const DetailTripDrivePage({super.key, required this.tripId});

  @override
  State<StatefulWidget> createState() => _DetailTripDrivePage();
}

class _DetailTripDrivePage extends State<DetailTripDrivePage> {
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
    bool collectAll = false; // ✅ OK

    final size = MediaQuery.of(context).size;
    final displayCus = customers.take(4).toList();

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(),
      child: Container(
        color: Colors.white,
        child: Stack(
          children: [
            // Container(
            //   height: size.height * 0.5,
            //   decoration: const BoxDecoration(
            //     color: AppColors.primary, // màu xanh của mày
            //   ),
            // ),
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
                            'assets/icons/arrow_left_black.png',
                            width: 24,
                            height: 24,
                          ),
                        ),
                        Spacer(),
                        Text(
                          'Thông báo',
                          style: GlobalStyles.mediumTitle.copyWith(
                            color: AppColors.black,
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                  SizedBox(height: 6),
                  Divider(thickness: 1, color: AppColors.border),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: CarInfo(trip: trip, type: 'car'),
                  ),
                  // SizedBox(height: 6),
                  // Divider(thickness: 1, color: AppColors.border),
                  SizedBox(height: 6),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Khách hàng", style: GlobalStyles.textBold16),
                            SizedBox(width: 6),
                            ClipOval(
                              child: Image.asset(
                                'assets/icons/plus_circle.png',
                                width: 22,
                                height: 22,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Spacer(),
                            RadioItem(
                              title: 'Collect All',
                              isSelected: collectAll,
                              onTap: () {
                                setState(() {
                                  collectAll = !collectAll; // toggle true/false
                                });
                              },
                            ),
                          ],
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
                                            .copyWith(color: AppColors.white),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
