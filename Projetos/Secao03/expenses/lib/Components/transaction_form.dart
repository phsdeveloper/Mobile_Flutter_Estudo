import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'adaptative_button.dart';
import 'adaptative_textField.dart';
import 'adaptative_datePicker.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
    final valueForm =
        double.tryParse(valueController.text.replaceAll(",", ".")) ?? 0.0;

    if (titleForm.isEmpty || valueForm <= 0 || _selectedDate == null) {
      if (Platform.isAndroid) {
        //_showAndroidToast( "Uma ou mais informacoes não foram preenchidas");
        _showiOSMessage(context, "Uma ou mais informacoes não foram preenchidas");
      } else if (Platform.isIOS) {
        _showiOSMessage(context, "Uma ou mais informacoes não foram preenchidas");
        //_showAndroidToast( "Uma ou mais informacoes não foram preenchidas");
      } else {
        print("Sistema operacional não suportado.");
      }

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

  void _showAndroidToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  void _showiOSMessage(BuildContext context, String message) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('Notificação'),
          content: Text(message),
          actions: [
            CupertinoDialogAction(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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
              AdaptativeTextField(
                controller: _titleController,
                label: 'Titulo',
                onSubmitted: (_) => _submitForm(),
              ),
              AdaptativeTextField(
                controller: valueController,
                label: 'Valor (R\$)',
                onSubmitted: (_) => _submitForm(),
                keyboardType: const TextInputType.numberWithOptions(
                    decimal: true, signed: true),
              ),
              AdaptativeDatePicker(
                selectedDate: _selectedDate,
                onDateChanged: (newDate) {
                  setState(() {
                    _selectedDate = newDate;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [AdaptativeButton("Nova Transação", _submitForm)],
              )
            ],
          ),
        ),
      ),
    );
  }
}
