import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:serenify/presentations/widgets/button.dart';
import 'package:serenify/styles/my_colors.dart';
import 'package:serenify/styles/my_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    'assets/svgs/serenify_logo.svg',
                    color: MyColors.tertiary400,
                    width: 90,
                    height: 37,
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
                Text(
                  'Bagaimana keadaanmu hari ini?',
                  style: MyTextStyle.h8reg(color: Colors.black),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                  decoration: ShapeDecoration(
                    color: MyColors.tertiary400,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    shadows: [
                      BoxShadow(
                        color: Color(0x23295BFF),
                        blurRadius: 3.50,
                        offset: Offset(0, 3.50),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Gangguan Bipolar',
                            style: MyTextStyle.h2bold(color: Colors.white),
                          ),
                          Text(
                            '80%',
                            style: MyTextStyle.h2bold(color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        'Mulai perjalanan penyembuhan Anda',
                        style: MyTextStyle.h8reg(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Button(
                              label: 'Detail',
                              color: Colors.white,
                              backgroundColor: Colors.white.withOpacity(0.4),
                              onPressed: () {}))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
