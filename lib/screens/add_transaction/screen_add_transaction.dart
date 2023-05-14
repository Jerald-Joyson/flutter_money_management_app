import 'package:flutter/material.dart';
import 'package:flutter_money_management_app/db/category/category_db.dart';
import 'package:flutter_money_management_app/models/category/category_model.dart';

class ScreenAddTransaction extends StatefulWidget {
  static const routeName = 'add-transaction';
  const ScreenAddTransaction({super.key});

  @override
  State<ScreenAddTransaction> createState() => _ScreenAddTransactionState();
}

class _ScreenAddTransactionState extends State<ScreenAddTransaction> {
  DateTime? _selectedDate;
  CategoryType? _selectedCategoryType;
  CategoryModel? _selectedCategoryModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //purpose
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(hintText: 'Purpose'),
              ),
              //amount
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: 'Amount'),
              ),
              //calender

              TextButton.icon(
                onPressed: () async {
                  final _selectedDateTemp = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now().subtract(
                      Duration(days: 30),
                    ),
                    lastDate: DateTime.now(),
                  );
                  if (_selectedDateTemp == null) {
                    return;
                  } else {
                    print(_selectedDateTemp.toString());
                    setState(() {
                      _selectedDate = _selectedDateTemp;
                    });
                  }
                },
                icon: Icon(Icons.calendar_today),
                label: Text(_selectedDate == null
                    ? 'select Date'
                    : _selectedDate!.toString()),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(children: [
                    //income
                    Radio(
                      value: CategoryType.income,
                      groupValue: CategoryType.income,
                      onChanged: (newValue) {},
                    ),
                    Text('Income'),
                  ]),
                  Row(
                    children: [
                      //expense
                      Radio(
                        value: CategoryType.expense,
                        groupValue: CategoryType.income,
                        onChanged: (newValue) {},
                      ),
                      Text('Expense'),
                    ],
                  ),
                ],
              ),
              //category type
              DropdownButton(
                hint: Text('Select Category'),
                items: CategoryDB.instance.expenseCaregoryListListener.value
                    .map((e) {
                  return DropdownMenuItem(
                    value: e.id,
                    child: Text(e.name),
                  );
                }).toList(),
                onChanged: (selectedValue) {
                  print(selectedValue);
                },
              ),
              //Submit
              ElevatedButton(
                onPressed: () {},
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
