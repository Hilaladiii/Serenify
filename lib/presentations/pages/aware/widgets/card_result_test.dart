import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:serenify/bloc/user/user_bloc.dart';
import 'package:serenify/presentations/pages/aware/aware_result_page.dart';
import 'package:serenify/presentations/widgets/button.dart';
import 'package:serenify/styles/my_colors.dart';
import 'package:serenify/styles/my_text.dart';

class CardResultTest extends StatefulWidget {
  const CardResultTest({super.key, required this.token});
  final String token;

  @override
  State<CardResultTest> createState() => _CardResultTestState();
}

class _CardResultTestState extends State<CardResultTest> {
  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(GetUserScoreEvent(token: widget.token));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is GetUserScoreFetchSuccess) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            decoration: ShapeDecoration(
              color: MyColors.tertiary400.withOpacity(0.7),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              shadows: const [
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
                Text(
                  "Mental awareness kamu berada pada level ${state.userScore.score < 60 ? "Rendah" : "Tinggi"}",
                  style: MyTextStyle.h4bold(color: Colors.white),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  state.userScore.description,
                  style: MyTextStyle.h8reg(color: Colors.white),
                ),
                const SizedBox(
                  height: 15,
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: Button(
                        label: 'Detail',
                        size: Size.small,
                        color: Colors.white,
                        backgroundColor: Colors.white.withOpacity(0.4),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return AwareResultPage(
                              description: state.userScore.description,
                              score: state.userScore.score,
                            );
                          }));
                        })),
              ],
            ),
          );
        }
        if (state is GetUserScoreFetchLoading) {
          return const Center(
            child: Text('Loading...'),
          );
        }
        if (state is GetUserScoreFetchFailure) {
          return Center(
            child: Text(state.error),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
