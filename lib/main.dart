import 'package:flutter/material.dart';

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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Expense Management')),
      body: Column(
        children: const [
          SizedBox(
            width: double.infinity,
            child: Card(
              elevation: 5,
              child: Text('CHART!'),
            ),
          ),
          Card(
            child: Text('LIST OF TX'),
          )
        ],
      ),
    );
  }
}
