import 'package:flutter/material.dart';

import 'delivery_widget.dart';

class ParcelOrderedEarlierWidget extends StatelessWidget {
  const ParcelOrderedEarlierWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        DeliveryWidget(
          days: '2',
          location: '1390 Market St Unit 110 \n Nyarutarama, Kigali, RW',
          trackNumber: '#862URW',
        ),
        DeliveryWidget(
          days: '5',
          location: '1310 Market St Unit 110 \n Nyarutarama, Kigali, RW',
          trackNumber: '#1099URW',
        ),
      ],
    );
  }
}
