import 'package:expense_management/widgets/new_transaction.dart';
import 'package:flutter/material.dart';

import 'models/transaction.dart';
import 'widgets/chart.dart';
import 'widgets/transaction_list.dart';

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
      theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.amber,
          // colorScheme:ColorScheme.fromSwtch().copyWith(primary: Colors.purple, secondary: Colors.amber), // something is broken here still
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'OpenSans',
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
                color: Colors.black,
                fontFamily: 'OpenSans',
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          useMaterial3: false),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //     id: 't1', title: 'New Shoes', amount: 69.99, date: DateTime.now()),
    // Transaction(
    //     id: 't2',
    //     title: 'Weekly Groceries',
    //     amount: 16.53,
    //     date: DateTime.now())
  ];

  List<Transaction> get _recentTransactions {
    return _userTransactions
        .where((tx) =>
            tx.date.isAfter(DateTime.now().subtract(const Duration(days: 7))))
        .toList();
  }

  void _addNewTransaction(String title, double amount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now());

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bCtx) {
          return NewTransaction(_addNewTransaction);

          // // old method to fix an issue
          // return GestureDetector(
          //   onTap: () {},
          //   behavior: HitTestBehavior.opaque,
          //   child: NewTransaction(_addNewTransaction),
          // );
        });
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Expenses'),
        actions: [
          IconButton(
              onPressed: () => _startAddNewTransaction(context),
              icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Chart(_recentTransactions),
          TransactionList(_userTransactions)
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTransaction(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
