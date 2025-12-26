import 'package:flutter/material.dart';
import 'package:my_app/core/constants/colors.dart';
import 'package:my_app/features/register-route/dinamic_form_list.dart';
import 'package:my_app/global_styles.dart';
import 'package:my_app/main.dart';
import 'package:my_app/widgets/AppButton.dart';
import 'package:my_app/widgets/AppInput.dart';
import 'package:my_app/widgets/AppSelect.dart';
import 'package:my_app/widgets/AppUploadImage.dart';

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

class DialogRegisterRoute extends StatelessWidget {
  final void Function(BuildContext) onSubmit;
  const DialogRegisterRoute({super.key, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Material(
      color: Colors.transparent,
      child: Container(
        width: size.width,
        height: size.height * 0.94,
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 40),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        // child: Expanded(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Thông tin xe', style: GlobalStyles.mediumTitle),
              AppUploadImage(
                size: 100,
                isCircle: false,
                fullWidth: true,
                onChanged: (file) {
                  logger.i('Selected image: ${file.path}');
                },
              ),
              const SizedBox(height: 20),
              AppInput(
                placeholder: 'Tên xe: VD Toyota Vios',
                height: 45,
                borderRadius: 8,
              ),
              const SizedBox(height: 8),
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
              const SizedBox(height: 8),
              AppSelect(
                placeholder: "Biển số xe",
                height: 45,
                border: true,
                padding: 12,
                items: carList
                    .map((c) => SelectItem(value: c.id, label: c.name))
                    .toList(),
              ),

              const SizedBox(height: 8),
              Divider(thickness: 1, color: AppColors.border),
              const SizedBox(height: 8),
              Text('Thông tin tuyến', style: GlobalStyles.mediumTitle),
              const SizedBox(height: 8),
              AppInput(placeholder: 'Điểm đầu', height: 45, borderRadius: 8),
              const SizedBox(height: 8),
              AppInput(placeholder: 'Điểm cuối', height: 45, borderRadius: 8),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: AppSelect(
                      placeholder: "Chuyến một chiều",
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
                      placeholder: "Chuyến cố định",
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
              const SizedBox(height: 8),
              AppInput(placeholder: 'Gía vé', height: 45, borderRadius: 8),

              const SizedBox(height: 8),
              Divider(thickness: 1, color: AppColors.border),
              const SizedBox(height: 8),
              Text('Tần xuất chiều đi', style: GlobalStyles.mediumTitle),
              const SizedBox(height: 8),
              ThreeColumnDynamicForm(),

              const SizedBox(height: 8),
              Divider(thickness: 1, color: AppColors.border),
              const SizedBox(height: 8),
              Text('Tần xuất chiều về', style: GlobalStyles.mediumTitle),
              const SizedBox(height: 8),
              ThreeColumnDynamicForm(),

              const SizedBox(height: 8),
              Divider(thickness: 1, color: AppColors.border),
              const SizedBox(height: 8),
              Text('Dịch vụ thêm', style: GlobalStyles.mediumTitle),

              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: AppButton(
                  label: 'Đăng ký',
                  onPressed: () => onSubmit(context),
                ),
              ),
            ],
          ),
        ),
        // ),
      ),
    );
  }
}
