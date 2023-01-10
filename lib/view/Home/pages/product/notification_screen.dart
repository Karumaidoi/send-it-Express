import 'package:flutter/material.dart';
import 'package:sendit/widgets/reports_widget.dart';

class NotifPage extends StatelessWidget {
  const NotifPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Notifications',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Theme.of(context).buttonColor),
        ),
      ),
      body: ListView(
        children: const [
          ReportWidget(
              type: 'In Transit',
              transactionID: '#136564367564',
              amount: 'Parcel In Transit',
              date: '10 December 2023',
              status: 'Transit'),
          ReportWidget(
              type: 'Delivery',
              transactionID: '#76564367564',
              amount: 'Parcel Delivered',
              date: '12 December 2022',
              status: 'Delivered'),
          ReportWidget(
              type: 'Delivery',
              transactionID: '#106564367564',
              amount: 'Parcel Delivered',
              date: '10 December 2022',
              status: 'Delivered'),
        ],
      ),
    );
  }
}
