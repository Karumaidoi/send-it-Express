import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sendit/widgets/views/all_parcels.dart';
import 'package:sendit/widgets/views/expansion_tile_parcel.dart';

import '../../view/Home/pages/home_page.dart';
import '../parcel_delivery_widget.dart';

class FromUserParcels extends StatelessWidget {
  const FromUserParcels({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Flexible(flex: 3, child: FlutterChipValueWidget()),
          const SizedBox(
            height: 10,
          ),
          Flexible(
            flex: 12,
            child: ListView(
              children: const [
                ParcelExpansionTile(
                  title: 'Nike Sport Store',
                  companyName: 'xenderitrwanda.com',
                  orderNum: '#762189564',
                  status: 'In Transit',
                  trackingNumDone: true,
                  inTransit: true,
                  outDelivery: false,
                  delivered: false,
                  amount: '65.00',
                  paymentGateway: 'MTN Rwanda',
                  productName: 'Nike SB BLZR Cort',
                  quantity: '1',
                  isTileExpanded: true,
                  image: 'assets/nike.jpg',
                ),
                ParcelExpansionTile(
                  title: 'Redmi 9A',
                  companyName: 'xenderitrwanda.com',
                  orderNum: '#662189465',
                  status: 'Delivered',
                  trackingNumDone: true,
                  inTransit: true,
                  outDelivery: true,
                  delivered: true,
                  amount: '110.00',
                  paymentGateway: 'Paypal',
                  productName: 'Redmi 9A - HongKong, China',
                  quantity: '1',
                  isTileExpanded: false,
                  image: '',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
