import 'package:flutter/material.dart';
import 'package:serenify/presentations/pages/relaxation/widgets/card_relaxation.dart';
import 'package:serenify/styles/my_text.dart';

class RelaxationPage extends StatelessWidget {
  const RelaxationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Relaksasi',
          style: MyTextStyle.h5semi(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26),
        child: Column(
          children: [CardRelaxation()],
        ),
      ),
    );
  }
}
