import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:serenify/bloc/community/community_bloc.dart';
import 'package:serenify/presentations/pages/community/widgets/add_comment.dart';
import 'package:serenify/presentations/pages/community/widgets/card_comments.dart';
import 'package:serenify/presentations/pages/community/widgets/card_post.dart';
import 'package:serenify/styles/my_colors.dart';
import 'package:serenify/styles/my_text.dart';

class ListCommentCommunity extends StatefulWidget {
  const ListCommentCommunity({super.key, required this.postId});

  final String postId;

  @override
  State<ListCommentCommunity> createState() => _ListCommentCommunityState();
}

class _ListCommentCommunityState extends State<ListCommentCommunity> {
  bool _isComment = false;

  @override
  void initState() {
    super.initState();
    context.read<CommunityBloc>().add(GetPostByIdEvent(id: widget.postId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Forum & Komunitas',
          style: MyTextStyle.h5semi(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            BlocBuilder<CommunityBloc, CommunityState>(
              builder: (context, state) {
                if (state is GetPostByIdSuccess) {
                  var post = state.detailPost;
                  return CardPost(
                    username: post.username,
                    totalLikes: post.totalLikes,
                    content: post.content,
                    totalComments: post.totalLikes,
                    postId: post.id,
                    photoLink: post.photoContent,
                  );
                }
                if (state is GetPostByIdFetchFailure) {
                  return Center(child: Text(state.error));
                } else {
                  return Center(child: Text('Loading...'));
                }
              },
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 1,
                      color: MyColors.gray200,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Komentar',
                    style: MyTextStyle.h9reg(color: MyColors.tertiary400),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      height: 1,
                      color: MyColors.gray200,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 23,
            ),
            BlocBuilder<CommunityBloc, CommunityState>(
              builder: (context, state) {
                if (!_isComment) {
                  if (state is GetPostByIdSuccess) {
                    if (state.detailPost.comments != null &&
                        state.detailPost.comments!.isNotEmpty) {
                      return Expanded(
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              var data = state.detailPost.comments![index];
                              print(data);
                              return CardComments(
                                  username: data['user_name'],
                                  totalLikes: data['total_likes'],
                                  comment: data['comment']);
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                height: 5,
                              );
                            },
                            itemCount: state.detailPost.comments!.length),
                      );
                    } else {
                      return Container(
                        child: Text('tidak ada komentar'),
                      );
                    }
                  } else {
                    return Container();
                  }
                } else {
                  return Container();
                }
              },
            ),
            _isComment
                ? AddComment(
                    id: widget.postId,
                    onCommentAdded: (isCommentAdded) {
                      setState(() {
                        _isComment = isCommentAdded;
                        context
                            .read<CommunityBloc>()
                            .add(GetPostByIdEvent(id: widget.postId));
                      });
                    },
                  )
                : Container()
          ],
        ),
      ),
      floatingActionButton: _isComment
          ? null
          : FloatingActionButton.extended(
              onPressed: () {
                setState(() {
                  _isComment = true;
                });
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              backgroundColor: MyColors.tertiary400,
              icon: SvgPicture.asset('assets/svgs/add.svg'),
              label: Text('Komentar',
                  style: MyTextStyle.h5semi(color: Colors.white)),
              foregroundColor: MyColors.tertiary400,
              elevation: 1,
            ),
    );
  }
}
