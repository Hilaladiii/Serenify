import 'package:flutter/material.dart';
import 'package:serenify/styles/my_colors.dart';
import 'package:serenify/styles/my_text.dart';

class SearchField extends StatelessWidget {
  SearchField({super.key, required this.controller});

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: MyTextStyle.h8reg(color: MyColors.gray400),
      controller: controller,
      decoration: InputDecoration(
          hintText: "Cari",
          hintStyle: MyTextStyle.h8reg(color: MyColors.gray400),
          filled: true,
          fillColor: MyColors.gray50,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide.none,
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          suffixIcon: Icon(
            Icons.search_outlined,
            color: MyColors.gray400,
          )),
    );
  }
}
