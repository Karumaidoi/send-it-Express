import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/parcel_delivery_widget.dart';

class ProductParcelPage extends StatelessWidget {
  final bool trackingNumDone;
  final bool inTransit;
  final bool outDelivery;
  final bool delivered;
  final String productName;
  final String quantity;
  final String amount;
  final String paymentGateway;
  final String image;
  const ProductParcelPage(
      {super.key,
      required this.trackingNumDone,
      required this.inTransit,
      required this.outDelivery,
      required this.delivered,
      required this.productName,
      required this.quantity,
      required this.amount,
      required this.paymentGateway,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Theme.of(context).buttonColor,
            )),
        title: const Text(
          'Parcel',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                BootstrapIcons.info_circle,
                color: Theme.of(context).primaryColor,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Order in progres',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Order ID: #7689745564',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Order Date',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'March 15, 23:00hrs',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Dispatch: Kigali, Rwanda #76 104, 17th Main Road',
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(
                  height: 25,
                ),
                ParcelDeliveryStatusWidget(
                  trackingNumDone: trackingNumDone,
                  inTransit: inTransit,
                  outDelivery: outDelivery,
                  delivered: delivered,
                  productName: productName,
                  paymentGateway: paymentGateway,
                  amount: amount,
                  quantity: quantity,
                  image: image,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Destination: Port Ormos, Sumeru #17th main road',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Package Details',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Medium Package   X$quantity',
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.normal),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '$productName and other gadgets',
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.normal),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Receipt Details',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Wednesday, Apr 08, 2022',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      color: Theme.of(context).buttonColor.withOpacity(.6)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: const [
                    Text(
                      'Delivery Charges',
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    ),
                    Spacer(),
                    Text('\$ 12.00',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold))
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    const Text(
                      'Amount Payable',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal),
                    ),
                    const Spacer(),
                    Text('\$ $amount',
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold))
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Download Receipt as PDF',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                CupertinoButton.filled(
                    child: SizedBox(
                      width: 110,
                      height: 20,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(Icons.download_rounded),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            'Download',
                            style: TextStyle(fontFamily: 'Nunito'),
                          ),
                        ],
                      ),
                    ),
                    onPressed: () {
                      var snackdemo = snackBar(
                        'Receipt Downloaded Successfully.',
                        'Dismiss',
                        Theme.of(context).primaryColor,
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackdemo);
                    })
              ],
            ),
          ],
        ),
      ),
    );
  }

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
}
