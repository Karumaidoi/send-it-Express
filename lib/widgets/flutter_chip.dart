import 'package:flutter/material.dart';

class FlutterChipWidget extends StatelessWidget {
  final String actionName;
  const FlutterChipWidget({super.key, required this.actionName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: FilterChip(
          padding: const EdgeInsets.all(10),
          label: Text(
            actionName,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          onSelected: (value) {}),
    );
  }
}
