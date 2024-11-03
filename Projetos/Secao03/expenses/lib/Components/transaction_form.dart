import 'package:flutter/material.dart';
import 'dart:io';

// ignore: must_be_immutable
class TransactionForm extends StatefulWidget {
  TransactionForm(this.onSubmit, {super.key});

  final void Function(String, double) onSubmit;
  String teste = 'teste';

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  _submitForm() {
    final titleForm = titleController.text;
    final valueForm =
        double.tryParse(valueController.text.replaceAll(",", ".")) ?? 0.0;
    String mensagem = "";
    mensagem += "SO: ${Platform.isIOS ? 'iOS' : 'Android'}";
    mensagem += "Data: ${DateTime.now()}";
    mensagem += ' >> Titulo: "$titleForm"';
    mensagem += " >> Valor: $valueForm";
    mensagem += '>> Antes teste widget=${widget.teste}';
    widget.teste = 'alterado';
    mensagem += ' depois teste widget=${widget.teste}';
    debugPrint(mensagem);
    if (titleForm.isEmpty || valueForm <= 0) {
      print(
          "SO: ${Platform.isIOS ? 'iOS' : 'Android'} >> Despesa nao cadastrada");
      return;
    }
    /**
     * Esse atributo widget nos perminte acessar todos os métodos e propriedades
     * existentes na classe Stateles ou statefull
     */
    widget.onSubmit(titleForm, valueForm);
  }

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
              onSubmitted: (_) =>
                  _submitForm(), //Esse "_" indica que estamos ingnorando o parametro que a funcao esta passando
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Valor (R\$)',
              ),
              controller: valueController,
              keyboardType: const TextInputType.numberWithOptions(
                  decimal: true, signed: true),
              onSubmitted: (_) =>
                  _submitForm(), //Esse "_" indica que estamos ingnorando o parametro que a funcao esta passando
            ),
            SizedBox(
              height: 70,
              child: Row(
                children: <Widget>[
                  const Text('Nenhuma data Selecionada'),
                  TextButton(
                    onPressed: () {},
                    child: const Text("Selecionar uma data"),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary),
                  child: Text(
                    'Nova Transacao',
                    style: TextStyle(
                      color: Theme.of(context).textTheme.labelLarge?.color,
                    ),
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
