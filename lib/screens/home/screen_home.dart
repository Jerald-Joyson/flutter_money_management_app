import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_money_management_app/db/category/category_db.dart';
import 'package:flutter_money_management_app/models/category/category_model.dart';
import 'package:flutter_money_management_app/screens/category/category_add_popup.dart';
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

            showCategoryAddPopup(context);
            // final _sample = CategoryModel(
            //   id: DateTime.now().millisecondsSinceEpoch.toString(),
            //   name: 'Travel',
            //   type: CategoryType.expense,
            // );
            // CategoryDB().insertCategory(_sample);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
