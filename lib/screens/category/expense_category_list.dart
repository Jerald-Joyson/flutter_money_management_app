import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class ExpenseCategoryList extends StatelessWidget {
  const ExpenseCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text('Expense Category $index'),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.delete),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 10,
          );
        },
        itemCount: 100);
  }
}
