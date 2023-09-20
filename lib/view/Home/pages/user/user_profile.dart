import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:launch_review/launch_review.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../provider/dark_theme_provider.dart';
import '../../../splash_screen.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({
    super.key,
  });

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String accountNumber = '';
  String userToken = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context)
                .buttonTheme
                .colorScheme!
                .background
                .withOpacity(.4),
          ),
        ),
        title: Text(
          'Settings',
          style: TextStyle(
              fontSize: 15,
              color: Theme.of(context)
                  .buttonTheme
                  .colorScheme!
                  .background
                  .withOpacity(.4)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 0.0, left: 18, right: 18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Card(
              color: Theme.of(context).cardColor,
              shadowColor: Colors.black.withOpacity(.1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 8,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          height: 65,
                          width: 65,
                          decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .buttonTheme
                                  .colorScheme!
                                  .background
                                  .withOpacity(.4),
                              borderRadius: BorderRadius.circular(18)),
                          child: Center(
                            child: Text(
                              'M',
                              style: TextStyle(
                                color: Theme.of(context).backgroundColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'mainahmwangi12@gmail.com',
                              style: TextStyle(
                                fontSize: 13,
                                color: Theme.of(context)
                                    .buttonTheme
                                    .colorScheme!
                                    .background
                                    .withOpacity(.4),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
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
                        const Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(BootstrapIcons.pencil_square))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(Icons.location_city_rounded),
                            const SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Current Location',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context)
                                          .buttonTheme
                                          .colorScheme!
                                          .background
                                          .withOpacity(.4)),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Text('Port Ormos, Sumeru',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .buttonTheme
                                            .colorScheme!
                                            .background
                                            .withOpacity(.4)))
                              ],
                            ),
                            const Spacer(),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Card(
              color: Theme.of(context).cardColor,
              shadowColor: Colors.black.withOpacity(.1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 8,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                      BootstrapIcons.moon,
                      color: Theme.of(context).primaryColor,
                    ),
                    title: Text(
                      'Theme',
                      style: TextStyle(
                        color: Theme.of(context)
                            .buttonTheme
                            .colorScheme!
                            .background
                            .withOpacity(.4),
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    subtitle: Text(
                      'Toggle to change theme',
                      style: TextStyle(
                          color: Theme.of(context)
                              .buttonTheme
                              .colorScheme!
                              .background
                              .withOpacity(.4)),
                    ),
                    trailing: CupertinoSwitch(
                        value: themeChange.darkTheme,
                        onChanged: (val) {
                          setState(() {
                            themeChange.darkTheme = val;
                          });
                        }),
                  ),
                  ListTile(
                    onTap: () {
                      LaunchReview.launch(androidAppId: '');
                    },
                    leading: Icon(
                      BootstrapIcons.pencil_square,
                      color: Theme.of(context).primaryColor,
                    ),
                    title: Text(
                      'Rate & Review us',
                      style: TextStyle(
                        color: Theme.of(context)
                            .buttonTheme
                            .colorScheme!
                            .background
                            .withOpacity(.4),
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    subtitle: Text(
                      'Give us your feedback',
                      style: TextStyle(
                          color: Theme.of(context)
                              .buttonTheme
                              .colorScheme!
                              .background
                              .withOpacity(.4)),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return CupertinoAlertDialog(
                              title: const Text(
                                "SendIt Rwanda v 2.0.1 Dolphin",
                                style: TextStyle(
                                    fontSize: 14, fontFamily: "Nunito"),
                              ),
                              content: const Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Text(
                                  "Thanks to our Designers, Developers and you, our Customer who helped in developing this product.",
                                  style: TextStyle(fontFamily: "Nunito"),
                                ),
                              ),
                              actions: [
                                CupertinoButton(
                                    child: const Text(
                                      "Got it",
                                      style: TextStyle(fontFamily: "Nunito"),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    })
                              ],
                            );
                          });
                    },
                    leading: Icon(
                      BootstrapIcons.info_circle,
                      color: Theme.of(context).primaryColor,
                    ),
                    title: Text(
                      'About',
                      style: TextStyle(
                        color: Theme.of(context)
                            .buttonTheme
                            .colorScheme!
                            .background
                            .withOpacity(.4),
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    subtitle: Text(
                      'V 2.0.1 Dolphin',
                      style: TextStyle(
                          color: Theme.of(context)
                              .buttonTheme
                              .colorScheme!
                              .background
                              .withOpacity(.4),
                          fontFamily: "Nunito"),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return CupertinoAlertDialog(
                              title: const Text(
                                'Log out from SendIt',
                                style: TextStyle(fontFamily: 'Nunito'),
                              ),
                              content: const Text(
                                'You can always log in back.',
                                style: TextStyle(fontFamily: 'Nunito'),
                              ),
                              actions: [
                                CupertinoButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text(
                                      'Cancel',
                                      style: TextStyle(fontFamily: 'Nunito'),
                                    )),
                                CupertinoButton(
                                    onPressed: () async {
                                      final pref =
                                          await SharedPreferences.getInstance();
                                      await pref.clear();
                                      Navigator.of(context)
                                          .popUntil((route) => route.isFirst);
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(builder: (context) {
                                        return const SplashScreen();
                                      }));
                                    },
                                    child: const Text(
                                      'Ok',
                                      style: TextStyle(fontFamily: 'Nunito'),
                                    )),
                              ],
                            );
                          });
                    },
                    leading: Icon(
                      BootstrapIcons.box_arrow_right,
                      color: Theme.of(context).primaryColor,
                    ),
                    title: Text(
                      'Log Out',
                      style: TextStyle(
                        color: Theme.of(context)
                            .buttonTheme
                            .colorScheme!
                            .background
                            .withOpacity(.4),
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    subtitle: Text(
                      'Log out from the app',
                      style: TextStyle(
                          color: Theme.of(context)
                              .buttonTheme
                              .colorScheme!
                              .background
                              .withOpacity(.4)),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox()
          ],
        ),
      ),
    );
  }
}
