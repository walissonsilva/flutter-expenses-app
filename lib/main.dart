import 'package:finances/components/transaction_user.dart';
import 'package:flutter/material.dart';

main() => runApp(const FinancesApp());

class FinancesApp extends StatelessWidget {
  const FinancesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomeScreen(),
    );
  }
}

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Personal Finances"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Card(
              color: Colors.blue,
              elevation: 5,
              child: Text(
                "Gráfico",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const TransactionUser(),
          ],
        ),
      ),
    );
  }
}
