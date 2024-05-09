import 'package:flutter/material.dart';
import 'package:serenify/styles/my_colors.dart';

void mySnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: MyColors.tertiary400,
      content: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    ),
  );
}
