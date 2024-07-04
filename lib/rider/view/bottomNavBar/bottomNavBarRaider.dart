import 'package:flutter/cupertino.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:rider_uber/constant/utils/colors.dart';
import 'package:rider_uber/rider/controller/bottomNavBarRaiderProvider/bottomNavBarRaiderProvider.dart';
import 'package:rider_uber/rider/view/account/accountScreenRaider.dart';
import 'package:rider_uber/rider/view/activity/activityScreen.dart';
import 'package:rider_uber/rider/view/serviceScreen/serviceScreen.dart';
import 'package:sizer/sizer.dart';

import '../homeScreen/riderHomeScreen.dart';

class Bottomnavbarraider extends StatefulWidget {
  const Bottomnavbarraider({super.key});

  @override
  State<Bottomnavbarraider> createState() => _BottomnavbarraiderState();
}

class _BottomnavbarraiderState extends State<Bottomnavbarraider> {
  List<Widget> screens = [
    const Riderhomescreen(),
    const ServicescreenRaider(),
    const ActivityscreenRaider(),
    const Accountscreenraider()
  ];
  List<PersistentBottomNavBarItem> _navBarItems(int currentTab) {
    return [
      PersistentBottomNavBarItem(
          icon: Icon(currentTab == 0
              ? CupertinoIcons.house_fill
              : CupertinoIcons.house),
          title: 'Home',
          activeColorPrimary: black,
          inactiveColorPrimary: grey),
      PersistentBottomNavBarItem(
          icon: Icon(currentTab == 0
              ? CupertinoIcons.circle_grid_3x3_fill
              : CupertinoIcons.circle_grid_3x3),
          title: 'Service',
          activeColorPrimary: black,
          inactiveColorPrimary: grey),
      PersistentBottomNavBarItem(
          icon: Icon(currentTab == 0
              ? CupertinoIcons.square_list_fill
              : CupertinoIcons.square_list),
          title: 'Activity',
          activeColorPrimary: black,
          inactiveColorPrimary: grey),
      PersistentBottomNavBarItem(
          icon: Icon(currentTab == 0
              ? CupertinoIcons.person_fill
              : CupertinoIcons.person),
          title: 'Person',
          activeColorPrimary: black,
          inactiveColorPrimary: grey),
    ];
  }

  PersistentTabController controller =
      new PersistentTabController(initialIndex: 0);
  @override
  Widget build(BuildContext context) {
    return Consumer<Bottomnavbarraiderprovider>(
        builder: (context, tabProvider, child) {
      return PersistentTabView(
        context,
        screens: screens,
        controller: controller,
        items: _navBarItems(tabProvider.currentTab),
        confineInSafeArea: true,
        onItemSelected: (value) {},
        backgroundColor: white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        hideNavigationBarWhenKeyboardShows: true,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(
            8.sp,
          ),
          colorBehindNavBar: white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
            duration: Duration(microseconds: 200), curve: Curves.ease),
        screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(microseconds: 200)),
        navBarStyle: NavBarStyle.style6,
      );
    });
  }
}
