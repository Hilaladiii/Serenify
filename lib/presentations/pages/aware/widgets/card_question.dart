import 'package:flutter/material.dart';
import 'package:serenify/styles/my_colors.dart';
import 'package:serenify/styles/my_text.dart';

class CardQuestion extends StatefulWidget {
  const CardQuestion(
      {super.key, required this.questionNumber, required this.question});
  final String questionNumber;
  final String question;

  @override
  State<CardQuestion> createState() => _CardQuestionState();
}

class _CardQuestionState extends State<CardQuestion> {
  dynamic selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Pertanyaan ${widget.questionNumber}",
            style: MyTextStyle.h6semi(color: Colors.black),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            widget.question,
            style: MyTextStyle.h8reg(color: Colors.black),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Radio(
                value: 0,
                groupValue: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value as int;
                  });
                },
              ),
              Text(
                "Salah",
                style: MyTextStyle.h8reg(color: MyColors.gray400),
              ),
              const SizedBox(
                width: 20,
              ),
              Radio(
                value: 1,
                groupValue: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value as int;
                  });
                },
              ),
              Text(
                "Benar",
                style: MyTextStyle.h8reg(color: MyColors.gray400),
              ),
            ],
          )
        ],
      ),
    );
  }
}
