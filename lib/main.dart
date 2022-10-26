import 'dart:math';

import 'package:finances/components/transaction_form.dart';
import 'package:finances/components/transaction_list.dart';
import 'package:finances/components/transaction_user.dart';
import 'package:finances/models/transaction.dart';
import 'package:flutter/material.dart';

main() => runApp(const FinancesApp());

class FinancesApp extends StatelessWidget {
  const FinancesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomeScreen(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
    );
  }
}

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  _openModalTransactionForm(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: ((_) {
        return TransactionForm(onSubmitTransaction: _addTransaction);
      }),
    );
  }

  final _transactions = [
    Transaction(id: '1', title: 'Pizza', value: 50, date: DateTime.now()),
    Transaction(id: '2', title: 'Carrefour', value: 120, date: DateTime.now()),
    Transaction(id: '3', title: 'HBO Max', value: 13.95, date: DateTime.now()),
    Transaction(id: '4', title: 'Academia', value: 130, date: DateTime.now()),
  ];

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Personal Finances"),
        backgroundColor: Colors.deepOrange,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Card(
              color: Colors.deepOrangeAccent,
              elevation: 5,
              child: Text(
                "Gráfico",
                style: TextStyle(color: Colors.white),
              ),
            ),
            TransactionList(transactions: _transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.deepOrangeAccent,
        onPressed: () {
          _openModalTransactionForm(context);
        },
        tooltip: 'Adicionar despesa',
      ),
    );
  }
}
