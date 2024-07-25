import 'package:flutter/material.dart';
import './questao.dart';
main()=> runApp(PerguntaApp());

class _PerguntaAppState extends State <PerguntaApp>{


  int perguntaSelecionada = 0;
final List<String> perguntas = [
    '01) Qual é a sua cor favorita',
    '02) Qual é a Seu animal favorito',
    '03) Qual é a sua Comida favorita',
    '04) O Samuel é lindo?',
  ];
  void _responder(){
    setState(() {
      perguntaSelecionada++;
    });
    
    if(perguntaSelecionada>=perguntas.length)
    {
      perguntaSelecionada = 0;
    }
    print('pergunta "${perguntas[perguntaSelecionada]}" Respondida. com o index $perguntaSelecionada');
  }

    @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
          backgroundColor: Theme.of(context).colorScheme.secondary
        ),
        body: Column(
          children: [
             Questao(perguntas[perguntaSelecionada]),
             ElevatedButton(onPressed: _responder,child: const Text('Com certeza')),
             ElevatedButton(onPressed: _responder,child: const Text('Não Acho')),
             ElevatedButton(onPressed: _responder,child: const Text('Mais ou menos')),
             const ElevatedButton(onPressed: null,child: Text('Não vou responder - Desabilitado')),
          ],
        ),
      )
    );
  }
}






class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }


}
