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
Nessa aula foi configurado o teclado numerico e tambem adicionado a configiracao para realizar a chamada da funcao de cada um dos campos do cadastro, para isso os seguintes passos foram realizados.
    ● Arquivo transaction_form.dart:
      ⭢ Em cada widget TextField foi adiconado a funcao onSubmitted, um ponto importante aqui é se atentar que aqui temos que chamar a funcao e nao passar ela como referencia.
      ⭢ Encapsular a chamada a funcao onSubmit para que cada Widget poder chamar com seus respectivos eventos
 */
