import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:serenify/presentations/pages/community/list_comment_community.dart';
import 'package:serenify/styles/my_colors.dart';
import 'package:serenify/styles/my_text.dart';

class CardPost extends StatefulWidget {
  const CardPost(
      {super.key,
      required this.username,
      required this.totalLikes,
      required this.totalComments,
      required this.postId,
      required this.content,
      required this.photoLink});
  final String username;
  final int totalLikes;
  final String content;
  final int totalComments;
  final String postId;
  final String? photoLink;

  @override
  State<CardPost> createState() => _CardPostState();
}

class _CardPostState extends State<CardPost> {
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
              widget.content,
              style: MyTextStyle.h8reg(color: Colors.black),
            ),
          ),
          widget.photoLink != ""
              ? Image.network(
                  "https://${widget.photoLink!.substring(8, widget.photoLink!.length)}")
              : Container(),
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
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ListCommentCommunity(
                                postId: widget.postId,
                              );
                            }));
                          },
                          child: SvgPicture.asset('assets/svgs/comment.svg')),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        widget.totalComments.toString(),
                        style: MyTextStyle.h8reg(color: Colors.black),
                      )
                    ],
                  ),
                ),
                SvgPicture.asset('assets/svgs/save.svg'),
                SvgPicture.asset('assets/svgs/share.svg'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
