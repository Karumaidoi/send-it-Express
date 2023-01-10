import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/i18n/date_picker_i18n.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sendit/view/Auth/verify_otp.dart';
import 'package:spring_button/spring_button.dart';

import '../../Home/MainHome.dart';

class CreateUserDOB extends StatefulWidget {
  final String userName;
  final String email;
  final String phoneNumber;
  const CreateUserDOB({
    super.key,
    required this.userName,
    required this.email,
    required this.phoneNumber,
  });

  @override
  State<CreateUserDOB> createState() => _CreateUserDOBState();
}

class _CreateUserDOBState extends State<CreateUserDOB> {
  String dob = '';

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
            fontFamily: "Gordita"),
      ),
      messageText: Text(
        subtitle,
        style: const TextStyle(
            fontSize: 15.0, color: Colors.white, fontFamily: "Gordita"),
      ),
    );
  }

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: Text(
                    '${widget.userName.split(' ')[0]}, what\'s your birthday? \n You must be 18+ years of Age.',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.4,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () async {
                    var date = await DatePicker.showSimpleDatePicker(
                      context,
                      backgroundColor: Theme.of(context).cardColor,
                      confirmText: 'Ok',
                      textColor: Theme.of(context).buttonColor,
                      itemTextStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                      initialDate: DateTime(2022),
                      firstDate: DateTime(1960),
                      lastDate: DateTime(2022, 8),
                      dateFormat: "dd-MMMM-yyyy",
                      locale: DateTimePickerLocale.en_us,
                      looping: true,
                    );
                    setState(() {
                      dob = date == null ? '' : date.toString().split(" ")[0];
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                      dob == '' ? 'YYYY MM DD' : dob,
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: dob == ''
                              ? Theme.of(context).buttonColor.withOpacity(.3)
                              : Theme.of(context).buttonColor),
                    ),
                  ),
                )
              ],
            ),
            const Spacer(),
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  child: Text(
                    'By tapping "Finish", you agree to our Privacy Policy and Terms of Service',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 15, height: 1.6, wordSpacing: 1.4),
                  ),
                ),
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
                        'Finish',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                    ),
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                          CupertinoPageRoute(builder: (context) {
                        return const VerifyOtpToken(
                          userName: '',
                        );
                      }));
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
