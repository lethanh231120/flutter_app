import 'package:flutter/material.dart';
import 'package:my_app/core/constants/colors.dart';
import 'package:my_app/global_styles.dart';
import 'package:my_app/widgets/AppSwicth.dart';
import 'package:my_app/widgets/AppTag.dart';
import '../models/trip.dart';

final Map<int, Map<String, String>> statusTrips = {
  1: {'type': 'success', 'text': 'Đã đón'},
  0: {'type': 'default', 'text': 'Đã xác nhận'},
  2: {'type': 'warning', 'text': 'Chưa xác nhận'},
  3: {'type': 'error', 'text': 'Đã Hủy'},
  4: {'type': 'success', 'text': 'Đang di chuyển'},
};

class CarInfo extends StatefulWidget {
  final Trip trip;
  final String type;
  final double size;
  final VoidCallback? onAction;
  const CarInfo({
    super.key,
    required this.trip,
    required this.type,
    this.onAction,
    this.size = 80,
  });

  @override
  State<CarInfo> createState() => _CarInfo();
}

class _CarInfo extends State<CarInfo> {
  bool isSendNoti = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: widget.onAction,
      child: Container(
        width: size.width,
        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
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
                    width: widget.size,
                    height: widget.size,
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
                            if (widget.trip.driveName != null)
                              Text(
                                'Tên xe: ${widget.trip.driveName}',
                                style: GlobalStyles.regularText,
                                softWrap: true,
                              ),
                            if (widget.trip.vehicleType != null)
                              Text(
                                'Loại xe: ${widget.trip.vehicleType}',
                                style: GlobalStyles.regularText,
                                softWrap: true,
                              ),
                            if (widget.trip.plateNumber != null)
                              Text(
                                'Biển số: ${widget.trip.plateNumber}',
                                style: GlobalStyles.regularText,
                                softWrap: true,
                              ),
                            if (widget.trip.seats != null)
                              Text(
                                'Chỗ ngồi: ${widget.trip.seats}',
                                style: GlobalStyles.regularText,
                                softWrap: true,
                              ),
                            if (widget.trip.attributes != null)
                              Text(
                                'Tiện ích: ${widget.trip.attributes}',
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
                                if (widget.trip.startTime != null)
                                  Text(
                                    'Xuất phát: ${widget.trip.startTime}',
                                    style: GlobalStyles.regularText,
                                    softWrap: true,
                                  ),
                                if (widget.trip.seatsBooked != null &&
                                    widget.trip.seats != null)
                                  Text(
                                    '${widget.trip.seatsBooked} / ${widget.trip.seats} ghế',
                                    style: GlobalStyles.regularText.copyWith(
                                      color: AppColors.primary,
                                    ),
                                    softWrap: true,
                                  ),
                              ],
                            ),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Gía vé: ',
                                  style: GlobalStyles.regularText,
                                  softWrap: true,
                                ),
                                if (widget.trip.price != null)
                                  Text(
                                    '${widget.trip.price} đ',
                                    style: GlobalStyles.textBold14.copyWith(
                                      color: AppColors.primary,
                                    ),
                                    softWrap: true,
                                  ),

                                Spacer(),
                                AppSwitch(
                                  value: isSendNoti,
                                  width: 44,
                                  height: 24,
                                  activeColor: AppColors.primary,
                                  inactiveColor: Colors.grey.shade400,
                                  onChanged: (v) {
                                    setState(() => isSendNoti = v);
                                  },
                                ),
                              ],
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
