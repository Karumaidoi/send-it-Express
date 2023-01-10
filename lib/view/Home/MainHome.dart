// ignore_for_file: unused_import

import 'package:bootstrap_icons/bootstrap_icons.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sendit/view/Home/pages/discover_page.dart';
import 'package:sendit/view/Home/pages/home_page.dart';
import 'package:sendit/view/Home/pages/product/notification_screen.dart';
import 'package:sendit/view/Home/pages/rates.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:badges/badges.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  @override
  void initState() {
    super.initState();
  }

  void onClickedNotification(String? payload) => print("Commuter");

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar:
            CupertinoTabBar(activeColor: Colors.orange.shade700, items: const [
          BottomNavigationBarItem(
              tooltip: 'Delivery',
              icon: Icon(
                BootstrapIcons.box_seam,
                size: 22,
              ),
              label: 'Delivery'),
          BottomNavigationBarItem(
              tooltip: 'Discover',
              icon: Icon(
                BootstrapIcons.compass,
                size: 22,
              ),
              label: 'Discover'),
          BottomNavigationBarItem(
              tooltip: 'Notifications',
              icon: Icon(
                BootstrapIcons.radioactive,
                size: 22,
              ),
              label: 'Rates'),
        ]),
        tabBuilder: ((context, index) {
          switch (index) {
            case 0:
              return const HomePage();
            case 1:
              return const DiscoverPage();
            case 2:
              return const RatesPage();
            default:
              return const HomePage();
          }
        }));
  }
}
