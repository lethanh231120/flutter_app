import 'package:flutter/material.dart';
import 'package:my_app/global_styles.dart';
import 'package:my_app/widgets/AppButton.dart';
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

class DialogAddDriver extends StatelessWidget {
  final void Function(BuildContext) onSubmit;
  const DialogAddDriver({super.key, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Material(
      color: Colors.transparent,
      child: Container(
        width: size.width,
        height: size.height * 0.4,
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 40),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Thông tin tài xế',
              style: GlobalStyles.mediumTitle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            AppSelect(
              placeholder: "Nhập số điện thoại tài xê",
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
            const SizedBox(height: 12),
            AppSelect(
              placeholder: "Chọn tuyến",
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
                label: 'Lưu thông tin xe',
                onPressed: () => onSubmit(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
