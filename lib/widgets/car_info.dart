import 'package:flutter/material.dart';
import 'package:my_app/core/constants/colors.dart';
import 'package:my_app/global_styles.dart';
import 'package:my_app/widgets/AppTag.dart';
import '../models/trip.dart';

final Map<int, Map<String, String>> statusTrips = {
  1: {'type': 'success', 'text': 'Đã đón'},
  0: {'type': 'default', 'text': 'Đã xác nhận'},
  2: {'type': 'warning', 'text': 'Chưa xác nhận'},
  3: {'type': 'error', 'text': 'Đã Hủy'},
};

class CarInfo extends StatefulWidget {
  final Trip trip;
  final String type;
  final VoidCallback? onAction;
  const CarInfo({
    super.key,
    required this.trip,
    required this.type,
    this.onAction,
  });

  @override
  State<CarInfo> createState() => _CarInfo();
}

class _CarInfo extends State<CarInfo> {
  @override
  Widget build(BuildContext context) {
    print({'trip': widget.trip.toJson(), 'type': widget.type});
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: widget.onAction,
      child: Container(
        width: size.width,
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.border, width: 1),
          borderRadius: BorderRadius.circular(14),
          color: AppColors.white,
        ),
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage('assets/images/background.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: widget.type == 'car'
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Loại xe: Toyota Vios',
                              style: GlobalStyles.regularText,
                              softWrap: true,
                            ),
                            Text(
                              'Biển số: 30A - 12345',
                              style: GlobalStyles.regularText,
                              softWrap: true,
                            ),
                            Text(
                              'Tiện ích: Giường nằm, Điều hòa, Nước lọc',
                              style: GlobalStyles.regularText,
                              softWrap: true,
                            ),
                            Text(
                              'Chỗ ngồi: 25 / 30 đã đặt',
                              style: GlobalStyles.regularText,
                              softWrap: true,
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '${widget.trip.startProvince!.name} - ${widget.trip.endProvince!.name}',
                                  style: GlobalStyles.textBold14,
                                  softWrap: true,
                                ),
                                CustomeTag(
                                  text:
                                      statusTrips[widget
                                          .trip
                                          .status]?['text'] ??
                                      '',
                                  type:
                                      statusTrips[widget
                                          .trip
                                          .status]?['type'] ??
                                      'default',
                                ),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Xuất phát: ${widget.trip.startTime}',
                                  style: GlobalStyles.regularText,
                                  softWrap: true,
                                ),
                                Text(
                                  '${widget.trip.seatsBooked} / ${widget.trip.seats} ghế',
                                  style: GlobalStyles.regularText.copyWith(
                                    color: AppColors.primary,
                                  ),
                                  softWrap: true,
                                ),
                              ],
                            ),
                            Text(
                              'Biển số: 30A - 12345',
                              style: GlobalStyles.regularText,
                              softWrap: true,
                            ),
                          ],
                        ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
