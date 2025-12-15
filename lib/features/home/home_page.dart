import 'package:flutter/material.dart';
import 'package:my_app/core/constants/colors.dart';
import 'package:my_app/models/trip.dart';
import 'package:my_app/widgets/AppButton.dart';
import 'package:my_app/widgets/AppDatePicker.dart';
import 'package:my_app/widgets/AppInput.dart';
import 'package:my_app/widgets/AppSelect.dart';
import 'package:my_app/features/home/widgets/tab.dart';
import '../detail_trip/detail_trip.dart';
import 'package:go_router/go_router.dart';

class seatsCar {
  final String id;
  final String name;
  seatsCar(this.id, this.name);
}

List<seatsCar> carList = [
  seatsCar("1", "1 chỗ"),
  seatsCar("2", "2 chỗ"),
  seatsCar("3", "3 chỗ"),
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController fromAddressController = TextEditingController();
  final TextEditingController toAddressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
      color: Colors.transparent,
      child: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Container(
              width: size.width,
              height: size.height * 0.45,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/background.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: size.width,
              height: size.height,
              color: AppColors.mediumBlack,
            ),
            Positioned.fill(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 15), // padding top
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              child: Image.asset(
                                "assets/icons/user.png",
                                width: 40,
                                height: 40,
                              ),
                              onTap: () => context.go('/profile'),
                            ),
                            GestureDetector(
                              child: Image.asset(
                                "assets/icons/notification_white.png",
                                width: 24,
                                height: 24,
                              ),
                              onTap: () => context.go('/notification'),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        AppInput(
                          placeholder: "Điểm đi...",
                          prefixIcon: Image.asset(
                            "assets/icons/location_primary.png",
                            width: 32,
                            height: 32,
                          ),
                          suffixIcon: Image.asset(
                            "assets/icons/search.png",
                            width: 22,
                            height: 22,
                          ),
                          backgroundColor: AppColors.white,
                          border: false,
                          controller: fromAddressController,
                        ),
                        SizedBox(height: 12),
                        AppInput(
                          placeholder: "Điểm đến...",
                          prefixIcon: Image.asset(
                            "assets/icons/location_primary.png",
                            width: 32,
                            height: 32,
                          ),
                          suffixIcon: Image.asset(
                            "assets/icons/search.png",
                            width: 22,
                            height: 22,
                          ),
                          backgroundColor: AppColors.white,
                          border: false,
                          controller: toAddressController,
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: AppDatePicker(
                                placeholder: "Chọn ngày",
                                backgroundColor: AppColors.white,
                                height: 45,
                                border: false,
                              ),
                            ),
                            SizedBox(width: 10),

                            Expanded(
                              child: AppSelect(
                                placeholder: "Chọn giờ",
                                backgroundColor: AppColors.white,
                                height: 45,
                                prefixIcon: Image.asset(
                                  "assets/icons/waiting.png",
                                  width: 22,
                                  height: 22,
                                ),
                                items: carList
                                    .map(
                                      (c) => SelectItem(
                                        value: c.id,
                                        label: c.name,
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        AppButton(
                          label: "Tìm chuyến",
                          type: ButtonType.primary,
                          onPressed: () {},
                          prefixIcon: Image.asset(
                            "assets/icons/car.png",
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),

                  Expanded(
                    child: Container(
                      width: size.width,
                      height: size.height * 0.49,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        border: Border(
                          top: BorderSide(color: AppColors.border, width: 1),
                          left: BorderSide(color: AppColors.border, width: 1),
                          right: BorderSide(color: AppColors.border, width: 1),
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                        child: const OrderScreen(),
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
