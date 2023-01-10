import 'package:flutter/material.dart';
import 'package:sendit/widgets/views/expansion_tile_parcel.dart';

import '../flutter_chip.dart';
import '../parcel_delivery_widget.dart';
import '../parcel_ordered.dart';

class AllParcels extends StatelessWidget {
  const AllParcels({super.key});

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
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Delivery',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
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
                  isTileExpanded: false,
                  image: 'assets/nike.jpg',
                ),
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
                  isTileExpanded: false,
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
                SizedBox(
                  height: 20,
                ),
                ParcelOrderedEarlierWidget(),
              ],
            )),
      ],
    );
  }
}

class FlutterChipValueWidget extends StatelessWidget {
  const FlutterChipValueWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: const [
            FlutterChipWidget(
              actionName: 'Delivered',
            ),
            FlutterChipWidget(
              actionName: 'In Transit',
            ),
            FlutterChipWidget(
              actionName: 'Pending',
            ),
            FlutterChipWidget(
              actionName: 'One week',
            ),
          ],
        ),
      ),
    );
  }
}
