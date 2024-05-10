import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:serenify/bloc/auth/auth_bloc.dart';
import 'package:serenify/bloc/test/test_bloc.dart';
import 'package:serenify/presentations/pages/aware/aware_result_page.dart';
import 'package:serenify/presentations/widgets/button.dart';
import 'package:serenify/presentations/widgets/snackbar.dart';
import 'package:serenify/styles/my_colors.dart';
import 'package:serenify/styles/my_text.dart';
import 'package:serenify/constant/question.dart';

class AwareTest extends StatefulWidget {
  const AwareTest({super.key});

  @override
  State<AwareTest> createState() => _AwareTestState();
}

class _AwareTestState extends State<AwareTest> {
  List<String> answers = List.filled(question.length, "");

  void onAnswerSelected(int questionIndex, String answer) {
    setState(() {
      answers[questionIndex] = answer;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocConsumer<TestBloc, TestState>(
          listener: (context, state) {
            if (state is TestFetchSucces) {
              print(state.result.score);
              print(state.result.description);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return AwareResultPage(
                    score: state.result.score,
                    description: state.result.description);
              }));
            }
            if (state is TestFetchFailed) {
              mySnackBar(context, state.error);
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/svgs/serenify_logo.svg',
                      width: 135,
                      height: 43,
                    ),
                    const SizedBox(
                      height: 23,
                    ),
                    Text(
                      'Isi jawaban dengan benar untuk mengetahui  tingkat mental awareness anda!',
                      style: MyTextStyle.h4bold(color: Colors.black),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Column(
                      children: List.generate(
                        question.length,
                        (index) => Container(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Pertanyaan ${index + 1}",
                                style: MyTextStyle.h6semi(color: Colors.black),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                question[index],
                                style: MyTextStyle.h8reg(color: Colors.black),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Radio(
                                    value: "S",
                                    groupValue: answers[index],
                                    onChanged: (value) {
                                      setState(() {
                                        answers[index] = value as String;
                                      });
                                    },
                                  ),
                                  Text(
                                    "Salah",
                                    style: MyTextStyle.h8reg(
                                        color: MyColors.gray400),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Radio(
                                    value: "B",
                                    groupValue: answers[index],
                                    onChanged: (value) {
                                      setState(() {
                                        answers[index] = value as String;
                                      });
                                    },
                                  ),
                                  Text(
                                    "Benar",
                                    style: MyTextStyle.h8reg(
                                        color: MyColors.gray400),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Button(
                        label: (state is LoginFetchLoading)
                            ? "Submitting..."
                            : "Submit Jawaban",
                        color: Colors.white,
                        onPressed: () {
                          String token = (context.read<AuthBloc>().state
                                  as LoginFetchSuccess)
                              .token;
                          context.read<TestBloc>().add(TestEvaluateEvent(
                              answers: answers, token: token));
                        },
                        backgroundColor: MyColors.tertiary400,
                        size: Size.big)
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
