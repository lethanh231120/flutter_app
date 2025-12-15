import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class CustomRadioController<T> extends ChangeNotifier {
  T? _value;

  T? get value => _value;

  set value(T? newValue) {
    if (_value != newValue) {
      _value = newValue;
      notifyListeners();
    }
  }
}

class CustomRadioGroup<T> extends StatefulWidget {
  final CustomRadioController<T> controller;
  final List<CustomRadioItem<T>> items;
  final Axis direction; // vertical or horizontal
  final double spacing;

  const CustomRadioGroup({
    super.key,
    required this.controller,
    required this.items,
    this.direction = Axis.vertical,
    this.spacing = 8,
  });

  @override
  State<CustomRadioGroup<T>> createState() => _CustomRadioGroupState<T>();
}

class _CustomRadioGroupState<T> extends State<CustomRadioGroup<T>> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onControllerChanged);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onControllerChanged);
    super.dispose();
  }

  void _onControllerChanged() {
    setState(() {}); // cập nhật UI khi value thay đổi
  }

  @override
  Widget build(BuildContext context) {
    final selectedValue = widget.controller.value;
    final children = widget.items.map((item) {
      final isSelected = item.value == selectedValue;
      return InkWell(
        onTap: () {
          widget.controller.value = item.value;
        },
        borderRadius: BorderRadius.circular(6),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? Theme.of(context).colorScheme.primary
                      : Colors.grey,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 8),
            // label (allow a custom widget or text)
            item.child ?? Text(item.label),
          ],
        ),
      );
    }).toList();

    return widget.direction == Axis.vertical
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children.expand((w) sync* {
              yield w;
              if (widget.spacing > 0) yield SizedBox(height: widget.spacing);
            }).toList(),
          )
        : Row(
            children: children.expand((w) sync* {
              yield w;
              if (widget.spacing > 0) yield SizedBox(width: widget.spacing);
            }).toList(),
          );
  }
}

class CustomRadioItem<T> {
  final T value;
  final String label;
  final Widget? child; // optional custom widget

  CustomRadioItem({required this.value, required this.label, this.child});
}
