import 'package:flutter/material.dart';
import './questao.dart';
import './resposta_desafio.dart';
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


  int _obterPergunta()
  {
      setState(() {
      perguntaSelecionada++;
    });
    if(perguntaSelecionada>=perguntas.length)
    {
      perguntaSelecionada = 0;
    }
    return perguntaSelecionada;
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
             resposta_desafio('Com certeza!',perguntas[perguntaSelecionada],_obterPergunta()),
             resposta_desafio('Não Acho',perguntas[perguntaSelecionada],_obterPergunta()),
             resposta_desafio('Mais ou menos',perguntas[perguntaSelecionada],_obterPergunta()),
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
/*********************************************************************************************************************
 * Para essa aula fiz corretamente que foi criar um componente apartado e reinderizar na tela.                       *                    
 * Mas nesse caso fui um pouco alem e coloquei um evento que exiba os dados de pergunta e resposta perinentes.       *
 * Porém não atualizou a tela                                                                                        *        
 *                                                                                                                   *                             
 *********************************************************************************************************************/