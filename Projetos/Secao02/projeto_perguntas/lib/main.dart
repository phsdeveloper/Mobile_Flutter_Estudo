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
    
    if(perguntaSelecionada>=perguntas.length)
    {
      perguntaSelecionada = 0;
    }
    print('pergunta "${perguntas[perguntaSelecionada]}" Respondida. com o index $perguntaSelecionada');
  }


   List<Widget> respostas = [];
    
 




    @override
  Widget build(BuildContext context) {
  respostas.clear();
   for(String respostaItem in perguntas[perguntaSelecionada]['resposta'] as List)
   {
    
       respostas.add(resposta_desafio(respostaItem,perguntas[perguntaSelecionada]['texto'].toString(),_responder));
   }
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
          backgroundColor: Theme.of(context).colorScheme.secondary
        ),
        body: Column(
          children: [
             Questao(perguntas[perguntaSelecionada]['texto'].toString()),
             ...respostas, ///Esses 3 pontos adicona todos os elementos nesta lista, ou seja, é como se fosse um foreach para o item
             const ElevatedButton(onPressed: null,child: Text('Não vou responder - Desabilitado')),
          ],
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