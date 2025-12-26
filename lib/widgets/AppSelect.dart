import 'package:flutter/material.dart';
import 'package:my_app/core/constants/colors.dart';
import 'package:my_app/global_styles.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class SelectItem<T> {
  final T value;
  final String label;

  SelectItem({required this.value, required this.label});
}

const double _prefixSpacing = 8;
const double _prefixIconSize = 22;

class AppSelect<T> extends StatefulWidget {
  final String placeholder;
  final List<SelectItem<T>> items;
  final T? value;
  final Widget? prefixIcon;
  final Color? backgroundColor;
  final double? width;
  final double? padding;
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
    this.padding = 0,
    this.width,
    this.height,
  });

  @override
  State<AppSelect<T>> createState() => _AppSelectState<T>();
}

class _AppSelectState<T> extends State<AppSelect<T>> {
  T? _selectedValue;

  double get _dropdownOffsetX {
    final padding = widget.padding ?? 0;
    if (widget.prefixIcon == null) return -padding;
    return -(padding + _prefixIconSize + _prefixSpacing);
  }

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double buttonWidth = constraints.maxWidth;
        return SizedBox(
          width: widget.width ?? double.infinity,
          height: widget.height ?? 50,
          child: Container(
            decoration: BoxDecoration(
              color: widget.backgroundColor ?? AppColors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: widget.border ? AppColors.border : Colors.transparent,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: widget.padding ?? 0),
              child: Row(
                children: [
                  if (widget.prefixIcon != null) ...[
                    widget.prefixIcon!,
                    const SizedBox(width: _prefixSpacing),
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
                          if (widget.onChanged != null)
                            widget.onChanged!(newValue);
                        },
                        dropdownStyleData: DropdownStyleData(
                          width: widget.width ?? buttonWidth,
                          offset: Offset(_dropdownOffsetX, 0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        buttonStyleData: const ButtonStyleData(
                          padding: EdgeInsets.zero,
                        ),
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
          ),
        );
      },
    );
  }
}
