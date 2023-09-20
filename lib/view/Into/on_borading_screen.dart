import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:cupertino_onboarding/cupertino_onboarding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sendit/view/Home/pages/home_page.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoOnboarding(
      onPressedOnLastPage: () => Navigator.of(context)
          .pushReplacement(CupertinoPageRoute(builder: (context) {
        return const HomePage();
      })),
      bottomButtonColor: Theme.of(context).primaryColor,
      bottomButtonChild:
          const Text('Get started', style: TextStyle(fontFamily: 'Nunito')),
      pages: [
        // To create What's New page like Calendar or Translator
        // examples in the readme, use `WhatsNewPage` widget:

        // Actual code from the Calendar example:
        WhatsNewPage(
          title: const Text(
            "What's New in SendIt",
            style: TextStyle(fontFamily: 'Nunito'),
          ),
          features: [
            // Feature's type must be `WhatsNewFeature`
            WhatsNewFeature(
              icon: Icon(
                BootstrapIcons.truck,
                color: CupertinoColors.systemOrange.resolveFrom(context),
              ),
              title: const Text('Send anything fast',
                  style: TextStyle(fontFamily: 'Nunito')),
              description: const Padding(
                padding: EdgeInsets.only(top: 8),
                child: Text(
                    'There is no transfer, leading to the destination,real-time monitoring, first compensation guarantee & piece of mind.',
                    style: TextStyle(fontFamily: 'Nunito')),
              ),
            ),
            WhatsNewFeature(
              icon: Icon(
                CupertinoIcons.time,
                color: CupertinoColors.systemOrange.resolveFrom(context),
              ),
              title: const Text('Quickest & Safest delivery',
                  style: TextStyle(fontFamily: 'Nunito')),
              description: const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                    "We guarantee fast and safe transport for your package Live track your shipments in real time..",
                    style: TextStyle(fontFamily: 'Nunito')),
              ),
            ),
            WhatsNewFeature(
              icon: Icon(
                CupertinoIcons.location_circle,
                color: CupertinoColors.systemOrange.resolveFrom(context),
              ),
              title: const Text('Anything anytime anywhere',
                  style: TextStyle(fontFamily: 'Nunito')),
              description: const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                    "Get your parcel delivered anytime of the day at any location by our courier.",
                    style: TextStyle(fontFamily: 'Nunito')),
              ),
            ),
            WhatsNewFeature(
              icon: Icon(
                CupertinoIcons.pin,
                color: CupertinoColors.systemOrange.resolveFrom(context),
              ),
              title: const Text('On demand & runtime location',
                  style: TextStyle(fontFamily: 'Nunito')),
              description: const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                    "Look the shipment of your parcel in realtime, you will be able to see the realtime location of your parcel.",
                    style: TextStyle(fontFamily: 'Nunito')),
              ),
            ),
          ],
        ),

        // To create custom onboarding page, use
        // `CupertinoOnboardingPage` widget:

        // Actual code from the GIF example:

        CupertinoOnboardingPage(
          title: const Text('Great Look in Light and Dark Mode',
              style: TextStyle(fontFamily: 'Nunito')),
          body: Lottie.asset('assets/dark.json'),
        ),
      ],
    );
  }
}
