import 'dart:io';

import 'package:flutter/cupertino.dart';
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

  //------------------------------------------------------------------------------------------------------------------------------------
  Widget _getIconButton(IconData icon, Function() fn) {
    return Platform.isIOS
        ? GestureDetector(onTap: fn, child: Icon(icon))
        : IconButton(
            onPressed: fn,
            icon: Icon(icon),
            iconSize: 40,
            color: Colors.white,
          );
  }

//------------------------------------------------------------------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    bool isLandscape = mediaQuery.orientation == Orientation.landscape;

    final iconList = Platform.isIOS ? CupertinoIcons.refresh : Icons.list;
    final chartList = Platform.isIOS ? CupertinoIcons.refresh : Icons.bar_chart;

//------------------------------------------------------------------------------------------------------------------------------------

    final actions = [
      _getIconButton(Platform.isIOS ? CupertinoIcons.add : Icons.add_circle,
          () => _openTransactionFormModal(context)),
      if (isLandscape)
        _getIconButton(_showChart ? iconList : chartList, () {
          setState(() {
            _showChart = !_showChart;
          });
        }),
    ];

//------------------------------------------------------------------------------------------------------------------------------------
    final PreferredSizeWidget appBar = AppBar(
      title: const Text('Despesas Pessoais Android'),
      actions: actions,
      backgroundColor: Theme.of(context).colorScheme.primary,
    );

    final appBarHeight = appBar.preferredSize.height;

    final availablelHeigth =
        mediaQuery.size.height - appBarHeight - mediaQuery.padding.top;

//------------------------------------------------------------------------------------------------------------------------------------
    final bodyPage = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // if (isLandscape)
            //   Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Text(_showChart ? 'Ocultar Gráfico!' : 'Exibir Gráfico!'),
            //       Switch.adaptive(
            //         activeColor: Theme.of(context).colorScheme.secondary,
            //         value: _showChart,
            //         onChanged: (value) {
            //           setState(() {
            //             _showChart = value;
            //           });
            //         },
            //       ),
            //     ],
            //   ),
            //------------------------------------------------------------------------------------------------------------------------------------

            if (_showChart || !isLandscape)
              SizedBox(
                height: availablelHeigth * (isLandscape ? 0.70 : 0.3),
                child: Chart(_recentTransactions),
              ),
            //-----------------------------------
            if (!_showChart || !isLandscape)
              SizedBox(
                height: availablelHeigth * (isLandscape ? 0.70 : 0.3),
                child: TransactionList(_transactions, _removeTransaction),
              ),
          ],
        ),
      ),
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              middle: const Text(
                'Despesas Pessoais iOS',
                style: TextStyle(color: Colors.white),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: actions,
              ),
            ),
            child: bodyPage,
          )
        : Scaffold(
            appBar: appBar,
            body: bodyPage,
            floatingActionButton: Platform.isIOS
                ? const SizedBox()
                : FloatingActionButton(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    onPressed: () {
                      _openTransactionFormModal(context);
                    },
                    child: const Icon(Icons.add_circle),
                  ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.endDocked,
          );
  }
}
/***********************************************************************************************
 * Nesta aula foi implementado o textBox de acordo com o SO em que o aplicativo está           *
 * executando.                                                                                 *
 *                                                                                             *
 ***********************************************************************************************
 * MARCADORES                                                                                  *  
 * ● | •                                                                                       *
************************************************************************************************/

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
