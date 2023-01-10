import 'package:another_flushbar/flushbar.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flag/flag.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spring_button/spring_button.dart';

import 'date_of_birth.dart';

class CreateUserPhone extends StatefulWidget {
  final String userName;
  final String email;
  const CreateUserPhone(
      {super.key, required this.userName, required this.email});

  @override
  State<CreateUserPhone> createState() => _CreateUserPhoneState();
}

class _CreateUserPhoneState extends State<CreateUserPhone> {
  String phone = '';

  //Flash Bar
  Flushbar<dynamic> flashBar(
    Color color,
    String title,
    String subtitle,
    Icon icon,
  ) {
    return Flushbar(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 36),
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.FLOATING,
      borderRadius: BorderRadius.circular(8),
      reverseAnimationCurve: Curves.easeInBack,
      forwardAnimationCurve: Curves.elasticOut,
      backgroundGradient: LinearGradient(colors: [
        color,
        color,
      ]),
      isDismissible: true,
      duration: const Duration(seconds: 3),
      icon: icon,
      titleText: Text(
        title,
        style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
            color: Colors.white,
            fontFamily: "Nunito"),
      ),
      messageText: Text(
        subtitle,
        style: const TextStyle(
            fontSize: 15.0, color: Colors.white, fontFamily: "Nunito"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Theme.of(context).buttonColor,
            )),
      ),
      body: Column(
        children: [
          Column(
            children: [
              const Center(
                child: Text(
                  'Sendit Express',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 28),
                child: Text(
                  'Create your account using your \n phone number',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flag.fromCode(
                      FlagsCode.RW,
                      height: 30,
                      width: 30,
                    ),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        onChanged: (val) {
                          setState(() {
                            phone = val;
                          });
                        },
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '07123456789',
                            hintStyle: TextStyle(
                              fontSize: 26,
                              color:
                                  Theme.of(context).buttonColor.withOpacity(.4),
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 28),
            child: SpringButton(
              SpringButtonType.OnlyScale,
              Container(
                height: 55,
                width: MediaQuery.of(context).size.width * .7,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Theme.of(context).primaryColor),
                child: const Center(
                    child: Text(
                  'Continue',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
              ),
              onTap: () {
                if (phone.length < 8) {
                  flashBar(
                      Colors.red,
                      'Phone number',
                      'Check if your phone number is correct.',
                      const Icon(
                        BootstrapIcons.phone,
                        color: Colors.white,
                      )).show(context);
                } else {
                  Navigator.of(context)
                      .push(CupertinoPageRoute(builder: (context) {
                    return CreateUserDOB(
                      userName: widget.userName,
                      email: widget.email,
                      phoneNumber: phone,
                    );
                  }));
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
