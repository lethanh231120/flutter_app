import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/core/constants/colors.dart';
import 'package:my_app/features/detail_trip/customer_item.dart';
import 'package:my_app/features/detail_trip/dialog_add_customer.dart';
import 'package:my_app/features/driver_info/drive_col.dart';
import 'package:my_app/features/home/widgets/dialog_add_driver.dart';
import 'package:my_app/features/home/widgets/dialog_add_route.dart';
import 'package:my_app/features/home/widgets/dialog_add_vehicle.dart';
import 'package:my_app/global_styles.dart';
import 'package:my_app/helper/animation.dart';
import 'package:my_app/main.dart';
import 'package:my_app/models/customer.dart';
import 'package:my_app/widgets/AppButton.dart';
import 'package:my_app/widgets/AppRadio.dart';
import 'package:my_app/widgets/AppUploadImage.dart';
import '../../models/trip.dart';
import '../../widgets/car_info.dart';
import '../../models/province.dart';
import 'package:go_router/go_router.dart';

class HomePageDrive extends StatefulWidget {
  const HomePageDrive({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageDrive();
}

class _HomePageDrive extends State<HomePageDrive> {
  Map<int, bool> selectedMap = {};
  bool collectAll = false;
  final trip = Trip(
    id: '1',
    driveImage: 'styles/images/background.jpg',
    driveName: 'Toyota Vios',
    seats: 29,
    plateNumber: '30A-12345',
    vehicleType: 'Xe giường nằm',
  );

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
  ];

  final List<Customer> customers = [
    Customer(
      id: 1,
      phone: '098765432',
      avatar: 'assets/icons/user.png',
      active: true,
      ticketStatus: '1',
      routeCusCmt:
          'Nhà xe có dịch vụ đưa đón tận nới không ạ.Nhà xe có dịch vụ đưa đón tận nới không ạNhà xe có dịch vụ đưa đón tận nới không ạNhà xe có dịch vụ đưa đón tận nới không ạNhà xe có dịch vụ đưa đón tận nới không ạNhà xe có dịch vụ đưa đón tận nới không ạNhà xe có dịch vụ đưa đón tận nới không ạNhà xe có dịch vụ đưa đón tận nới không ạNhà xe có dịch vụ đưa đón tận nới không ạNhà xe có dịch vụ đưa đón tận nới không ạ',
    ),
    Customer(
      id: 2,
      phone: '098765432',
      avatar: 'assets/icons/user.png',
      active: true,
      ticketStatus: '0',
      routeCusCmt: 'Nhà xe có dịch vụ đưa đón tận nới không ạ',
      priceRoute: '150.000',
    ),
    Customer(
      id: 3,
      phone: '098765432',
      avatar: 'assets/icons/user.png',
      active: false,
      ticketStatus: '1',
      routeCusCmt: 'Nhà xe có dịch vụ đưa đón tận nới không ạ',
    ),
    Customer(
      id: 4,
      phone: '098765432',
      avatar: 'assets/icons/user.png',
      active: true,
      ticketStatus: '0',
      routeCusCmt: 'Nhà xe có dịch vụ đưa đón tận nới không ạ',
      priceRoute: '150.000',
    ),
    Customer(
      id: 5,
      phone: '098765432',
      avatar: 'assets/icons/user.png',
      active: false,
      ticketStatus: '1',
      routeCusCmt: 'Nhà xe có dịch vụ đưa đón tận nới không ạ',
    ),
    Customer(
      id: 6,
      phone: '098765432',
      avatar: 'assets/icons/user.png',
      active: true,
      ticketStatus: '0',
      routeCusCmt: 'Nhà xe có dịch vụ đưa đón tận nới không ạ',
      priceRoute: '150.000',
    ),
    Customer(
      id: 7,
      phone: '098765432',
      avatar: 'assets/icons/user.png',
      active: false,
      ticketStatus: '1',
      routeCusCmt: 'Nhà xe có dịch vụ đưa đón tận nới không ạ',
    ),
    Customer(
      id: 8,
      phone: '098765432',
      avatar: 'assets/icons/user.png',
      active: true,
      ticketStatus: '0',
      routeCusCmt: 'Nhà xe có dịch vụ đưa đón tận nới không ạ',
      priceRoute: '150.000',
    ),
    Customer(
      id: 9,
      phone: '09999999999',
      avatar: 'assets/icons/user.png',
      active: false,
      ticketStatus: '1',
      routeCusCmt: 'Nhà xe có dịch vụ đưa đón tận nới không ạ',
    ),
  ];
  @override
  void initState() {
    super.initState();
    for (final c in customers) {
      selectedMap[c.id] = false;
    }
    print({'collectAll': collectAll});
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        color: AppColors.grey,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Thống kê trong tháng',
                        style: GlobalStyles.mediumTitle.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        child: Image.asset(
                          "assets/icons/notification_black.png",
                          width: 24,
                          height: 24,
                        ),
                        onTap: () => context.push('/notification'),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 12,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          border: Border.all(color: AppColors.border, width: 1),
                          color: AppColors.white,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.semiBlack,
                              blurRadius: 2,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Text('Tuyến xe', style: GlobalStyles.textBold14),
                            SizedBox(height: 20),
                            Text('100 Tuyến', style: GlobalStyles.mediumTitle),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 12,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          border: Border.all(color: AppColors.border, width: 1),
                          color: AppColors.white,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.semiBlack,
                              blurRadius: 2,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Text('Tuyến xe', style: GlobalStyles.textBold14),
                            SizedBox(height: 20),
                            Text('100 Tuyến', style: GlobalStyles.mediumTitle),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 12,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          border: Border.all(color: AppColors.border, width: 1),
                          color: AppColors.white,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.semiBlack,
                              blurRadius: 2,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Text('Tuyến xe', style: GlobalStyles.textBold14),
                            SizedBox(height: 20),
                            Text('100 Tuyến', style: GlobalStyles.mediumTitle),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10),
                Divider(thickness: 1, color: AppColors.border),
                Row(
                  children: [
                    Text("Thông tin xe", style: GlobalStyles.textBold16),
                    SizedBox(width: 6),
                    GestureDetector(
                      onTap: () {
                        showBottomUpDialog(
                          context,
                          DialogAddVehicle(
                            onSubmit: (dialogContext) {
                              Navigator.pop(dialogContext);
                            },
                          ),
                        );
                      },
                      child: ClipOval(
                        child: Image.asset(
                          'assets/icons/plus_circle.png',
                          width: 24,
                          height: 24,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                CarInfo(trip: trip, type: 'car'),
                SizedBox(height: 8),
                CarInfo(trip: trip, type: 'car'),
                SizedBox(height: 8),
                CarInfo(trip: trip, type: 'car'),

                SizedBox(height: 8),
                Divider(thickness: 1, color: AppColors.border),
                Row(
                  children: [
                    Text("Tài xế", style: GlobalStyles.textBold16),
                    SizedBox(width: 6),
                    GestureDetector(
                      onTap: () {
                        showBottomUpDialog(
                          context,
                          DialogAddDriver(
                            onSubmit: (dialogContext) {
                              Navigator.pop(dialogContext);
                            },
                          ),
                        );
                      },
                      child: ClipOval(
                        child: Image.asset(
                          'assets/icons/plus_circle.png',
                          width: 24,
                          height: 24,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                DriverColumn(),
                SizedBox(height: 8),
                DriverColumn(),
                SizedBox(height: 8),
                DriverColumn(),

                SizedBox(height: 8),
                Divider(thickness: 1, color: AppColors.border),
                SizedBox(height: 8),
                Row(
                  children: [
                    Text("Tuyến xe", style: GlobalStyles.textBold16),
                    SizedBox(width: 6),
                    GestureDetector(
                      onTap: () {
                        showBottomUpDialog(
                          context,
                          DialogAddRoute(
                            onSubmit: (dialogContext) {
                              Navigator.pop(dialogContext);
                            },
                          ),
                        );
                      },
                      child: ClipOval(
                        child: Image.asset(
                          'assets/icons/plus_circle.png',
                          width: 24,
                          height: 24,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
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
              // ),
            ),
          ),
        ),
      ),
    );
  }
}
