import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:serenify/bloc/community/community_bloc.dart';
import 'package:serenify/models/post_model.dart';
import 'package:serenify/presentations/pages/community/create_post_community.dart';
import 'package:serenify/presentations/widgets/card_post.dart';
import 'package:serenify/presentations/widgets/search_field.dart';
import 'package:serenify/styles/my_colors.dart';
import 'package:serenify/styles/my_text.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  @override
  void initState() {
    super.initState();
    context.read<CommunityBloc>().add(GetAllPostEvent());
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Postingan',
          style: MyTextStyle.h5semi(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            children: [
              SearchField(
                controller: searchController,
              ),
              const SizedBox(
                height: 16,
              ),
              BlocBuilder<CommunityBloc, CommunityState>(
                builder: (context, state) {
                  if (state is GetAllPostSuccess) {
                    List<PostModel> postData = state.post;
                    return Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return CardPost(
                                username: postData[index].username,
                                totalLikes: postData[index].totalLikes,
                                totalComments: postData[index].totalComments,
                                postId: postData[index].id,
                                photoLink: postData[index].photoContent,
                                content: postData[index].content);
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 12,
                            );
                          },
                          itemCount: postData.length),
                    );
                  }
                  if (state is GetAllPostFetchFailure) {
                    return Text(state.error);
                  } else {
                    return Text('Loading...');
                  }
                },
              ),
            ],
          )),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const CreatePostCommuntiy();
          }));
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: MyColors.tertiary400,
        icon: SvgPicture.asset('assets/svgs/add.svg'),
        label: Text('Post', style: MyTextStyle.h5semi(color: Colors.white)),
        foregroundColor: MyColors.tertiary400,
        elevation: 1,
      ),
    );
  }
}
