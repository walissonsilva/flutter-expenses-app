import 'package:finances/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

main() => runApp(const FinancesApp());

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
          const Card(
            color: Colors.blue,
            elevation: 5,
            child: Text(
              "Gráfico",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Column(
            children: _transactions
                .map((transaction) => Card(
                        child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: Colors.purple,
                            width: 2,
                          )),
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "R\$ ${transaction.value.toStringAsFixed(2)}",
                            style: const TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              transaction.title,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text(
                              DateFormat("d MMM y").format(transaction.date),
                              style: TextStyle(color: Colors.grey[600]),
                            )
                          ],
                        )
                      ],
                    )))
                .toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () => showDialog(
                        context: context,
                        builder: (context) => const AlertDialog(
                            title: Text("Ops!"), content: Text("Em breve...")),
                      ),
                  child: const Text("NOVA DESPESA")),
            ],
          )
        ],
      ),
    );
  }
}
