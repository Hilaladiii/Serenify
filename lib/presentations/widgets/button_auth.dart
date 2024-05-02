import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:serenify/styles/my_text.dart';

class ButtonAuth extends StatelessWidget {
  const ButtonAuth({super.key, required this.icon, required this.label, required this.onPressed});

  final String icon;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          visualDensity: const VisualDensity(horizontal: VisualDensity.minimumDensity, vertical: 2),
          backgroundColor: Colors.white.withOpacity(0.4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: const BorderSide(color: Colors.white, width: 2)
          ),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/svgs/${icon}'),
            const SizedBox(width: 10,),
            Text(label, style: MyTextStyle.h7reg(color: Colors.white),)
          ],
        )
    );
  }
}
