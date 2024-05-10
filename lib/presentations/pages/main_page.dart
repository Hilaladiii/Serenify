import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:serenify/bloc/auth/auth_bloc.dart';
import 'package:serenify/presentations/pages/aware/aware_page.dart';
import 'package:serenify/presentations/pages/community/community_page.dart';
import 'package:serenify/presentations/pages/profile/profile_page.dart';
import 'package:serenify/styles/my_colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _curIndex = 1;
  late String token;

  late List<Widget> pages;

  void _updateSelected(int index) {
    setState(() {
      _curIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    token = (context.read<AuthBloc>().state as LoginFetchSuccess).token;
  }

  @override
  Widget build(BuildContext context) {
    pages = [
      const CommunityPage(),
      AwarePage(token: token),
      ProfilePage(token: token)
    ];
    return Scaffold(
      body: pages[_curIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _curIndex,
        onTap: _updateSelected,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: MyColors.tertiary400,
        unselectedItemColor: MyColors.gray300,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/svgs/community.svg',
                  color:
                      _curIndex == 0 ? MyColors.tertiary400 : MyColors.gray300),
              label: "Komunitas"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/svgs/checkme.svg',
                  color:
                      _curIndex == 1 ? MyColors.tertiary400 : MyColors.gray300),
              label: "Cek Saya"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/svgs/profile.svg',
                  color:
                      _curIndex == 2 ? MyColors.tertiary400 : MyColors.gray300),
              label: "Saya"),
        ],
      ),
    );
  }
}
