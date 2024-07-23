import 'package:flutter/material.dart';

main()=> runApp(PerguntaApp());
//void main() {
//   runApp(new PerguntaApp());
//}

class PerguntaApp extends StatelessWidget {
  const PerguntaApp({super.key});

  @override
  Widget build(BuildContext context) {
final List<String> perguntas = [
  '01) Qual é a sua cor favorita',
  '02) Qual é a Seu animal',
];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
          backgroundColor: Theme.of(context).colorScheme.secondary
        ),
        body: Column(
          children: [
             Text(perguntas[0]),
             const ElevatedButton(child: Text('Resposta 01'),onPressed: null,),
             const ElevatedButton(child: Text('Resposta 02'),onPressed: null,),
             const ElevatedButton(child: Text('Resposta 03'),onPressed: null,),
          ],
        ),
      )
    );
  }
}
