import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:serenify/styles/my_colors.dart';
import 'package:serenify/styles/my_text.dart';

class CardComments extends StatefulWidget {
  const CardComments(
      {super.key,
      required this.username,
      required this.totalLikes,
      required this.comment});
  final String username;
  final int totalLikes;
  final String comment;

  @override
  State<CardComments> createState() => _CardCommentsState();
}

class _CardCommentsState extends State<CardComments> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 24,
                height: 24,
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: SvgPicture.asset(
                  'assets/svgs/people.svg',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              Text(widget.username,
                  style: MyTextStyle.h8reg(color: Colors.black)),
              const SizedBox(
                width: 4,
              ),
              Text('5 jam', style: MyTextStyle.h8reg(color: MyColors.gray300)),
              const Expanded(child: SizedBox()),
              SvgPicture.asset('assets/svgs/dot.svg')
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.comment,
              style: MyTextStyle.h8reg(color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/svgs/like.svg'),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        widget.totalLikes.toString(),
                        style: MyTextStyle.h8reg(color: Colors.black),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset('assets/svgs/comment.svg')),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        "0",
                        style: MyTextStyle.h8reg(color: Colors.black),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/svgs/save.svg'),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        '2',
                        style: MyTextStyle.h8reg(color: Colors.black),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/svgs/share.svg'),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        '2',
                        style: MyTextStyle.h8reg(color: Colors.black),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
