import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';

class ParcelDeliveryStatusWidget extends StatefulWidget {
  final bool trackingNumDone;
  final bool inTransit;
  final bool outDelivery;
  final bool delivered;
  final String productName;
  final String quantity;
  final String amount;
  final String paymentGateway;
  final String image;
  const ParcelDeliveryStatusWidget(
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
  State<ParcelDeliveryStatusWidget> createState() =>
      _ParcelDeliveryStatusWidgetState();
}

class _ParcelDeliveryStatusWidgetState
    extends State<ParcelDeliveryStatusWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Theme.of(context).cardColor,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context).cardColor,
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 43, 43, 43)
                                .withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: widget.image == ''
                          ? Center(
                              child: Text(
                                widget.productName.split('')[0].toUpperCase(),
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .buttonTheme
                                      .colorScheme!
                                      .background
                                      .withOpacity(.4),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                            )
                          : Image(
                              image: AssetImage(widget.image),
                              fit: BoxFit.cover,
                            ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.productName,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Quantity: ${widget.quantity}',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '\$ ${widget.amount}',
                      style: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      widget.paymentGateway,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Theme.of(context).cardColor,
            ),
            child: Column(
              children: [
                CustomStepperWidget(
                  isDone: widget.trackingNumDone,
                  isLast: false,
                  title: 'Tracking Number Created',
                  status: 'Kigali, RW. December 20. 9:17am',
                ),
                CustomStepperWidget(
                  isDone: widget.inTransit,
                  isLast: false,
                  status: 'Kampala, UG. December 22. 7:23pm',
                  title: 'In Transit',
                ),
                CustomStepperWidget(
                  isDone: widget.outDelivery,
                  isLast: false,
                  status: 'Courier: Carole Chimaku',
                  title: 'Out of Delivery',
                ),
                CustomStepperWidget(
                  isDone: widget.delivered,
                  isLast: true,
                  status: 'Courier: Carole Chimaku',
                  title: 'Delivered',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomStepperWidget extends StatelessWidget {
  final bool isDone;
  final String title;
  final String status;
  final bool isLast;
  const CustomStepperWidget({
    Key? key,
    required this.isDone,
    required this.title,
    required this.status,
    required this.isLast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 10 : 35),
      child: Row(
        children: [
          Icon(
            isDone == true
                ? BootstrapIcons.check2_circle
                : BootstrapIcons.circle,
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: isLast ? 0 : 5,
              ),
              isLast ? const SizedBox() : Text(status)
            ],
          )
        ],
      ),
    );
  }
}
