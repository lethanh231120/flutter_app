import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:my_app/core/constants/colors.dart';
import 'package:my_app/global_styles.dart';

class AppDatePicker extends StatefulWidget {
  final String placeholder;
  final Color? backgroundColor;
  final double? width;
  final double? height;
  final bool border;

  const AppDatePicker({
    super.key,
    required this.placeholder,
    this.backgroundColor,
    this.width,
    this.height,
    this.border = true,
  });

  @override
  State<AppDatePicker> createState() => _AppDatePickerState();
}

class _AppDatePickerState extends State<AppDatePicker> {
  DateTime? _selectedDate;

  String formatDate(DateTime date) {
    // dd MMMM, yyyy → 12 Tháng 10, 2025
    return DateFormat("dd 'Tháng' MM, yyyy", 'vi_VN').format(date);
  }

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: InkWell(
        onTap: _pickDate,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: widget.backgroundColor ?? Colors.white,
            border: widget.border
                ? Border.all(color: AppColors.border, width: 1)
                : null,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Icon(Icons.calendar_today, color: AppColors.border, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  _selectedDate != null
                      ? DateFormat(
                          "dd 'Tháng' MM, yyyy",
                          'vi_VN',
                        ).format(_selectedDate!)
                      : widget.placeholder,
                  style: _selectedDate != null
                      ? GlobalStyles.regularText
                      : GlobalStyles.hintText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
