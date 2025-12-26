import 'package:flutter/material.dart';
import 'package:my_app/global_styles.dart';
import 'package:my_app/models/province.dart';
import 'package:my_app/models/trip.dart';
import 'package:my_app/widgets/AppButton.dart';
import 'package:my_app/widgets/AppInput.dart';
import 'package:my_app/widgets/AppSelect.dart';

class SeatsCar {
  final String id;
  final String name;
  SeatsCar(this.id, this.name);
}

List<SeatsCar> carList = [
  SeatsCar("1", "1 chỗ"),
  SeatsCar("2", "2 chỗ"),
  SeatsCar("3", "3 chỗ"),
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

class DialogAddRoute extends StatelessWidget {
  final void Function(BuildContext) onSubmit;
  const DialogAddRoute({super.key, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Material(
      color: Colors.transparent,
      child: Container(
        width: size.width,
        height: size.height * 0.6,
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 40),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Thông tin tuyến',
              style: GlobalStyles.mediumTitle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            AppInput(placeholder: 'Điểm đầu', height: 45, borderRadius: 8),
            const SizedBox(height: 12),
            AppInput(placeholder: 'Điểm cuối', height: 45, borderRadius: 8),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: AppSelect(
                    placeholder: "Loại chuyến",
                    height: 45,
                    border: true,
                    padding: 12,
                    items: carList
                        .map((c) => SelectItem(value: c.id, label: c.name))
                        .toList(),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: AppSelect(
                    placeholder: "Tuyến cố định",
                    height: 45,
                    border: true,
                    padding: 12,
                    items: carList
                        .map((c) => SelectItem(value: c.id, label: c.name))
                        .toList(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            AppInput(placeholder: 'Gía vé', height: 45, borderRadius: 8),
            const SizedBox(height: 12),
            AppSelect(
              placeholder: "Chọn tài xế",
              height: 45,
              border: true,
              padding: 12,
              items: carList
                  .map((c) => SelectItem(value: c.id, label: c.name))
                  .toList(),
            ),
            const SizedBox(height: 12),
            AppSelect(
              placeholder: "Chọn xe",
              height: 45,
              border: true,
              padding: 12,
              items: carList
                  .map((c) => SelectItem(value: c.id, label: c.name))
                  .toList(),
            ),

            Spacer(),
            SizedBox(
              width: double.infinity,
              child: AppButton(
                label: 'Lưu thông tin tuyến',
                onPressed: () => onSubmit(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
