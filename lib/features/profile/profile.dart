import 'package:flutter/material.dart';
import 'package:my_app/core/constants/colors.dart';
import 'package:my_app/global_styles.dart';
import 'package:my_app/models/trip.dart';
import 'package:my_app/models/evaluate.dart';
import 'package:my_app/widgets/AppButton.dart';
import 'package:my_app/widgets/AppSelect.dart';
import 'package:my_app/widgets/evaluate.dart';
import 'profile_item.dart';

class JobPosition {
  final String id;
  final String name;
  JobPosition(this.id, this.name);
}

List<JobPosition> jobPositions = [
  JobPosition("1", "Chủ xe"),
  JobPosition("2", "Tài xế"),
  JobPosition("3", "Người dùng"),
];

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isSwitched = false; // state
  final List<Trip> cars = [
    Trip(
      id: '1',
      driveImage: 'styles/images/background.jpg',
      plateNumber: '30A - 23456',
      vehicleType: 'Toyota Vios',
      seats: 30,
    ),
  ];
  final List<EvaluateModel> evaluates = [
    EvaluateModel(
      id: 1,
      customerId: 123,
      customerAvatar: 'assets/icons/user_large.png',
      customerPhone: '0987654321',
      rating: 5,
      comment: 'Tài xế rất thân thiện',
      date: '15/11/2025',
    ),
    EvaluateModel(
      id: 2,
      customerId: 123,
      customerAvatar: 'assets/icons/user_large.png',
      customerPhone: '0987654321',
      rating: 5,
      comment: 'Tài xế rất thân thiện',
      date: '15/11/2025',
    ),
    EvaluateModel(
      id: 3,
      customerId: 123,
      customerAvatar: 'assets/icons/user_large.png',
      customerPhone: '0987654321',
      rating: 5,
      comment: 'Tài xế rất thân thiện',
      date: '15/11/2025',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      child: SafeArea(
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
                    'Thông tin tài khoản',
                    style: GlobalStyles.mediumTitle.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            SizedBox(height: 70),
            Expanded(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                      color: AppColors.white,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(height: 50),
                        Text(
                          "Nguyễn Văn A",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("098765432", style: GlobalStyles.textBold16),
                        SizedBox(height: 6),
                        Divider(thickness: 2, color: AppColors.border),
                        SizedBox(height: 6),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hồ sơ của tôi",
                              style: GlobalStyles.mediumTitle,
                            ),
                            SizedBox(height: 8),
                            ItemProfileInfo(
                              icon: 'assets/icons/user_primary.png',
                              text: 'Chỉnh sửa thông tin hồ sơ',
                              arrow: 'assets/icons/arrow_right.png',
                            ),
                            SizedBox(height: 8),
                            ItemProfileInfo(
                              icon: 'assets/icons/rating_square.png',
                              text: 'Giới thiệu bạn bè',
                              arrow: 'assets/icons/arrow_right.png',
                              size: 25,
                            ),

                            SizedBox(height: 8),
                            Divider(thickness: 2, color: AppColors.border),
                            SizedBox(height: 8),
                            Text("Ví của tôi", style: GlobalStyles.mediumTitle),
                            SizedBox(height: 8),
                            ItemProfileInfo(
                              icon: 'assets/icons/statistic.png',
                              text: 'Thống kê chi tiêu',
                              arrow: 'assets/icons/arrow_right.png',
                              size: 18,
                            ),
                            SizedBox(height: 8),
                            ItemProfileInfo(
                              icon: 'assets/icons/payment.png',
                              text: 'Thông tin thanh toán',
                              arrow: 'assets/icons/arrow_right.png',
                              size: 20,
                            ),

                            SizedBox(height: 8),
                            Divider(thickness: 2, color: AppColors.border),
                            SizedBox(height: 8),
                            ItemProfileInfo(
                              icon: 'assets/icons/car_primary.png',
                              text: 'Đăng ký chuyến xe',
                              arrow: 'assets/icons/arrow_right.png',
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Gửi thông báo',
                                  style: GlobalStyles.textBold14,
                                ),
                                Switch(
                                  value: isSwitched,
                                  onChanged: (value) {
                                    setState(() => isSwitched = value);
                                  },
                                  activeColor: AppColors.primary,
                                  inactiveThumbColor: AppColors.grey,
                                  inactiveTrackColor: Colors.black12,
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Vai trò', style: GlobalStyles.textBold14),
                                AppSelect(
                                  placeholder: "Vai trò",
                                  backgroundColor: AppColors.white,
                                  height: 30,
                                  width: 145,
                                  border: true,
                                  value: '1',
                                  items: jobPositions
                                      .map(
                                        (c) => SelectItem(
                                          value: c.id,
                                          label: c.name,
                                        ),
                                      )
                                      .toList(),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Spacer(),
                        SizedBox(
                          width: double.infinity,
                          child: AppButton(
                            label: 'Đăng xuất',
                            prefixIcon: Image.asset(
                              "assets/icons/logout.png",
                              width: 20,
                              height: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: -70,
                    left: 0,
                    right: 0,
                    child: Align(
                      child: ClipOval(
                        child: Image.asset(
                          "assets/icons/user_large.png",
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
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
