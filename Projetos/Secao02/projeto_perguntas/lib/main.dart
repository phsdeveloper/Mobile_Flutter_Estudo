import 'package:flutter/material.dart';
import './questao.dart';
import './resposta_desafio.dart';
main()=> runApp(PerguntaApp());

class _PerguntaAppState extends State <PerguntaApp>{


  int perguntaSelecionada = 0;
final List<Map<String,Object>> perguntas = [
    {
      'texto':'01) Qual é a sua cor favorita?',
      'resposta':['Preto','Vermelho','Verde','Branco','Azul',]

    },
    {
      'texto':'02) Qual é a Seu animal favorito?',
      'resposta':['Cachorro','Gato','Peixe','Coelho','Passaro',]

    },
    {
      'texto':'03) Qual é a sua Comida favorita?',
      'resposta':['Pizza','Hamburguer','Cachorro quente','feijoada','Coxinha',]

    },
    {
      'texto':'04) O Samuel é lindo?',
      'resposta':['Não','Com certeza','mais ou menos']

    },
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
             Questao(perguntas[perguntaSelecionada]['texto'].toString()),
             resposta_desafio('Com certeza!',perguntas[perguntaSelecionada]['texto'].toString(),_responder),
             resposta_desafio('Não Acho',perguntas[perguntaSelecionada]['texto'].toString(),_responder),
             resposta_desafio('Mais ou menos',perguntas[perguntaSelecionada]['texto'].toString(),_responder),
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