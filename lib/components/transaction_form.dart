import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String title, double value) onSubmitTransaction;

  TransactionForm({super.key, required this.onSubmitTransaction});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  _handleSubmitForm(BuildContext context) {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0;

    if (title.isEmpty || value <= 0) {
      showDialog(
          context: context,
          builder: (builder) {
            return const AlertDialog(
                title: Text('Dados inválidos'),
                content:
                    Text('Verifique os dados preenchidos e tente novamente.'));
          });
      return;
    }

    widget.onSubmitTransaction(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: <Widget>[
          TextField(
            controller: titleController,
            decoration: const InputDecoration(
              labelText: 'Título',
            ),
          ),
          TextField(
            controller: valueController,
            keyboardType: TextInputType.numberWithOptions(
              decimal: true,
            ),
            decoration: const InputDecoration(
              labelText: 'Valor (R\$)',
            ),
            onSubmitted: (_) {
              _handleSubmitForm(context);
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {
                    _handleSubmitForm(context);
                  },
                  child: const Text(
                    'Nova Despesa',
                    style: TextStyle(color: Colors.blue),
                  )),
            ],
          )
        ]),
      ),
    );
  }
}
