import 'package:flutter/material.dart';

main()=> runApp(PerguntaApp());
//void main() {
//   runApp(new PerguntaApp());
//}

class PerguntaApp extends StatelessWidget {
  const PerguntaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
          backgroundColor: Theme.of(context).colorScheme.secondary
        ),
        body: const Text('teste'),
      )
    );
  }
}
