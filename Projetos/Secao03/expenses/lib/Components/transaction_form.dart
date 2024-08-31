import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
   TransactionForm({super.key});

  final titleController = TextEditingController();
  final valueController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Titulo',
                    ),
                    controller: titleController,
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Valor (R\$)',
                    ),
                    controller: valueController,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          print(titleController.text);
                          print(valueController.text);
                        },
                        child: const Text(
                          'Nova Transacao',
                          style: TextStyle(color: Colors.purple),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
  }
}