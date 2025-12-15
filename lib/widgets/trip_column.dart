import 'package:flutter/material.dart';
import 'package:my_app/core/constants/colors.dart';
import 'package:my_app/core/constants/fonts.dart';
import '../models/trip.dart';
import 'package:go_router/go_router.dart';

class TripColumnItem extends StatefulWidget {
  final Trip trip;
  const TripColumnItem({super.key, required this.trip});

  @override
  State<TripColumnItem> createState() => _TripColumnItem();
}

class _TripColumnItem extends State<TripColumnItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Bạn vừa bấm!");
        // Navigator.of(context).pushNamed('/detail', arguments: widget.trip);
        // context.push('/trip/234');
        context.push('/trip_drive/234');
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.border, width: 1),
          borderRadius: BorderRadius.circular(14),
          color: AppColors.white,
        ),
        child: Column(
          children: [
            SizedBox(
              width: 150,
              height: 100,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  image: DecorationImage(
                    image: AssetImage('assets/images/background.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            Container(
              width: 150,
              padding: EdgeInsetsGeometry.symmetric(horizontal: 4, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(14),
                  bottomRight: Radius.circular(14),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.trip.startProvince != null)
                    Text(
                      '${widget.trip.startProvince!.name} - ${widget.trip.endProvince!.name}',
                      style: TextStyle(
                        fontSize: AppText.font14,
                        color: AppColors.black,
                        fontWeight: AppText.bold,
                      ),
                      softWrap: true,
                    ),

                  if (widget.trip.startTime != null)
                    Text(
                      'Xuất phát: ${widget.trip.startTime}',
                      style: TextStyle(
                        fontSize: AppText.font14,
                        color: AppColors.black,
                      ),
                      softWrap: true,
                    ),
                  SizedBox(height: 6),
                  if (widget.trip.price != null)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/icons/car_primary.png',
                          width: 20,
                          height: 20,
                        ),
                        Text(
                          widget.trip.price!,
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: AppText.font14,
                            fontWeight: AppText.bold,
                          ),
                          softWrap: true,
                        ),
                      ],
                    ),
                ],
              ),
            ),
            // ),
          ],
        ),
      ),
    );
  }
}
