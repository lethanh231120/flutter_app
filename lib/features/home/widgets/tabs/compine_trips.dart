import 'package:flutter/material.dart';
import 'package:my_app/core/constants/colors.dart';
import 'package:my_app/global_styles.dart';
import 'package:my_app/models/province.dart';
import '../../../../widgets/trip_row.dart';
import '../../../../widgets/trip_column.dart';
import '../../../../models/trip.dart';

class CompineTripsTab extends StatefulWidget {
  const CompineTripsTab({super.key});

  @override
  State<CompineTripsTab> createState() => _CompineTripsTabState();
}

class _CompineTripsTabState extends State<CompineTripsTab> {
  final List<Trip> trips = [
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
    ),
  ];

  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    final displayTrips = isExpanded ? trips : trips.take(1).toList();
    return Scrollbar(
      thumbVisibility: true,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(14, 14, 14, 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...displayTrips.map(
                (trip) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: TripRowItem(trip: trip),
                ),
              ),
              if (trips.length > 1)
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            isExpanded ? 'Thu gọn' : 'Xem thêm',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            isExpanded
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            color: AppColors.primary,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              SizedBox(height: 10),
              Divider(color: AppColors.border, thickness: 1, height: 1),
              SizedBox(height: 10),
              Text(
                'Tuyến đường phổ biến',
                style: GlobalStyles.mediumTitle.copyWith(
                  color: AppColors.primary,
                ),
              ),
              SizedBox(height: 10),

              SizedBox(
                height: 185,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: trips.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: TripColumnItem(trip: trips[index]),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
