import 'package:flutter/material.dart';
import 'package:my_app/models/customer.dart';

class CustomerDialog extends StatelessWidget {
  final List<Customer>? customers;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const CustomerDialog({
    Key? key,
    this.customers,
    required this.onConfirm,
    required this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: UnconstrainedBox(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: size.width * 0.9,
            maxHeight: size.height * 0.8,
          ),
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
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Danh sách khách hàng",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),

                  Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...customers!.map(
                        (cus) => Row(
                          children: [
                            // Container(
                            //   padding: EdgeInsets.symmetric(vertical: 8),
                            //   // decoration: Box,
                            // ),
                            ClipOval(
                              child: Image.asset(
                                cus.avatar,
                                width: 45,
                                height: 45,
                                fit: BoxFit.cover,
                              ),
                            ),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cus.phone,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: onConfirm,
                        child: const Text("Hủy"),
                      ),
                      ElevatedButton(
                        onPressed: onCancel,
                        child: const Text("OK"),
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
