import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:serenify/styles/my_colors.dart';
import 'package:serenify/styles/my_text.dart';

class CardSeminar extends StatelessWidget {
  const CardSeminar(
      {super.key,
      required this.onTap,
      required this.title,
      required this.place,
      required this.time,
      required this.image,
      required this.price});
  final VoidCallback onTap;
  final String title;
  final String place;
  final String time;
  final String image;
  final int price;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x549B9B9B),
                blurRadius: 0.1,
                offset: Offset(0, 0.5),
                spreadRadius: 0,
              ),
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              image,
              width: 97,
              height: 138,
            ),
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
                    style: MyTextStyle.h7semi(color: Colors.black),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svgs/location.svg',
                        color: MyColors.tertiary400,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        place,
                        style: MyTextStyle.h8reg(color: MyColors.gray400),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/svgs/time.svg',
                        color: MyColors.tertiary400,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        time,
                        style: MyTextStyle.h8reg(color: MyColors.gray400),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 23,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(
                        width: 50,
                      ),
                      Text(
                        'Rp.$price',
                        style: MyTextStyle.h5semi(color: MyColors.tertiary400),
                      ),
                      Text(
                        '/ orang',
                        style: MyTextStyle.h8reg(color: MyColors.gray200),
                      ),
                    ],
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
