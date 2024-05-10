import 'package:flutter/material.dart';
import 'package:serenify/styles/my_colors.dart';
import 'package:serenify/styles/my_text.dart';

class CardActivity extends StatelessWidget {
  const CardActivity(
      {super.key,
      required this.image,
      required this.title,
      required this.description,
      required this.navigate});

  final String image;
  final String title;
  final String description;
  final Widget navigate;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return navigate;
          },
        ));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          shadows: const [
            BoxShadow(
              color: Color(0x23295BFF),
              blurRadius: 3.50,
              offset: Offset(0, 3.50),
              spreadRadius: 0,
            )
          ],
        ),
        child: Row(
          children: [
            Image.asset('assets/images/$image.png'),
            const SizedBox(
              width: 5,
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width / 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: MyTextStyle.h6semi(color: Colors.black),
                  ),
                  Text(
                    description,
                    style: MyTextStyle.h8reg(color: MyColors.gray300),
                    textAlign: TextAlign.justify,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
