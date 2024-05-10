import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:serenify/presentations/pages/aware/widgets/card_result_test.dart';
import 'package:serenify/presentations/pages/aware/widgets/card_test.dart';
import 'package:serenify/styles/my_colors.dart';
import 'package:serenify/styles/my_text.dart';

class AwarePage extends StatelessWidget {
  const AwarePage({super.key, required this.token});
  final String token;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
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
                  CardResultTest(token: token),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    'Ayo cek  mental awareness kamu hari ini!',
                    style: MyTextStyle.h6semi(color: Colors.black),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  const CardTest()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
