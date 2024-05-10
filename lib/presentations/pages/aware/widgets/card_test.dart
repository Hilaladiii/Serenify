import 'package:flutter/material.dart';
import 'package:serenify/presentations/pages/aware/aware_journey.dart';
import 'package:serenify/presentations/widgets/button.dart';
import 'package:serenify/styles/my_colors.dart';
import 'package:serenify/styles/my_text.dart';

class CardTest extends StatelessWidget {
  const CardTest({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 22),
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
        child: Column(
          children: [
            Text(
              "Aware Journey",
              style: MyTextStyle.h7bold(color: MyColors.tertiary400),
            ),
            const SizedBox(
              height: 5,
            ),
            Image.asset('assets/images/testAware.png'),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Mulai ikuti tes dan temukan langkah  menuju kesejahteraan yang lebih baik',
              style: MyTextStyle.h8reg(color: MyColors.gray300),
            ),
            const SizedBox(
              height: 5,
            ),
            Button(
              label: "Cek Sekarang",
              backgroundColor: MyColors.tertiary400,
              color: Colors.white,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const AwareJourney();
                }));
              },
              size: Size.small,
            )
          ],
        ));
  }
}
