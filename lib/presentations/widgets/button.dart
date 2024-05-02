import 'package:flutter/material.dart';
import 'package:serenify/styles/my_text.dart';

class Button extends StatelessWidget {
  const Button(
      {super.key,
      required this.label,
      required this.color,
      required this.onPressed,
      required this.backgroundColor});

  final String label;
  final Color color;
  final Color backgroundColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            elevation: 0,
            visualDensity: const VisualDensity(
                horizontal: VisualDensity.maximumDensity, vertical: 1),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25))),
        child: Text(
          label,
          style: MyTextStyle.h6semi(color: color),
        ));
  }
}
