import 'package:flutter/material.dart';
import 'package:my_app/widgets/AppButton.dart';
import 'package:my_app/widgets/AppInput.dart';
import 'package:my_app/widgets/AppRadio.dart';

class DiaLogAddCustomer extends StatefulWidget {
  final VoidCallback onSubmit;
  final VoidCallback onCancel;
  const DiaLogAddCustomer({
    Key? key,
    required this.onSubmit,
    required this.onCancel,
  });

  @override
  State<DiaLogAddCustomer> createState() => _DiaLogAddCustomer();
}

class _DiaLogAddCustomer extends State<DiaLogAddCustomer> {
  bool isSelected = true;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: UnconstrainedBox(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: size.width * 0.9),
          child: Material(
            borderRadius: BorderRadius.circular(20),
            color: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Text(
                    "Thêm khách hàng",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: AppInput(placeholder: 'Số điện thoại')),
                      const SizedBox(width: 10),

                      Expanded(child: AppInput(placeholder: 'Số ghế')),
                    ],
                  ),
                  const SizedBox(height: 12),
                  AppInput(placeholder: 'Điểm lên'),
                  const SizedBox(height: 12),
                  AppInput(placeholder: 'Điểm xuống'),
                  const SizedBox(height: 12),
                  AppInput(placeholder: 'Gía vé'),
                  const SizedBox(height: 12),
                  RadioItem(
                    isSelected: isSelected,
                    onTap: () => setState(() {
                      isSelected = !isSelected;
                    }),
                    title: 'Thanh toán tiền mặt',
                    isBold: true,
                  ),

                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AppButton(
                        onPressed: widget.onCancel,
                        label: 'Hủy',
                        type: ButtonType.error,
                        height: 25,
                      ),
                      SizedBox(width: 10),
                      AppButton(
                        onPressed: widget.onSubmit,
                        label: 'Xác nhận',
                        type: ButtonType.primary,
                        height: 25,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
