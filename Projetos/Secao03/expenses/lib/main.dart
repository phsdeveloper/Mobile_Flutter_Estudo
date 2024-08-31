import 'package:expenses/Components/transaction_user.dart';
import 'package:flutter/material.dart';
import 'Components/export_all_components.dart';


main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Despesas Pessoais')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            child: Card(
              color: Colors.blue,
              elevation: 5,
              child: Text('Gráfico.'),
            ),
          ),
          
          TransactionUser()
        ],
      ),
    );
  }
}
/**
Nesta aula foi aplicada uma refatoracao, montando arquivos para cada parte do aplicativo
  - transaction_form.dart: Contém os inputs para receber os dados
  - transaction_list.dart: contem o componente das lista que serao gerada ao adicionar o componente.

 */
