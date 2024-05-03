import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:serenify/presentations/pages/community/community_page.dart';
import 'package:serenify/presentations/pages/home/home_page.dart';
import 'package:serenify/styles/my_colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _curIndex = 0;

  late List<Widget> pages;

  void _updateSelected(int index) {
    setState(() {
      _curIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    pages = [
      const HomePage(),
      const CommunityPage(),
      const Center(
        child: Text('Postingan'),
      ),
      const Center(
        child: Text('Saya'),
      ),
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
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/svgs/home.svg',
                  color:
                      _curIndex == 0 ? MyColors.tertiary400 : MyColors.gray300),
              label: "Beranda"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/svgs/community.svg',
                  color:
                      _curIndex == 1 ? MyColors.tertiary400 : MyColors.gray300),
              label: "Communtiy"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/svgs/post.svg',
                  color:
                      _curIndex == 2 ? MyColors.tertiary400 : MyColors.gray300),
              label: "Postingan"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/svgs/profile.svg',
                  color:
                      _curIndex == 3 ? MyColors.tertiary400 : MyColors.gray300),
              label: "Saya"),
        ],
      ),
    );
  }
}
