import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:serenify/bloc/auth/auth_bloc.dart';
import 'package:serenify/bloc/community/community_bloc.dart';
import 'package:serenify/bloc/user/user_bloc.dart';
import 'package:serenify/presentations/pages/community/community_page.dart';
import 'package:serenify/presentations/pages/main_page.dart';
import 'package:serenify/presentations/widgets/button.dart';
import 'package:serenify/presentations/widgets/snackbar.dart';
import 'package:serenify/styles/my_colors.dart';
import 'package:serenify/styles/my_text.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

class CreatePostCommuntiy extends StatefulWidget {
  const CreatePostCommuntiy({super.key});

  @override
  State<CreatePostCommuntiy> createState() => _CreatePostCommuntiyState();
}

class _CreatePostCommuntiyState extends State<CreatePostCommuntiy> {
  late String token;
  @override
  void initState() {
    super.initState();
    setState(() {
      token = (context.read<AuthBloc>().state as LoginFetchSuccess).token;
    });
    context.read<UserBloc>().add(GetUserEvent(token: token));
  }

  TextEditingController contentController = TextEditingController();
  List<PlatformFile> pickedFiles = [];

  Future<void> selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result == null) return;
    setState(() {
      pickedFiles.addAll(result.files);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Buat Postingan Anda",
          style: MyTextStyle.h5semi(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: BlocListener<CommunityBloc, CommunityState>(
          listener: (context, state) {
            if (state is CreatePostFetchSuccess) {
              Navigator.pop(context, MaterialPageRoute(builder: (context) {
                return const CommunityPage();
              }));
            }
            if (state is CreatePostFetchFailure) {
              mySnackBar(context, state.error);
            }
          },
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 25),
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
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                        filled: true,
                        fillColor: Colors.white),
                    controller: contentController,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          selectFile();
                        },
                        child: Container(
                            width: 36,
                            height: 36,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: MyColors.tertiary400),
                            child: SvgPicture.asset(
                              'assets/svgs/uploadImage.svg',
                            )),
                      ),
                      Button(
                          label: 'Post',
                          color: Colors.white,
                          onPressed: () {
                            if (contentController.text != "") {
                              String token = (context.read<AuthBloc>().state
                                      as LoginFetchSuccess)
                                  .token;
                              context.read<CommunityBloc>().add(
                                    CreatePostEvent(
                                        token: token,
                                        photo: pickedFiles.isNotEmpty
                                            ? pickedFiles[0]
                                            : null,
                                        content: contentController.text.trim()),
                                  );
                            }
                          },
                          backgroundColor: MyColors.tertiary400,
                          size: Size.small)
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: pickedFiles.isNotEmpty ? 200 : 0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: pickedFiles.length,
                      itemBuilder: (context, index) {
                        return Image.file(File(pickedFiles[index].path!));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
