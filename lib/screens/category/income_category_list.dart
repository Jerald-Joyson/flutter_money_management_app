import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class IncomeCategoryList extends StatelessWidget {
  const IncomeCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text('Income Category $index'),
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
