import 'package:flutter/material.dart';
import 'package:flutter_money_management_app/db/category/category_db.dart';
import 'package:flutter_money_management_app/models/category/category_model.dart';
import 'package:flutter_money_management_app/models/transaction/transaction_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

const TRANSACTION_DB_NAME = 'transaction-db';

abstract class TransactionDbFunctions {
  Future<void> addTransaction(TransactionModel obj);
  Future<List<TransactionModel>> getAllTransactions();
  Future<void> deleteTransaction(String id);
}

class TransactionDB implements TransactionDbFunctions {
  TransactionDB._internal();

  static TransactionDB instance = TransactionDB._internal();

  factory TransactionDB() {
    return instance;
  }

  ValueNotifier<List<TransactionModel>> transactionListNotifier =
      ValueNotifier([]);

  @override
  Future<void> addTransaction(TransactionModel obj) async {
    final _db = await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
    await _db.put(obj.id, obj);
  }

  @override
  Future<List<TransactionModel>> getAllTransactions() async {
    final _transcationDB =
        await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);

    return _transcationDB.values.toList();
  }

  Future<void> refresh() async {
    final _list = await getAllTransactions();
    _list.sort((first, second) => second.date.compareTo(first.date));
    transactionListNotifier.value.clear();
    transactionListNotifier.value.addAll(_list);
    transactionListNotifier.notifyListeners();
  }

  @override
  Future<void> deleteTransaction(String transactionID) async {
    final _transcationDB =
        await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
    await _transcationDB.delete(transactionID);
    refresh();
  }
}
