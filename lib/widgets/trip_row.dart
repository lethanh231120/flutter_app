import 'package:flutter/material.dart';
import 'package:my_app/core/constants/colors.dart';
import 'package:my_app/core/constants/fonts.dart';
import 'package:my_app/global_styles.dart';
import '../models/trip.dart';
import 'package:go_router/go_router.dart';

class TripRowItem extends StatefulWidget {
  final Trip trip;
  final bool hasTab;
  const TripRowItem({super.key, required this.trip, this.hasTab = true});

  @override
  State<TripRowItem> createState() => _TripRowItem();
}

class _TripRowItem extends State<TripRowItem> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        // widget.hasTab ? context.push('/trip_drive/234') : null;
        widget.hasTab ? context.push('/trip/234') : null;
      },
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
                  width: 90,
                  height: 90,
                  child: Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      // color: AppColors.btnSuccess,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (widget.trip.vehicleType != null)
                        Text(
                          'Loại xe: ${widget.trip.vehicleType}',
                          style: TextStyle(
                            fontSize: AppText.font14,
                            color: AppColors.black,
                            fontWeight: AppText.bold,
                          ),
                          softWrap: true,
                        ),
                      if (widget.trip.plateNumber != null)
                        Text(
                          'Biển số: ${widget.trip.plateNumber}',
                          style: TextStyle(
                            fontSize: AppText.font14,
                            color: AppColors.black,
                            fontWeight: AppText.bold,
                          ),
                          softWrap: true,
                        ),
                      if (widget.trip.seats != null)
                        Text(
                          'Ghế ngồi: ${widget.trip.seats}',
                          style: TextStyle(
                            fontSize: AppText.font14,
                            color: AppColors.black,
                            fontWeight: AppText.bold,
                          ),
                          softWrap: true,
                        ),
                      if (widget.trip.owner != null)
                        Text(
                          'Nhà xe: ${widget.trip.owner}',
                          style: GlobalStyles.regularText,
                          softWrap: true,
                        ),
                      if (widget.trip.startPoint != null)
                        Text(
                          'Điểm xuất phát: ${widget.trip.startPoint}',
                          style: GlobalStyles.regularText,
                          softWrap: true,
                        ),
                      if (widget.trip.endPoint != null)
                        Text(
                          'Điểm cuối: ${widget.trip.endPoint}',
                          style: GlobalStyles.regularText,
                          softWrap: true,
                        ),
                    ],
                  ),
                ),
              ],
            ),
            if (widget.trip.startTime != null && widget.trip.price != null)
              SizedBox(height: 8),
            if (widget.trip.startTime != null && widget.trip.price != null)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Giờ xuất phát: ${widget.trip.startTime}',
                    style: GlobalStyles.regularText,
                  ),
                  SizedBox(width: 15),
                  Text(
                    'Gía vé: ${widget.trip.price} đ',
                    style: GlobalStyles.regularText.copyWith(
                      color: AppColors.primary,
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
