import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:serenify/styles/my_colors.dart';
import 'package:serenify/styles/my_text.dart';

class CardRelaxation extends StatelessWidget {
  const CardRelaxation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                  width: double.infinity,
                  height: 170,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                  child: Image.asset(
                    'assets/images/relax2.jpg',
                    fit: BoxFit.cover,
                  )),
              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(55),
                  child: Container(
                    width: 10,
                    height: 10,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withOpacity(0.2)),
                    child: SvgPicture.asset(
                      'assets/svgs/play.svg',
                    ),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Kenapa Terdistraksi?',
                  style: MyTextStyle.h5semi(color: Colors.black),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  '10:00',
                  style: MyTextStyle.h8reg(color: MyColors.gray200),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
