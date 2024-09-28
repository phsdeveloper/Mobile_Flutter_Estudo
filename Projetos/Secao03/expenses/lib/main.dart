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
    );
  }
}
/**
nessa aula foi apresenatado o componente SingleChildScrollView que adiciona
uma rolagem na tela, mas para que o exemplo da aula ficasse funcional foi necessário os 
seguintes passos:
    ● Adicionar o Widget SingleChildScrollView no componente principal, ou seja, no arquivo main.dart
    ● Adicionar o Widget controller no componente que faz a lista, ou seja, no arquivo transaction_list.dart e adicionarmos um tamanho fixo, pois sem esse tamanho não há rolagem na lista.
    ● Adicionar o Widget SingleChildScrollView componente que faz a lista, ou seja, no arquivo transaction_list.dart e com isso conseguir uma rolagem interna no componente


 */
