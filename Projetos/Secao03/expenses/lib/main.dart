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
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_circle),
            onPressed: (){}
          ),
        ],
        ),
      body: SingleChildScrollView(
        child: Column(
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
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_circle),
        onPressed: (){},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked ,
    );
  }
}
/**
Nessa aula foi exemplificado como adicionar botões na tela usando o Widget FloatingActionButton juntamente com o icone.
 */
