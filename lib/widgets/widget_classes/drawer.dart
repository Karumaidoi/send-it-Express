import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sendit/view/Home/pages/product/notification_screen.dart';

import '../../view/Home/pages/user/user_profile.dart';
import '../views/drawer_list.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(0),
            decoration: const BoxDecoration(),
            child: Container(
              width: double.infinity,
              color: Colors.transparent,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Theme.of(context).primaryColor,
                      child: const Text(
                        'M',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Alex Maina',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'SendIt Account',
                          style: TextStyle(
                            fontSize: 12,
                            color: Theme.of(context)
                                .buttonTheme
                                .colorScheme!
                                .background
                                .withOpacity(.4),
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Icon(
                          BootstrapIcons.patch_check,
                          size: 14,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          DrawerList(
            callback: () {
              Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
                return const NotifPage();
              }));
            },
            icon: const Icon(Icons.notifications_none_rounded),
            title: 'Notifications',
            subtitle: 'Check parcel notifications.',
          ),
          DrawerList(
            callback: () {
              Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
                return const SettingsPage();
              }));
            },
            icon: const Icon(CupertinoIcons.person),
            title: 'Account',
            subtitle: 'Set app & account preferences.',
          ),
        ],
      ),
    );
  }
}
