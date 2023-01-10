// ignore_for_file: unrelated_type_equality_checks

import 'dart:async';
import 'package:bootstrap_icons/bootstrap_icons.dart';

import 'package:flutter/material.dart';
import 'package:sendit/view/Into/on_borading_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Home/MainHome.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String token = '';
  @override
  void initState() {
    tokenRead();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  token == '' ? const OnBoardingScreen() : const MainHome()));
    });
    return Scaffold(
      key: const ValueKey("Splash screen"),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 75,
                width: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(120),
                  color: const Color(0xFFEB6440),
                ),
                child: const Center(
                  child: Icon(
                    BootstrapIcons.truck,
                    size: 35,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                '',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  tokenRead() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tokenStored = prefs.getString('token');
    setState(() {
      token = tokenStored!;
    });
  }
}
