import 'package:flutter/material.dart';
import 'package:serenify/styles/my_text.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: MyTextStyle.h5semi(color: Colors.black),
      ),
      centerTitle: true,
    );
  }
}
