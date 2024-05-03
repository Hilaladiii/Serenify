import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:serenify/presentations/widgets/button.dart';
import 'package:serenify/styles/my_colors.dart';
import 'package:serenify/styles/my_text.dart';

class CardActivity extends StatelessWidget {
  const CardActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Container(
            width: 45,
            height: 45,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: MyColors.gray200,
                borderRadius: BorderRadius.circular(7)),
            child: SvgPicture.asset('assets/svgs/obat.svg'),
          ),
          const SizedBox(
            width: 14,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Konsumsi Obat',
                style: MyTextStyle.h6bold(color: Colors.black),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                width: 200,
                child: Text(
                  'Kamu dapat membeli obat sesuai dengan anjuran psikiater.',
                  style: MyTextStyle.h8reg(color: Colors.black),
                ),
              ),
              const SizedBox(
                height: 21,
              ),
              SizedBox(
                width: 220,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Detail',
                      style: MyTextStyle.h8reg(color: MyColors.tertiary400),
                    ),
                    Button(
                        label: 'Tandai selesai',
                        color: Colors.white,
                        onPressed: () {},
                        size: Size.small,
                        backgroundColor: MyColors.tertiary400)
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
