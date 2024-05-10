import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:serenify/bloc/auth/auth_bloc.dart';
import 'package:serenify/bloc/community/community_bloc.dart';
import 'package:serenify/bloc/user/user_bloc.dart';
import 'package:serenify/presentations/widgets/button.dart';
import 'package:serenify/presentations/widgets/snackbar.dart';
import 'package:serenify/styles/my_colors.dart';
import 'package:serenify/styles/my_text.dart';

class AddComment extends StatelessWidget {
  const AddComment({super.key, required this.id, required this.onCommentAdded});

  final Function(bool) onCommentAdded;
  final String id;

  @override
  Widget build(BuildContext context) {
    TextEditingController commentController = TextEditingController();
    return Container(
      padding: const EdgeInsets.all(16),
      child: BlocListener<CommunityBloc, CommunityState>(
        listener: (context, state) {
          if (state is CreateCommentSuccess) {
            mySnackBar(context, "Komentar berhasil ditambahkan");
          }
        },
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
                BlocBuilder<UserBloc, UserState>(
                  builder: (context, state) {
                    if (state is GetUserFetchSuccess) {
                      return Text(state.user.name,
                          style: MyTextStyle.h8reg(color: Colors.black));
                    } else {
                      return Container();
                    }
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              minLines: 4,
              maxLines: 4,
              decoration: InputDecoration(
                  hintText: 'Tulis komentar anda..',
                  hintStyle: MyTextStyle.h8reg(color: MyColors.gray300),
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  filled: true,
                  fillColor: Colors.white),
              controller: commentController,
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    width: 36,
                    height: 36,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: MyColors.tertiary400),
                    child: SvgPicture.asset(
                      'assets/svgs/uploadImage.svg',
                    )),
                Button(
                    label: 'Post',
                    color: Colors.white,
                    onPressed: () {
                      String token =
                          (context.read<AuthBloc>().state as LoginFetchSuccess)
                              .token;
                      context.read<CommunityBloc>().add(CreateCommentEvent(
                          token: token,
                          comment: commentController.text.trim(),
                          id: id));
                      onCommentAdded(false);
                    },
                    backgroundColor: MyColors.tertiary400,
                    size: Size.small)
              ],
            )
          ],
        ),
      ),
    );
  }
}
