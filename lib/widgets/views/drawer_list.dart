import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {
  final String title;
  final String subtitle;
  final Icon icon;
  final VoidCallback callback;
  const DrawerList(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.icon,
      required this.callback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: callback,
      leading: icon,
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(subtitle),
    );
  }
}
