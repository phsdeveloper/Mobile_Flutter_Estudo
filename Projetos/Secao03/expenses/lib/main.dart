import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'Components/export_all_components.dart';
import 'dart:math';
import 'models/transaction.dart';

void main() async {
  Intl.defaultLocale = 'pt_BR';
  await initializeDateFormatting('pt_BR', null);
  runApp(ExpensesApp());
} 

class ExpensesApp extends StatelessWidget {
  ExpensesApp({super.key});

  final ThemeData tema = ThemeData();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: MyHomePage(),
        theme: tema.copyWith(
          colorScheme: tema.colorScheme.copyWith(
            primary: Colors.purple,
            secondary: Colors.amber,
          ),
          textTheme: tema.textTheme.copyWith(
            titleLarge: const TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 18,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
            labelLarge: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
            )
          ),
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [];

  List<Transaction> get _recentTransactions {
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(
        const Duration(days: 7),
      ));
    }).toList();
  }

  _addTransaction(String title, double value,DateTime? data) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: data!,
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }


  _removeTransaction(String id)
  {
    setState(() {
      _transactions.removeWhere((tr) => tr.id == id);
    });
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(_addTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.add_circle),
              onPressed: () {
                _openTransactionFormModal(context);
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Chart(_recentTransactions),
            TransactionList(_transactions,_removeTransaction),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        onPressed: () {
          _openTransactionFormModal(context);
        },
        child: const Icon(Icons.add_circle),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
/**
Nessa aula implementado a exclusão do registro, com as seguintes alteraçoes.
 ● Arquivo main.dart
    • Criação da função _removeTransaction(String id) que remove um elemento da lista com base no id.
    • Passando essa função por parametro para o wdget transaction_list.dart.
 ●  Arquivo transaction_list.dart
    • Criação da funcão onRemove que vai receber por parametro a função que vai remover efetivamente o elemento da lista.
    • Implementação do trailing no ListTile que é a parte final do widget.
  */

  /**
   * Duvidas aulas:
   * ⚑ Aula 128) Quando abro ou reinicio a aplicação os nomes da semana vem em inglês e ao salvar mesmo sem alterar laguma linha o padrão volta a ser em português.
   * Fiz a alteração no código conforme indicação na duvida postada
   * Intl.defaultLocale = 'pt_BR';
   * await initializeDateFormatting('pt_BR', null);
   * 
   * 
   * 
   */
