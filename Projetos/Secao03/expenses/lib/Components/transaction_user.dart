import 'package:flutter/material.dart';
import 'transaction_form.dart';
import 'transaction_list.dart';
import '../models/transaction.dart';
import 'dart:math';
class TransactionUser extends StatefulWidget {
   TransactionUser({super.key});





  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {

    final _transactions = [
    Transaction(id: 't1',title: 'Novo Tenis de Corrida.',value: 310.76,date: DateTime.now()),
    Transaction(id: 't2', title: 'Conta de Luz.', value: 211.30, date: DateTime.now())
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
    return  Column(
          children: <Widget>[
            TransactionList(_transactions),
            TransactionForm(_addTransaction)


          ],

    );
  }
}