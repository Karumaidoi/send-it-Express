import 'package:flutter/material.dart';

class RatesPage extends StatelessWidget {
  const RatesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Rates',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Theme.of(context)
                  .buttonTheme
                  .colorScheme!
                  .background
                  .withOpacity(.4)),
        ),
      ),
    );
  }
}
