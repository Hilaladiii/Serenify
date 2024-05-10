import 'package:flutter/material.dart';
import 'package:serenify/presentations/pages/aware/aware_test.dart';
import 'package:serenify/presentations/widgets/button.dart';
import 'package:serenify/styles/my_colors.dart';
import 'package:serenify/styles/my_text.dart';

class AwareJourney extends StatelessWidget {
  const AwareJourney({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height / 2,
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(shape: BoxShape.rectangle),
            child: Image.asset(
              'assets/images/testImage.png',
              fit: BoxFit.cover,
            ),
          ),
          Text(
            'Aware Journey',
            style: MyTextStyle.h2bold(color: Colors.black),
          ),
          const SizedBox(
            height: 23,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              ' Kami sangat senang kamu memilih untuk bergabung dengan kami dalam perjalanan menuju kesadaran mental yang lebih dalam.',
              style: MyTextStyle.h7reg(color: Colors.black),
              textAlign: TextAlign.justify,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              "mari kita mulai dengan pertanyaan-pertanyaan yang dirancang untuk membantu kamu mengetahui tingkat mental awareness yang kamu miliki!",
              style: MyTextStyle.h7reg(color: Colors.black),
              textAlign: TextAlign.justify,
            ),
          ),
          const Spacer(),
          Button(
              label: "Mulai",
              color: Colors.white,
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return const AwareTest();
                }));
              },
              backgroundColor: MyColors.tertiary400,
              size: Size.big),
          const Spacer()
        ],
      ),
    );
  }
}
