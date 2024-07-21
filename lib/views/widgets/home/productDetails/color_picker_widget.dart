import 'package:flutter/material.dart';

class ColorPickerWidget extends StatelessWidget {
  const ColorPickerWidget(
      {super.key, required this.outerOrder, required this.color});

  final bool outerOrder;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: outerOrder ? Border.all(color: color, width: 2) : null,
      ),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
