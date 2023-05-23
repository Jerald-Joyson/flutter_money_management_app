import 'package:flutter/material.dart';
import 'package:flutter_money_management_app/db/category/category_db.dart';
import 'package:flutter_money_management_app/models/category/category_model.dart';
import 'package:flutter_money_management_app/models/transaction/transaction_model.dart';
import 'package:flutter_money_management_app/screens/add_transaction/screen_add_transaction.dart';
import 'package:flutter_money_management_app/screens/home/screen_home.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  final obj1 = CategoryDB();
  final obj2 = CategoryDB();
  // print('objects Comparing');
  // print(obj1 == obj2);

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CategoryModelAdapter());
  Hive.registerAdapter(CategoryTypeAdapter());
  Hive.registerAdapter(TransactionModelAdapter());

  // if (Hive.isAdapterRegistered(CategoryModelAdapter().typeId)) {
  //   Hive.registerAdapter(CategoryModelAdapter());
  // }
  // if (Hive.isAdapterRegistered(CategoryTypeAdapter().typeId)) {
  //   Hive.registerAdapter(CategoryTypeAdapter());
  // }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: ScreenHome(),
      routes: {
        ScreenAddTransaction.routeName: (ctx) => const ScreenAddTransaction(),
      },
    );
  }
}
