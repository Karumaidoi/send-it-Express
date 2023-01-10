import 'package:flutter/material.dart';
import 'package:sendit/widgets/views/all_parcels.dart';

import 'expansion_tile_parcel.dart';

class ToUserParcels extends StatelessWidget {
  const ToUserParcels({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        const Flexible(
          flex: 4,
          child: FlutterChipValueWidget(),
        ),
        const SizedBox(
          height: 10,
        ),
        Flexible(
            flex: 18,
            child: ListView(
              children: const [
                ParcelExpansionTile(
                  title: 'Yala Maize Flour',
                  companyName: 'xenderitrwanda.com',
                  orderNum: '#962189564',
                  status: 'Out of Delivery',
                  trackingNumDone: true,
                  inTransit: true,
                  outDelivery: true,
                  delivered: false,
                  amount: '120.50',
                  paymentGateway: 'MTN Rwanda',
                  productName: 'Yala Maize Flour',
                  quantity: '5',
                  isTileExpanded: true,
                  image: '',
                ),
                ParcelExpansionTile(
                  title: 'Von Microwave',
                  companyName: 'xenderitrwanda.com',
                  orderNum: '#1062189564',
                  status: 'Delivered',
                  trackingNumDone: true,
                  inTransit: true,
                  outDelivery: true,
                  delivered: true,
                  amount: '322.80',
                  paymentGateway: 'MTN Rwanda',
                  productName: 'Von Microwave',
                  quantity: '1',
                  isTileExpanded: false,
                  image: '',
                ),
              ],
            ))
      ],
    );
  }
}
