import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sendit/view/Home/pages/home_page.dart';
import 'package:sendit/view/Home/pages/product/products_page.dart';

import '../parcel_delivery_widget.dart';
import '../parcel_ordered.dart';

class ParcelExpansionTile extends StatelessWidget {
  final String title;
  final String companyName;
  final String status;
  final String orderNum;
  final bool trackingNumDone;
  final bool inTransit;
  final bool outDelivery;
  final bool delivered;
  final String productName;
  final String quantity;
  final String paymentGateway;
  final String amount;
  final bool isTileExpanded;
  final String image;

  const ParcelExpansionTile(
      {super.key,
      required this.title,
      required this.companyName,
      required this.status,
      required this.orderNum,
      required this.trackingNumDone,
      required this.inTransit,
      required this.outDelivery,
      required this.delivered,
      required this.productName,
      required this.quantity,
      required this.paymentGateway,
      required this.amount,
      required this.isTileExpanded,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: ExpansionTile(
        initiallyExpanded: isTileExpanded,
        title: OutDeliveryWidget(
          title: title,
          companyName: companyName,
          orderNum: orderNum,
          status: status,
          delivered: delivered,
          productImage: image,
        ),
        children: [
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
            height: 5,
          ),
          Row(
            children: [
              const Spacer(),
              CupertinoButton(
                  child: const Text(
                    'See more',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        fontFamily: 'Nunito'),
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .push(CupertinoPageRoute(builder: (context) {
                      return ProductParcelPage(
                        trackingNumDone: trackingNumDone,
                        amount: amount,
                        delivered: delivered,
                        image: image,
                        inTransit: inTransit,
                        outDelivery: outDelivery,
                        paymentGateway: paymentGateway,
                        productName: productName,
                        quantity: quantity,
                      );
                    }));
                  })
            ],
          )
        ],
      ),
    );
  }
}
