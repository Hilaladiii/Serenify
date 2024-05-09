import 'package:flutter/material.dart';
import 'package:serenify/styles/my_text.dart';

enum Size { big, small }

class Button extends StatelessWidget {
  const Button(
      {super.key,
      required this.label,
      required this.color,
      required this.onPressed,
      required this.backgroundColor,
      required this.size});

  final String label;
  final Color color;
  final Color backgroundColor;
  final VoidCallback onPressed;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            elevation: 0,
            visualDensity: size == Size.big
                ? const VisualDensity(
                    horizontal: VisualDensity.maximumDensity, vertical: 1)
                : const VisualDensity(
                    horizontal: 0, vertical: VisualDensity.minimumDensity),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25))),
        child: Text(
          label,
          style: size == Size.big
              ? MyTextStyle.h6semi(color: color)
              : MyTextStyle.h8semi(color: color),
        ));
  }
}
