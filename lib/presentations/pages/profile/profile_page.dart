import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:serenify/bloc/user/user_bloc.dart';
import 'package:serenify/presentations/pages/profile/widgets/button_profile.dart';
import 'package:serenify/styles/my_colors.dart';
import 'package:serenify/styles/my_text.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.token});
  final String token;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(GetUserEvent(token: widget.token));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 50),
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height / 4,
                  decoration: BoxDecoration(color: MyColors.tertiary400),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: 114,
                    height: 114,
                    padding: const EdgeInsets.all(1),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: BlocBuilder<UserBloc, UserState>(
                        builder: (context, state) {
                          if (state is GetUserFetchSuccess) {
                            if (state.user.photoLink != "") {
                              return Image.asset(
                                'assets/images/myprofile.png',
                                fit: BoxFit.contain,
                              );
                            } else {
                              return SvgPicture.asset(
                                'assets/svgs/people.svg',
                                width: 38,
                                height: 38,
                                fit: BoxFit.contain,
                              );
                            }
                          } else {
                            return SvgPicture.asset(
                              'assets/svgs/people.svg',
                              width: 38,
                              height: 38,
                              fit: BoxFit.contain,
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is GetUserFetchSuccess) {
                var user = state.user;
                return Text(
                  user.name,
                  style: MyTextStyle.h4semi(color: Colors.black),
                );
              } else {
                return Container();
              }
            },
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: MyColors.gray100,
              borderRadius: BorderRadius.circular(20),
            ),
            child: BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state is GetUserFetchSuccess) {
                  var email = state.user.email;
                  return Text(
                    email,
                    style: MyTextStyle.h8reg(color: Colors.black),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
          ButtonProfile(
            icon: 'edit',
            label: "Edit Profile",
            onpressed: () {},
          ),
          ButtonProfile(
            icon: 'changePass',
            label: "Ubah Kata Sandi",
            onpressed: () {},
          ),
          ButtonProfile(
            icon: 'service',
            label: "Pusat Bantuan",
            onpressed: () {},
          ),
          ButtonProfile(
            icon: 'logout',
            label: "Keluar",
            onpressed: () {},
          ),
        ],
      ),
    );
  }
}
