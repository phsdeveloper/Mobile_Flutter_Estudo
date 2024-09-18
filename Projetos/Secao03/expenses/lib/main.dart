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
Nesta aula foi feito a alteracao no arquivo transaction_user.dart 
para que uma nova transacao seja adicionada a lista e realizando a alteracao do componetente filho;
Uma explicacao importante da aula foi: 
"Como o componente user é do tipo StatefulWidget, ou seja, quando o status muda automaticamente a arvore de componentes tambem
muda e a unica coisa que pode alterar a visualizacao de um componente Stateless é 
vc passar um novo dado pelo construtor do componente ai o componente se atualiza" 

 */
