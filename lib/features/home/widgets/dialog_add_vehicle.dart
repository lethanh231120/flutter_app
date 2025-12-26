import 'package:flutter/material.dart';
import 'package:my_app/main.dart';
import 'package:my_app/widgets/AppButton.dart';
import 'package:my_app/widgets/AppInput.dart';
import 'package:my_app/widgets/AppSelect.dart';
import 'package:my_app/widgets/AppUploadImage.dart';

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

class DialogAddVehicle extends StatelessWidget {
  final void Function(BuildContext) onSubmit;
  const DialogAddVehicle({super.key, required this.onSubmit});

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppUploadImage(
              size: 100,
              isCircle: false,
              fullWidth: true,
              onChanged: (file) {
                logger.i('Selected image: ${file.path}');
              },
            ),
            const SizedBox(height: 12),
            AppInput(
              placeholder: 'Tên xe: VD Toyota Vios',
              height: 45,
              borderRadius: 8,
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: AppSelect(
                    placeholder: "Loại xe",
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
                    placeholder: "Chỗ ngồi",
                    height: 45,
                    border: true,
                    padding: 12,
                    prefixIcon: SizedBox(
                      width: 22,
                      height: 22,
                      child: Image.asset(
                        "assets/icons/waiting.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    items: carList
                        .map((c) => SelectItem(value: c.id, label: c.name))
                        .toList(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            AppInput(placeholder: 'Biển số xe', height: 45, borderRadius: 8),
            const SizedBox(height: 12),
            AppInput(
              placeholder: 'Số điện thoại tài xê',
              height: 45,
              borderRadius: 8,
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
