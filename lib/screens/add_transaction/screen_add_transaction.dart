import 'package:flutter/material.dart';

class ScreenAddTransaction extends StatelessWidget {
  static const routeName = 'add-transaction';
  const ScreenAddTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Text('Add transactions')),
    );
  }
}
