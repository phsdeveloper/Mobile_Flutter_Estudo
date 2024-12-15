import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'adaptative_button.dart';
import 'adaptative_textField.dart';

// ignore: must_be_immutable
class TransactionForm extends StatefulWidget {
  TransactionForm(this.onSubmit, {super.key});

  final void Function(String, double, DateTime?) onSubmit;
  String teste = 'teste';

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  _submitForm() {
    final titleForm = _titleController.text;
    final valueForm = double.tryParse(valueController.text.replaceAll(",", ".")) ?? 0.0;

    if (titleForm.isEmpty || valueForm <= 0 || _selectedDate == null) {
      return;
    }
    /**
     * Esse atributo widget nos perminte acessar todos os métodos e propriedades
     * existentes na classe Stateles ou statefull
     */
    widget.onSubmit(titleForm, valueForm, _selectedDate);
  }

  final _titleController = TextEditingController();
  final valueController = TextEditingController();
  DateTime? _selectedDate = DateTime.now();

  _showDatePicker() {
    showDatePicker(
      context: context,
      lastDate:
          DateTime.now(), //Indica a ultima data que o usuário pode selecionar
      firstDate:
          DateTime(2019), //Indica a data inicial que o usuário pode selecionar
      initialDate: DateTime
          .now(), // Indica a data que vai estar selecionada por default no calendario
      //locale: const Locale('pt', 'BR'),
    ).then((pickedDate) {
      //Fica aguardando a ação do usuário (tipo um evento de um botão na tela)
      if (pickedDate == null) {
        return;
      }
      setState(() {
        //Indica para o Flutter que os dados relacionados a essa variavel necessita ser alterado
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: 10 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: <Widget>[
             AdaptativeTextField
             (
             controller: _titleController,
             label: 'Titulo',
             onSubmitted: (_)=> _submitForm(),
             ),
             AdaptativeTextField(
              controller: valueController,
              label: 'Valor (R\$)',
              onSubmitted: (_)=> _submitForm(),
              keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
             ),
              // TextField(
              //   decoration: const InputDecoration(
              //     labelText: 'Titulo',
              //   ),
              //   controller: _titleController,
              //   onSubmitted:
              //       (_) => //Esse "_" indica que estamos ingnorando o parametro que a funcao esta passando
              //           _submitForm(),
              // ),
              // TextField(
              //   decoration: const InputDecoration(
              //     labelText: 'Valor (R\$)',
              //   ),
              //   controller: valueController,
              //   keyboardType: const TextInputType.numberWithOptions(
              //       decimal: true, signed: true),
              //   onSubmitted:
              //       (_) => //Esse "_" indica que estamos ingnorando o parametro que a funcao esta passando
              //           _submitForm(),
              // ),
              SizedBox(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      _selectedDate == null
                          ? 'Nenhuma data Selecionada'
                          : 'Data Selecionada: ${DateFormat('dd/MM/yyyy').format(_selectedDate!)}',
                    )),
                    TextButton(
                      onPressed: _showDatePicker,
                      child: const Text("Selecionar uma data"),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AdaptativeButton("Nova Transação", _submitForm)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
