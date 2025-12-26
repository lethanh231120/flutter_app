import 'package:flutter/material.dart';
import 'package:my_app/core/constants/colors.dart';
import 'package:my_app/features/register-route/dialog_register_route.dart';
import 'package:my_app/global_styles.dart';
import 'package:my_app/helper/animation.dart';
import 'package:my_app/models/province.dart';
import 'package:my_app/models/trip.dart';
import 'package:my_app/widgets/AppButton.dart';
import 'package:my_app/widgets/AppInput.dart';
import 'package:my_app/widgets/car_info.dart';
import 'package:go_router/go_router.dart';

class RegisterRoute extends StatefulWidget {
  const RegisterRoute({Key? key}) : super(key: key);

  @override
  State<RegisterRoute> createState() => _RegisterRouteState();
}

class _RegisterRouteState extends State<RegisterRoute> {
  final List<Trip> tripsComing = [
    Trip(
      id: '2',
      driveImage: 'styles/images/background.jpg',
      owner: 'Thành Lan',
      startPoint: 'Quảng Vọng, Quảng Xương, Thanh Hóa',
      endPoint: 'Số 17 Tôn Thất Thuyết, Mỹ Đình Hà Nội',
      startTime: '10:30 ngày 25/12/2025',
      price: '120000',
      startProvince: Province(id: 15, name: 'Hải Phòng'),
      endProvince: Province(id: 29, name: 'Hà Nội'),
      vehicleType: 'Xe ghép',
      status: 4,
    ),
    Trip(
      id: '3',
      driveImage: 'styles/images/background.jpg',
      owner: 'Nam Trang',
      startPoint: 'Ngọc đới, Quảng Phúc, Quảng Xương, Thanh Hóa',
      endPoint: 'CN1 Bắc Từ Liêm, Hà Nội',
      startTime: '10:30',
      price: '120000',
      startProvince: Province(id: 15, name: 'Hải Phòng'),
      endProvince: Province(id: 29, name: 'Hà Nội'),
      vehicleType: 'Limousine',
      status: 3,
    ),
    Trip(
      id: '2',
      driveImage: 'styles/images/background.jpg',
      owner: 'Thành Lan',
      startPoint: 'Quảng Vọng, Quảng Xương, Thanh Hóa',
      endPoint: 'Số 17 Tôn Thất Thuyết, Mỹ Đình Hà Nội',
      startTime: '10:30 ngày 25/12/2025',
      price: '120000',
      startProvince: Province(id: 15, name: 'Hải Phòng'),
      endProvince: Province(id: 29, name: 'Hà Nội'),
      vehicleType: 'Xe ghép',
      status: 4,
    ),
    Trip(
      id: '3',
      driveImage: 'styles/images/background.jpg',
      owner: 'Nam Trang',
      startPoint: 'Ngọc đới, Quảng Phúc, Quảng Xương, Thanh Hóa',
      endPoint: 'CN1 Bắc Từ Liêm, Hà Nội',
      startTime: '10:30',
      price: '120000',
      startProvince: Province(id: 15, name: 'Hải Phòng'),
      endProvince: Province(id: 29, name: 'Hà Nội'),
      vehicleType: 'Limousine',
      status: 3,
    ),
    Trip(
      id: '2',
      driveImage: 'styles/images/background.jpg',
      owner: 'Thành Lan',
      startPoint: 'Quảng Vọng, Quảng Xương, Thanh Hóa',
      endPoint: 'Số 17 Tôn Thất Thuyết, Mỹ Đình Hà Nội',
      startTime: '10:30 ngày 25/12/2025',
      price: '120000',
      startProvince: Province(id: 15, name: 'Hải Phòng'),
      endProvince: Province(id: 29, name: 'Hà Nội'),
      vehicleType: 'Xe ghép',
      status: 4,
    ),
    Trip(
      id: '3',
      driveImage: 'styles/images/background.jpg',
      owner: 'Nam Trang',
      startPoint: 'Ngọc đới, Quảng Phúc, Quảng Xương, Thanh Hóa',
      endPoint: 'CN1 Bắc Từ Liêm, Hà Nội',
      startTime: '10:30',
      price: '120000',
      startProvince: Province(id: 15, name: 'Hải Phòng'),
      endProvince: Province(id: 29, name: 'Hà Nội'),
      vehicleType: 'Limousine',
      status: 3,
    ),
    Trip(
      id: '2',
      driveImage: 'styles/images/background.jpg',
      owner: 'Thành Lan',
      startPoint: 'Quảng Vọng, Quảng Xương, Thanh Hóa',
      endPoint: 'Số 17 Tôn Thất Thuyết, Mỹ Đình Hà Nội',
      startTime: '10:30 ngày 25/12/2025',
      price: '120000',
      startProvince: Province(id: 15, name: 'Hải Phòng'),
      endProvince: Province(id: 29, name: 'Hà Nội'),
      vehicleType: 'Xe ghép',
      status: 4,
    ),
    Trip(
      id: '3',
      driveImage: 'styles/images/background.jpg',
      owner: 'Nam Trang',
      startPoint: 'Ngọc đới, Quảng Phúc, Quảng Xương, Thanh Hóa',
      endPoint: 'CN1 Bắc Từ Liêm, Hà Nội',
      startTime: '10:30',
      price: '120000',
      startProvince: Province(id: 15, name: 'Hải Phòng'),
      endProvince: Province(id: 29, name: 'Hà Nội'),
      vehicleType: 'Limousine',
      status: 3,
    ),
    Trip(
      id: '2',
      driveImage: 'styles/images/background.jpg',
      owner: 'Thành Lan',
      startPoint: 'Quảng Vọng, Quảng Xương, Thanh Hóa',
      endPoint: 'Số 17 Tôn Thất Thuyết, Mỹ Đình Hà Nội',
      startTime: '10:30 ngày 25/12/2025',
      price: '120000',
      startProvince: Province(id: 15, name: 'Hải Phòng'),
      endProvince: Province(id: 29, name: 'Hà Nội'),
      vehicleType: 'Xe ghép',
      status: 4,
    ),
    Trip(
      id: '3',
      driveImage: 'styles/images/background.jpg',
      owner: 'Nam Trang',
      startPoint: 'Ngọc đới, Quảng Phúc, Quảng Xương, Thanh Hóa',
      endPoint: 'CN1 Bắc Từ Liêm, Hà Nội',
      startTime: '10:30',
      price: '120000',
      startProvince: Province(id: 15, name: 'Hải Phòng'),
      endProvince: Province(id: 29, name: 'Hà Nội'),
      vehicleType: 'Limousine',
      status: 3,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      child: Stack(
        children: [
          SafeArea(
            child: Column(
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
                      Spacer(),
                      Text(
                        'Đăng ký chuyến',
                        style: GlobalStyles.mediumTitle.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(12),
                    color: AppColors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppInput(
                          placeholder: 'Tên đầy đủ của doanh nghiệp',
                          height: 45,
                          borderRadius: 8,
                        ),

                        SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: AppInput(
                                placeholder: 'Số điện thoại',
                                height: 45,
                                borderRadius: 8,
                              ),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: AppInput(
                                placeholder: 'Mã số thuế',
                                height: 45,
                                borderRadius: 8,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),

                        AppInput(
                          placeholder: 'Tên đầy đủ của doanh nghiệp',
                          height: 45,
                          borderRadius: 8,
                        ),

                        SizedBox(height: 8),
                        AppInput(
                          placeholder: 'Tên đầy đủ của doanh nghiệp',
                          height: 45,
                          borderRadius: 8,
                        ),

                        SizedBox(height: 8),
                        Align(
                          alignment: Alignment.centerRight,
                          child: AppButton(
                            label: 'Đăng ký',
                            height: 35,
                            borderRadius: 10,
                          ),
                        ),

                        SizedBox(height: 6),
                        Divider(thickness: 1, color: AppColors.border),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Chuyến hiện có',
                              style: GlobalStyles.textBold16,
                              softWrap: true,
                            ),
                            AppButton(
                              label: 'Thêm chuyến',
                              height: 35,
                              borderRadius: 12,
                              prefixIcon: Image.asset(
                                'assets/icons/plus_white.png',
                                width: 20,
                                height: 20,
                                fit: BoxFit.cover,
                              ),
                              onPressed: () => {
                                showBottomUpDialog(
                                  context,

                                  DialogRegisterRoute(
                                    onSubmit: (dialogContext) {
                                      Navigator.pop(dialogContext);
                                    },
                                  ),
                                ),
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 8),

                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: tripsComing.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: EdgeInsets.only(bottom: 8),
                                      child: CarInfo(
                                        trip: tripsComing[index],
                                        type: 'trip',
                                        size: 70,
                                        onAction: () => context.push('/trip/2'),
                                      ),
                                    );
                                  },
                                ),
                              ],
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
