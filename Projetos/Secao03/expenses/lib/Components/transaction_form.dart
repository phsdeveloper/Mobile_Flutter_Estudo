import 'package:flutter/material.dart';
import 'dart:io';
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
    final valueForm = double.tryParse(valueController.text.replaceAll(",", ".")) ?? 0.0;
    String mensagem = "";
    mensagem += "SO: ${Platform.isIOS?'iOS':'Android'}";
    mensagem += "Data: ${DateTime.now()}";
    mensagem += ' >> Titulo: "$titleForm"';
    mensagem += " >> Valor: $valueForm";
    mensagem += '>> Antes teste widget=${widget.teste}';
    widget.teste = 'alterado';
    mensagem += ' depois teste widget=${widget.teste}';
    debugPrint(mensagem);
    if (titleForm.isEmpty || valueForm <= 0) {
      print("SO: ${Platform.isIOS?'iOS':'Android'} >> Despesa nao cadastrada");
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: _submitForm,
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
