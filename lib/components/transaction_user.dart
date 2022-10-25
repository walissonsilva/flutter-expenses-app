import 'dart:math';

import 'package:finances/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'transaction_form.dart';
import 'transaction_list.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({super.key});

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
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
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionList(transactions: _transactions),
        TransactionForm(onSubmitTransaction: _addTransaction),
      ],
    );
  }
}
