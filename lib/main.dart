import 'package:finances/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

main() => runApp(FinancesApp());

class FinancesApp extends StatelessWidget {
  const FinancesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomeScreen(),
    );
  }
}

class MyHomeScreen extends StatelessWidget {
  final _transactions = [
    Transaction(id: '1', title: 'Pizza', value: 50, date: DateTime.now()),
    Transaction(id: '2', title: 'Carrefour', value: 120, date: DateTime.now()),
    Transaction(id: '3', title: 'HBO Max', value: 13.95, date: DateTime.now()),
    Transaction(id: '4', title: 'Academia', value: 130, date: DateTime.now()),
  ];

  MyHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Personal Finances"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Card(
              color: Colors.blue,
              child: Text(
                "Gráfico",
                style: TextStyle(color: Colors.white),
              ),
              elevation: 5,
            ),
          ),
          Card(
            child: Text("Lista de transações"),
          )
        ],
      ),
    );
  }
}
