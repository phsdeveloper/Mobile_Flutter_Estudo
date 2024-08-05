import 'package:flutter/material.dart';
import './questao.dart';
import './resposta_desafio.dart';
main()=> runApp(const _PerguntaApp());

class _PerguntaAppState extends State <_PerguntaApp>{


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
      'resposta':['Pizza','Hamburguer','Cachorro quente','feijoada','Coxinha!',]

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
    
    //if(perguntaSelecionada>=perguntas.length)
    //{
    //  perguntaSelecionada = 0;
    //}
    //print('pergunta "${perguntas[perguntaSelecionada]}" Respondida. com o index $perguntaSelecionada');
  }

  void _reiniciarQuestoes()
  {
    perguntaSelecionada = -1;
    _responder();
  }

  

   List<Widget> respostas = [];
    
    @override
  Widget build(BuildContext context) {
  respostas.clear();
  /**
   * O map é similar ao select do Entity
   */
List<String> lstRespostas =[];
if(perguntaSelecionada<perguntas.length)
{
    lstRespostas = perguntas[perguntaSelecionada]['resposta'] as List<String>;
    respostas = lstRespostas.map((t) => resposta_desafio(t,perguntas[perguntaSelecionada]['texto'].toString(),_responder))
                            .toList();
}

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
          backgroundColor: Theme.of(context).colorScheme.secondary
        ),
        body: (perguntaSelecionada>=perguntas.length)?
        (
          Column(children: [
            Questao('Todas as perguntas respondidas, quer reiniciar as questões?'.toString()),
            resposta_desafio('Sim','',_reiniciarQuestoes),
            resposta_desafio('Nao', '', () { })//Por hora nao sei como resolver essa parada
          ])
        )
        : 
        (
          Column(
              children: [
                Questao(perguntas[perguntaSelecionada]['texto'].toString()),
                //...respostas, ///Esses 3 (sprad) pontos adicona todos os elementos nesta lista, ou seja, é como se fosse um foreach para o item
                ...lstRespostas.map((t) => resposta_desafio(t,perguntas[perguntaSelecionada]['texto'].toString(),_responder)),
                const ElevatedButton(onPressed: null,child: Text('Não vou responder - Desabilitado')),
              ],
            )
        ),

      )
    );
  }
}

class _PerguntaApp extends StatefulWidget {
  const _PerguntaApp();
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