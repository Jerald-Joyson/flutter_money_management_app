import 'package:flutter/material.dart';
import 'package:flutter_money_management_app/screens/category/screen_category.dart';
import 'package:flutter_money_management_app/screens/home/widgets/bottom_navigation.dart';
import 'package:flutter_money_management_app/screens/transations/screen_transactions.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});

  static ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);

  final _pages = [
    ScreenTransactions(),
    ScreenCategory(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('MONEY MANAGER'),
        centerTitle: true,
      ),
      bottomNavigationBar: const MoneyManagerBottomNavigation(),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: selectedIndexNotifier,
          builder: (BuildContext context, int updatedIndex, _) {
            return _pages[updatedIndex];
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (selectedIndexNotifier.value == 0) {
            print("Add Transcations");
          } else {
            print("Add Category");
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
