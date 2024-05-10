import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:serenify/styles/my_text.dart';

class ButtonProfile extends StatelessWidget {
  const ButtonProfile(
      {super.key,
      required this.icon,
      required this.label,
      required this.onpressed});

  final String icon;
  final String label;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 27),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          SvgPicture.asset('assets/svgs/${icon}.svg'),
          const SizedBox(
            width: 8,
          ),
          Text(
            label,
            style: MyTextStyle.h7reg(color: Colors.black),
          ),
          const Spacer(),
          SvgPicture.asset('assets/svgs/arrowleft.svg'),
        ],
      ),
    );
  }
}
