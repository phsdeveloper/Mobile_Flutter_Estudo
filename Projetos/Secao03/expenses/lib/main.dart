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
                  color: Colors.white, fontWeight: FontWeight.bold)),
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
  bool _showChart = false;
  List<Transaction> get _recentTransactions {
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(
        const Duration(days: 7),
      ));
    }).toList();
  }

  _addTransaction(String title, double value, DateTime? data) {
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

  _removeTransaction(String id) {
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
    final _mediaQuery = MediaQuery.of(context);
    bool isLandscape =
        _mediaQuery.orientation == Orientation.landscape;

    final appBar = AppBar(
      title: Text(
        'Despesas Pessoais',
        style: TextStyle(
          fontSize: 20 * MediaQuery.textScalerOf(context).scale(1),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      actions: <Widget>[
        IconButton(
            icon: const Icon(Icons.add_circle,color: Colors.white,size: 35,),
            onPressed: () {
              _openTransactionFormModal(context);
            }),
        if (isLandscape)
          IconButton(
              icon: Icon(_showChart ? Icons.list : Icons.bar_chart,color: Colors.white,size: 35,),
                            
              onPressed: () {
                setState(() {
                  _showChart = !_showChart;
                });
              }),
      ],
    );

    final appBarHeight = appBar.preferredSize.height;

    final availablelHeigth = _mediaQuery.size.height -
        appBarHeight -
        _mediaQuery.padding.top;

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //if (isLandscape)
            //  Row(
            //    mainAxisAlignment: MainAxisAlignment.center,
            //    children: [
            //      Text(_showChart ? 'Ocultar Gráfico' : 'Exibir Gráfico'),
            //      Switch(
            //        value: _showChart,
            //        onChanged: (value) {
            //          setState(() {
            //            _showChart = value;
            //          });
            //        },
            //      ),
            //    ],
            //  ),
            //-----------------------------------------------------------------------

            if (_showChart || !isLandscape)
              SizedBox(
                height: availablelHeigth * (isLandscape ? 0.8 : 0.3),
                child: Chart(_recentTransactions),
              ),
            //-----------------------------------
            if (!_showChart || !isLandscape)
              SizedBox(
                height: availablelHeigth * (isLandscape ? 0.8 : 0.3),
                child: TransactionList(_transactions, _removeTransaction),
              ),
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
Nessa aula foi realizado apenas uma refatoração para não ter a necessidade de chamar o MediaQuery varias vezes
Foi adicionado um texto e um icone para o excluir.
 ● Arquivo: main.dart
     • foi criada a variavel _mediaQuery 
  
  */

  /**
   *    ● 
    • 
   * Duvidas aulas:
   * ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
   * ⚑ Aula 128) Quando abro ou reinicio a aplicação os nomes da semana vem em inglês e ao salvar mesmo sem alterar laguma linha o padrão volta a ser em português.
   * Fiz a alteração no código conforme indicação na duvida postada
   * Intl.defaultLocale = 'pt_BR';
   * await initializeDateFormatting('pt_BR', null);
   * ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
   * ⚑ Aula 148. Ajustando Formulário
   * quando a aplicação está em modo paisagem mesmo com essa alteração o formulário não é exibido.
   * Vou deixar essa alteração para o final do módulo.
   * Tem uma implementação mais adequada nos recursos da aula
   * ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
   */
