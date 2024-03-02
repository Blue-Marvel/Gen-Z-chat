import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen_z_chat/presentation/view/screens/pages/dashboard_screen.dart';
import 'package:gen_z_chat/presentation/view/utils/colors.dart';

class HomeMenu extends StatefulWidget {
  const HomeMenu({super.key});

  static const routeName = '/home-menu';

  @override
  State<HomeMenu> createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  int _currentIndex = 0;

  List<Widget> screens = [
    const Dashboard(),
    Container(),
    Container(),
    Container(),
    Container(),
  ];

  void handleClick(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: screens[_currentIndex],
        bottomNavigationBar: CrystalNavigationBar(
          currentIndex: _currentIndex,
          paddingR: EdgeInsets.only(bottom: 6.h),
          marginR: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
          unselectedItemColor: Colors.white70,
          selectedItemColor: AppColor.textColor,
          backgroundColor: AppColor.textColor.withOpacity(0.4),
          onTap: handleClick,
          items: [
            CrystalNavigationBarItem(
              icon: IconlyBold.home,
              unselectedIcon: IconlyLight.home,
            ),

            /// Favourite
            CrystalNavigationBarItem(
              icon: IconlyBold.chat,
              unselectedIcon: IconlyLight.chat,
            ),

            /// Add
            CrystalNavigationBarItem(
              icon: IconlyBold.plus,
              unselectedIcon: IconlyLight.plus,
            ),

            /// Search
            CrystalNavigationBarItem(
              icon: IconlyBold.search,
              unselectedIcon: IconlyLight.search,
            ),

            /// Profile
            CrystalNavigationBarItem(
              icon: IconlyBold.profile,
              unselectedIcon: IconlyLight.profile,
            ),
          ],
        ));
  }
}
