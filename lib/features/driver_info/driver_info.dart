import 'package:flutter/material.dart';
import 'package:my_app/core/constants/colors.dart';
import 'package:my_app/global_styles.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app/models/trip.dart';
import 'package:my_app/models/evaluate.dart';
import 'package:my_app/widgets/trip_row.dart';
import 'package:my_app/widgets/evaluate.dart';

class DriveInfoPage extends StatefulWidget {
  final String driveId;
  const DriveInfoPage({Key? key, required this.driveId}) : super(key: key);

  @override
  State<DriveInfoPage> createState() => _DriveInfoPageState();
}

class _DriveInfoPageState extends State<DriveInfoPage> {
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
    final size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Container(
            height: size.height * 0.38,
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
                        'Thông tin tài xế',
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
                SizedBox(height: 60),
                SizedBox(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: size.width - 28,
                        height: size.height * 0.28,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              color: AppColors.mediumBlack,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: size.width - 28,
                              height: size.height * 0.16,
                              decoration: BoxDecoration(
                                color: AppColors.mediumBlue,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(height: 50),
                                  Text(
                                    "Nguyễn Văn A",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "098765432",
                                    style: GlobalStyles.mediumTitle,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(
                                        'assets/icons/rating.png',
                                        width: 18,
                                        height: 18,
                                        fit: BoxFit.cover,
                                      ),
                                      Image.asset(
                                        'assets/icons/rating.png',
                                        width: 18,
                                        height: 18,
                                        fit: BoxFit.cover,
                                      ),
                                      Image.asset(
                                        'assets/icons/rating.png',
                                        width: 18,
                                        height: 18,
                                        fit: BoxFit.cover,
                                      ),
                                      Image.asset(
                                        'assets/icons/rating.png',
                                        width: 18,
                                        height: 18,
                                        fit: BoxFit.cover,
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
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 14),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                            right: BorderSide(
                                              color: AppColors.border,
                                            ),
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              '5.000',
                                              style: GlobalStyles.mediumTitle,
                                            ),
                                            Text(
                                              'Chuyến đi',
                                              style: GlobalStyles.regularText,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                            right: BorderSide(
                                              color: AppColors.border,
                                            ),
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              '2.000',
                                              style: GlobalStyles.mediumTitle,
                                            ),
                                            Text(
                                              'KM',
                                              style: GlobalStyles.regularText,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              '20.000',
                                              style: GlobalStyles.mediumTitle,
                                            ),
                                            Text(
                                              'Lượt khách',
                                              style: GlobalStyles.regularText,
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
                      Positioned(
                        top: -60,
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
                SizedBox(height: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsGeometry.symmetric(
                          vertical: 4,
                          horizontal: 12,
                        ),
                        child: Text(
                          'Thông tin xe',
                          style: GlobalStyles.textBold16,
                        ),
                      ),
                      Expanded(
                        child: Scrollbar(
                          thumbVisibility: true,
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(14, 0, 14, 0),
                              child: Column(
                                children: [
                                  ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: cars.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                          bottom: 8,
                                        ),
                                        child: TripRowItem(
                                          trip: cars[index],
                                          hasTab: false,
                                        ),
                                      );
                                    },
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 8),
                                    padding: EdgeInsets.all(12),
                                    width: size.width,
                                    decoration: BoxDecoration(
                                      color: AppColors.border,
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Đánh giá ',
                                              style: GlobalStyles.textBold16,
                                            ),
                                            Text(
                                              '( 5',
                                              style: GlobalStyles.regularText,
                                            ),
                                            Image.asset(
                                              'assets/icons/rating.png',
                                              width: 16,
                                              height: 16,
                                              fit: BoxFit.cover,
                                            ),
                                            Text(
                                              ' / 1000 đánh giá )',
                                              style: GlobalStyles.regularText,
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 6),
                                        ListView.builder(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          physics:
                                              const BouncingScrollPhysics(),
                                          itemCount: evaluates.length,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                bottom: 8,
                                              ),
                                              child: Evaluate(
                                                evaluate: evaluates[index],
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
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
        ],
      ),
    );
  }
}
