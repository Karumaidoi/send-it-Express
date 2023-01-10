import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DeliveryWidget extends StatelessWidget {
  final String days;
  final String trackNumber;
  final String location;
  const DeliveryWidget({
    Key? key,
    required this.days,
    required this.trackNumber,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Also, try using Future in place of void

    SnackBar snackBar(String title, String action, Color color) {
      return SnackBar(
        content: Text(
          title,
          style: const TextStyle(color: Colors.white, fontFamily: "Nunito"),
        ),
        backgroundColor: color,
        elevation: 10,
        behavior: SnackBarBehavior.fixed,
        action: SnackBarAction(
          label: action,
          onPressed: () {},
          textColor: Colors.white,
        ),
      );
    }

    Future<void> customLaunch(command) async {
      if (await canLaunch(command)) {
        await launch(command);
      } else {
        var snackdemo =
            snackBar('Unable to lauch dial.', 'Dismiss', Colors.red);

        ScaffoldMessenger.of(context).showSnackBar(snackdemo);
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$days Days',
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Remaining Time',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Theme.of(context).buttonColor.withOpacity(.5)),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    trackNumber,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Tracking Number',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Theme.of(context).buttonColor.withOpacity(.5)),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Theme.of(context).cardColor,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'DELIVERY ADDRESS',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).buttonColor.withOpacity(.5)),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    SizedBox(
                      height: 60,
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(
                        location,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'CONTACT',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context)
                                  .buttonColor
                                  .withOpacity(.5)),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        GestureDetector(
                          onTap: () async {
                            String command = "tel://0702 199729";

                            await customLaunch(command);
                          },
                          child: Container(
                            height: 45,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Theme.of(context).primaryColor,
                            ),
                            child: const Center(
                                child: Text(
                              'Call',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            )),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'SHIPPING PARTNER',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context)
                                  .buttonColor
                                  .withOpacity(.5)),
                        ),
                        const Text(
                          'SendIt',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(12),
                          image: const DecorationImage(
                            image: AssetImage('assets/sendit.png'),
                            fit: BoxFit.cover,
                          )),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
