import 'package:expense_management/models/transaction.dart';
import 'package:expense_management/widgets/new_transaction.dart';
import 'package:expense_management/widgets/transaction_list.dart';
import 'package:expense_management/widgets/user_transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  late String _titleInput;
  late String _amountInput;

  MyHomePage({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Expense Management')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          SizedBox(
            width: double.infinity,
            child: Card(
              elevation: 5,
              child: Text('CHART!'),
            ),
          ),
          UserTransactions()
        ],
      ),
    );
  }
}
