import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sendit/view/Home/pages/user/user_profile.dart';
import 'package:sendit/widgets/views/all_parcels.dart';
import 'package:sendit/widgets/views/from_me_parcel.dart';
import 'package:sendit/widgets/views/to_me_parcels.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: const HeaderInfoWidget(),
          leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          centerTitle: false,
          bottom: const TabBar(
              isScrollable: false,
              physics: BouncingScrollPhysics(),
              labelColor: Color(0xFFEB6440),
              labelPadding: EdgeInsets.only(bottom: 12, right: 8, left: 8),
              unselectedLabelColor: Color.fromARGB(185, 235, 101, 64),
              indicatorColor: Color(0xFFEB6440),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 4.0,
              labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Nunito',
                  fontSize: 16),
              tabs: [Text('All'), Text('To me'), Text('From me')]),
        ),
        body: const TabBarView(
            children: [AllParcels(), ToUserParcels(), FromUserParcels()]),
      ),
    );
  }
}

class OutDeliveryWidget extends StatelessWidget {
  final String title;
  final String companyName;
  final String status;
  final String orderNum;
  final bool delivered;
  final String productImage;

  const OutDeliveryWidget({
    Key? key,
    required this.title,
    required this.companyName,
    required this.status,
    required this.orderNum,
    required this.delivered,
    required this.productImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Theme.of(context).primaryColor,
                    backgroundImage: productImage == ''
                        ? null
                        : const AssetImage('assets/nike shop.jpg'),
                    child: productImage == ''
                        ? Center(
                            child: Text(
                            title.split('')[0].toUpperCase(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ))
                        : const SizedBox(),
                  ),
                  Positioned(
                      bottom: -1,
                      right: -5,
                      child: CircleAvatar(
                        radius: 13,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 12,
                          backgroundColor:
                              const Color.fromARGB(255, 3, 101, 180),
                          child: Icon(
                            delivered == true
                                ? CupertinoIcons.check_mark_circled_solid
                                : BootstrapIcons.car_front,
                            size: 14,
                            color: Colors.white,
                          ),
                        ),
                      ))
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    companyName,
                    style: const TextStyle(
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    status,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 62, 156, 232),
                    ),
                  ),
                ],
              )
            ],
          ),
          const Spacer(),
          Column(
            children: [
              Text(
                orderNum,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Order Number',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 13,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class HeaderInfoWidget extends StatelessWidget {
  const HeaderInfoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Current Location',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).buttonColor),
              ),
              const SizedBox(
                height: 6,
              ),
              Text('Port Ormos, Sumeru',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).buttonColor))
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class UserAccountWidget extends StatelessWidget {
  const UserAccountWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.transparent,
      ),
      child: Center(
        child: Icon(
          CupertinoIcons.gear,
          color: Theme.of(context).buttonColor,
        ),
      ),
    );
  }
}
