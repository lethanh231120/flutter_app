import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:my_app/core/constants/colors.dart';
import 'package:my_app/features/detail_trip/customer_item.dart';
import 'package:my_app/features/detail_trip/dialog_add_customer.dart';
import 'package:my_app/global_styles.dart';
import 'package:my_app/main.dart';
import 'package:my_app/models/customer.dart';
import 'package:my_app/widgets/AppButton.dart';
import 'package:my_app/widgets/AppInput.dart';
import 'package:my_app/widgets/AppRadio.dart';
import '../../models/trip.dart';
import '../../widgets/car_info.dart';
import '../../models/province.dart';

class DetailTripDrivePage extends StatefulWidget {
  final String tripId;
  const DetailTripDrivePage({super.key, required this.tripId});

  @override
  State<StatefulWidget> createState() => _DetailTripDrivePage();
}

class _DetailTripDrivePage extends State<DetailTripDrivePage> {
  Map<int, bool> selectedMap = {};
  bool collectAll = false;
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
        color: Colors.white,
        child: SafeArea(
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
                      'Thông tin chuyến',
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
              SizedBox(height: 6),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("Khách hàng", style: GlobalStyles.textBold16),
                          SizedBox(width: 6),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => DiaLogAddCustomer(
                                  onSubmit: () => Navigator.pop(context),
                                  onCancel: () => Navigator.pop(context),
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
                          Spacer(),
                          RadioItem(
                            title: 'Thu tiền tất cả',
                            isSelected: collectAll,
                            onTap: () {
                              setState(() {
                                collectAll = !collectAll; // toggle true/false
                              });
                              for (final key in selectedMap.keys) {
                                selectedMap[key] = collectAll;
                              }
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 6),
                      Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: customers.length,
                          itemBuilder: (_, i) {
                            final c = customers[i];
                            return Container(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                border: BoxBorder.fromLTRB(
                                  bottom: BorderSide(color: AppColors.border),
                                ),
                              ),
                              child: CustomerItem(
                                key: ValueKey(c.id),
                                data: c,
                                isSelected: selectedMap[c.id] ?? false,
                                onToggle: () {
                                  setState(() {
                                    selectedMap[c.id] =
                                        !(selectedMap[c.id] ?? false);
                                    collectAll =
                                        selectedMap.values.isNotEmpty &&
                                        selectedMap.values.every((v) => v);
                                  });
                                },
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: AppButton(
                          height: 40,
                          label: 'Tổng tiền mặt phải thu: 1.234.567 đ',
                        ),
                      ),
                      SizedBox(height: 8),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
