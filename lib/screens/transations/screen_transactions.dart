import 'package:flutter/material.dart';

class ScreenTransactions extends StatelessWidget {
  const ScreenTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.all(10),
        itemBuilder: (context, index) {
          return const Card(
            elevation: 0,
            child: ListTile(
              leading: CircleAvatar(
                  radius: 50,
                  child: Text(
                    '12\n dec',
                    textAlign: TextAlign.center,
                  )),
              title: Text('1000000'),
              subtitle: Text('Travel'),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 10,
          );
        },
        itemCount: 10);
  }
}
