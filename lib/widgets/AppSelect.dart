import 'package:flutter/material.dart';
import 'package:my_app/core/constants/colors.dart';
import 'package:my_app/global_styles.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class SelectItem<T> {
  final T value;
  final String label;

  SelectItem({required this.value, required this.label});
}

class AppSelect<T> extends StatefulWidget {
  final String placeholder;
  final List<SelectItem<T>> items;
  final T? value;
  final Widget? prefixIcon;
  final Color? backgroundColor;
  final double? width;
  final double? height;
  final bool border;
  final Function(T?)? onChanged;

  const AppSelect({
    super.key,
    this.items = const [],
    this.value,
    this.prefixIcon,
    this.onChanged,
    required this.placeholder,
    this.backgroundColor,
    this.border = false,
    this.width,
    this.height,
  });

  @override
  State<AppSelect<T>> createState() => _AppSelectState<T>();
}

class _AppSelectState<T> extends State<AppSelect<T>> {
  T? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? double.infinity,
      height: widget.height ?? 50,
      child: Container(
        // padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: widget.backgroundColor ?? AppColors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: widget.border ? AppColors.mediumBlack : Colors.transparent,
          ),
        ),
        child: Row(
          children: [
            if (widget.prefixIcon != null) ...[
              widget.prefixIcon!,
              const SizedBox(width: 8),
            ],
            Expanded(
              child: DropdownButtonHideUnderline(
                child: DropdownButton2<T>(
                  isExpanded: true,
                  value: _selectedValue,
                  hint: Text(
                    widget.placeholder,
                    style: GlobalStyles.hintText,
                    textAlign: TextAlign.left,
                  ),
                  items: widget.items.map((SelectItem<T> item) {
                    return DropdownMenuItem<T>(
                      value: item.value,
                      child: Text(item.label),
                    );
                  }).toList(),
                  onChanged: (T? newValue) {
                    setState(() {
                      _selectedValue = newValue;
                    });
                    if (widget.onChanged != null) widget.onChanged!(newValue);
                  },
                  dropdownStyleData: DropdownStyleData(
                    maxHeight: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  buttonStyleData: ButtonStyleData(padding: EdgeInsets.zero),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors.black,
                    ),
                    iconSize: 22,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
