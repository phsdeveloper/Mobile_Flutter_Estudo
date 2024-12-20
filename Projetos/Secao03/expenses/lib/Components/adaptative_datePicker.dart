import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AdaptativeDatePicker extends StatelessWidget {
  const AdaptativeDatePicker({this.selectedDate, this.onDateChanged,
      super.key});

  final DateTime? selectedDate;
  final Function(DateTime)? onDateChanged;

  _showDatePicker(BuildContext context) {
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
      onDateChanged!(pickedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? SizedBox(
          height: 180,
          child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime.now(),
              minimumDate: DateTime(2019),
              maximumDate: DateTime.now(),
              onDateTimeChanged: onDateChanged!,
            ),
        )
        : SizedBox(
            height: 70,
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Text(
                  selectedDate == null
                      ? 'Nenhuma data Selecionada'
                      : 'Data Selecionada: ${DateFormat('dd/MM/yyyy').format(selectedDate!)}',
                )),
                TextButton(
                  onPressed: () => _showDatePicker(context),
                  child: const Text("Selecionar uma data"),
                )
              ],
            ),
          );
  }
}
