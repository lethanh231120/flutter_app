import 'package:flutter/material.dart';
import 'package:my_app/core/constants/colors.dart';
import 'package:my_app/global_styles.dart';
import 'package:my_app/models/province.dart';
import 'package:my_app/models/trip.dart';
import 'package:my_app/models/evaluate.dart';
import 'package:my_app/widgets/AppButton.dart';
import 'package:my_app/widgets/car_info.dart';
import 'package:go_router/go_router.dart';

class TripRoute extends StatefulWidget {
  const TripRoute({Key? key}) : super(key: key);

  @override
  State<TripRoute> createState() => _TripRouteState();
}

class _TripRouteState extends State<TripRoute> {
  final List<Trip> tripsCurrDay = [
    Trip(
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
      status: 1,
      seats: 30,
      seatsBooked: 29,
    ),
  ];

  final List<Trip> tripsComing = [
    Trip(
      id: '2',
      driveImage: 'styles/images/background.jpg',
      owner: 'Thành Lan',
      startPoint: 'Quảng Vọng, Quảng Xương, Thanh Hóa',
      endPoint: 'Số 17 Tôn Thất Thuyết, Mỹ Ddình Hà Nội',
      startTime: '10:30',
      price: '120000',
      startProvince: Province(id: 15, name: 'Hải Phòng'),
      endProvince: Province(id: 29, name: 'Hà Nội'),
      vehicleType: 'Xe ghép',
      status: 2,
      seats: 30,
      seatsBooked: 29,
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
      seats: 30,
      seatsBooked: 29,
    ),
  ];

  final List<Trip> tripsHistory = [
    Trip(
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
      status: 1,
      seats: 30,
      seatsBooked: 29,
    ),
    Trip(
      id: '2',
      driveImage: 'styles/images/background.jpg',
      owner: 'Thành Lan',
      startPoint: 'Quảng Vọng, Quảng Xương, Thanh Hóa',
      endPoint: 'Số 17 Tôn Thất Thuyết, Mỹ Ddình Hà Nội',
      startTime: '10:30',
      price: '120000',
      startProvince: Province(id: 15, name: 'Hải Phòng'),
      endProvince: Province(id: 29, name: 'Hà Nội'),
      vehicleType: 'Xe ghép',
      status: 2,
      seats: 30,
      seatsBooked: 29,
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
      seats: 30,
      seatsBooked: 29,
    ),
    Trip(
      id: '4',
      driveImage: 'styles/images/background.jpg',
      owner: 'Thành Lan',
      startPoint: 'Quảng Vọng, Quảng Xương, Thanh Hóa',
      endPoint: 'Số 17 Tôn Thất Thuyết, Mỹ đình Hà Nội',
      startTime: '10:30',
      price: '120000',
      startProvince: Province(id: 36, name: 'Thanh Hóa'),
      endProvince: Province(id: 29, name: 'Hà Nội'),
      vehicleType: 'Ghế ngồi',
      status: 0,
      seats: 30,
      seatsBooked: 29,
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
              color: AppColors.primary,
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
                      Spacer(),
                      Text(
                        'Chuyến đi của tôi',
                        style: GlobalStyles.mediumTitle.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: Scrollbar(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsetsGeometry.fromLTRB(12, 12, 12, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TripGroup(
                              widthContainer: size.width,
                              items: tripsCurrDay,
                            ),
                            SizedBox(height: 10),
                            TripGroup(
                              widthContainer: size.width,
                              items: tripsComing,
                            ),
                            SizedBox(height: 10),
                            TripGroup(
                              widthContainer: size.width,
                              items: tripsHistory,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  width: double.infinity,
                  child: AppButton(
                    height: 40,
                    label: 'Tổng tiền mặt phải thu: 1.234.567 đ',
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

class TripGroup extends StatelessWidget {
  final double widthContainer;
  final List<Trip> items;
  const TripGroup({
    super.key,
    required this.widthContainer,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      width: widthContainer,
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Hôm nay', style: GlobalStyles.textBold16),
          SizedBox(height: 6),
          ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(bottom: 8),
                child: CarInfo(
                  trip: items[index],
                  type: 'trip',
                  onAction: () => context.push('/trip/2'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
