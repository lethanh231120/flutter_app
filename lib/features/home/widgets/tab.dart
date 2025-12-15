import 'package:flutter/material.dart';
import 'package:my_app/core/constants/colors.dart';
import 'package:my_app/core/constants/fonts.dart';
import 'tabs/compine_trips.dart';
import 'tabs/limousine.dart';
import 'tabs/sleep_bus.dart';
import 'tabs/seat_bus.dart';
import 'tabs/car.dart';
import 'tabs/cabin_car.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: IntrinsicHeight(
            child: TabBar(
              controller: _tabController,
              isScrollable: true,

              labelColor: AppColors.primary,
              unselectedLabelColor: AppColors.placeholder,
              labelStyle: const TextStyle(
                fontWeight: AppText.medium,
                fontSize: AppText.font14,
              ),

              dividerColor: AppColors.border,
              padding: EdgeInsets.zero,
              labelPadding: const EdgeInsets.symmetric(horizontal: 20),
              tabAlignment: TabAlignment.start,

              tabs: const [
                Tab(text: "Xe ghép"),
                Tab(text: "Limousine"),
                Tab(text: "Xe giường nằm"),
                Tab(text: "Xe ghế ngồi"),
                Tab(text: "Xe con"),
                Tab(text: "Xe ca bin"),
              ],
            ),
          ),
        ),

        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              CompineTripsTab(),
              // Expanded(child: CompineTripsTab()),
              LimousineTab(),
              SleepBusTab(),
              SeatBusTab(),
              CarTab(),
              CabinCartab(),
            ],
          ),
        ),
      ],
    );
  }
}
