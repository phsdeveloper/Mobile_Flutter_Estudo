import 'package:flutter/material.dart';

main()=> runApp(PerguntaApp());

class PerguntaAppState extends State <PerguntaApp>{


  int perguntaSelecionada = 0;
final List<String> perguntas = [
    '01) Qual é a sua cor favorita',
    '02) Qual é a Seu animal favorito',
    '03) Qual é a sua Comida favorita',
    '04) O Samuel é lindo?',
  ];
  void Responder(){
    setState(() {
      perguntaSelecionada++;
    });
    
    if(perguntaSelecionada>=perguntas.length)
    {
      perguntaSelecionada = 0;
    }
    print('pergunta "${perguntas[perguntaSelecionada]}" Respondida.');
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
             Text(perguntas[perguntaSelecionada]),
             ElevatedButton(child: Text('Com certeza'),onPressed: Responder),
             ElevatedButton(child: Text('Não Acho'),onPressed: (){print('teste');}),
             ElevatedButton(child: const Text('Mais ou menos'),onPressed: () => print('Resposta 3!!!'),),
             ElevatedButton(child: const Text('Não vou responder - Desabilitado'),onPressed: null,),
          ],
        ),
      )
    );
  }
}






class PerguntaApp extends StatefulWidget {
  //const PerguntaApp({super.key});
  @override
  PerguntaAppState createState() {
    return new PerguntaAppState();
  }


}
