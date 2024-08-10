import 'package:flutter/material.dart';
import './questionario.dart';

import './Resultado.dart';

main() => runApp(const _PerguntaApp());

class _PerguntaAppState extends State<_PerguntaApp> {
  bool _blFinalizarQuestionario = false;
  int perguntaSelecionada = 0;
  int _pontuacaoFinal = 0;
  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': '01) Qual é a sua cor favorita?',
      'resposta': [
        {'pontuacao': 10, 'texto': 'Preto'},
        {'pontuacao': 5, 'texto': 'Vermelho'},
        {'pontuacao': 20, 'texto': 'Verde'},
        {'pontuacao': 100, 'texto': 'Branco'},
        {'pontuacao': 50, 'texto': 'Azul'},
      ]
    },
    {
      'texto': '02) Qual é a Seu animal favorito?',
      'resposta': [
        {'texto': 'Cachorro','pontuacao': 5,},
        {'texto': 'Gato'    ,'pontuacao': 6,},
        {'texto': 'Peixe'   ,'pontuacao': 7,},
        {'texto': 'Coelho'  ,'pontuacao': 8,},
        {'texto': 'Passaro' ,'pontuacao': 9,},
      ]
    },
    {
      'texto': '03) Qual é a sua Comida favorita?',
      'resposta': [
        {'texto': 'Pizza'          ,'pontuacao': 20},
        {'texto': 'Hamburguer'     ,'pontuacao': 30},
        {'texto': 'Cachorro quente','pontuacao': 40},
        {'texto': 'feijoada'       ,'pontuacao': 50},
        {'texto': 'Coxinha!'       ,'pontuacao': 60},
      ]
    },
    {
      'texto': '04) O Samuel é lindo?',
      'resposta': [
        {'texto':'Não'          ,'pontuacao': 0  ,}, 
        {'texto':'Com certeza'  ,'pontuacao': 100,}, 
        {'texto':'mais ou menos','pontuacao': 10 ,},
        ]
    },
  ];

  void _responder(dynamic pontuacao) {
    setState(() {
      perguntaSelecionada++;
      //_pontuacaoFinal+=pontuacao;
    });
    String st_valor = pontuacao.toString();
    debugPrint('Pontuacao Final: $pontuacao');
  }

  void _reiniciarQuestoes() {
    perguntaSelecionada = -1;
    _pontuacaoFinal = 0;
    _responder(0);
  }

  void _finalizarQuestionario() {
    setState(() {
      _blFinalizarQuestionario = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
                title: const Text('Perguntas'),
                backgroundColor: Theme.of(context).colorScheme.secondary),
            body: _blFinalizarQuestionario
                ? (const Resultado())
                : Questionario(
                    perguntas: _perguntas,
                    perguntaSelecionada: perguntaSelecionada,
                    responder: _responder,
                    reiniciarQuestoes: _reiniciarQuestoes,
                    finalizarQuestionario: _finalizarQuestionario)));
  }
}

class _PerguntaApp extends StatefulWidget {
  const _PerguntaApp();
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
/****************************************************************************************************************************************
 *                                                       A N O T A Ç Õ E S  A U L A S                                                   *
 ****************************************************************************************************************************************
 *                                                                                                                                      *
 *     -------------------------------------------------------------------------------------------------------------------------        *
 *     --                                              AULA 62 - Adicionando pontuacao                                        --        *
 *     -------------------------------------------------------------------------------------------------------------------------        *
 *     -- Nesta aula foi iniciado uma alteracao para adicionar a pontuacao as perguntas, fiz a alteracao mas com uma abordagem--        *
 *     -- diferente, e mantendo o meu template inicial                                                                        --        *
 *     -------------------------------------------------------------------------------------------------------------------------        *
 *                                                                                                                                      *
 *     -------------------------------------------------------------------------------------------------------------------------        *
 *     --                                           AULA 60 - Widget Questionario                                             --        *
 *     -------------------------------------------------------------------------------------------------------------------------        *
 *     -- Nesta aula foi realizada uma refatoracao no sentido de separar melhor os componentes, até agora consegui manter o   --        *
 *     -- meu codigo inicial sem alteracoes                                                                                   --        *
 *     -------------------------------------------------------------------------------------------------------------------------        *
 *                                                                                                                                      *
 *     -------------------------------------------------------------------------------------------------------------------------        *
 *     --                                             AULA 57 - Desafio Widget Resultado                                      --        *
 *     -------------------------------------------------------------------------------------------------------------------------        *
 *     -- Nessa aula foi proposto um desafio para transformar o widget em um componente personalizado                         --        *
 *     -- Fiz do meu jeito e funcionou                                                                                        --        *
 *     --                                                                                                                     --        *
 *     -------------------------------------------------------------------------------------------------------------------------        *
 *                                                                                                                                      *
 *                                                                                                                                      *
 *     -------------------------------------------------------------------------------------------------------------------------        *
 *     --                                                      AULA 54                                                        --        *
 *     -------------------------------------------------------------------------------------------------------------------------        *
 *     -- Nessa aula foi resolvido o problema de acesar uma pergunda fora do limte de perguntas disponiveis, eu               --        *
 *     -- havia feito um looping para que esse erro nao ocorresse.                                                            --        *
 *     -- Mas nessa aula foi adicionado um recurso que ao acabar as perguntas uma mensagem de "Parabens" ia aparecer na tela  --        *
 *     -- em um novo componente Center.                                                                                       --        *
 *     -- Minha abordagem foi questionar ao usuário se o usuário gostaria de reiniciar as questoes, mas isso fez a arvore     --        *
 *     -- de Widgets ficar desorganizada com muitos operadores ternarios.                                                     --        *
 *     -- Essa aula foi realizada na branch anterior                                                                          --        *
 *     -------------------------------------------------------------------------------------------------------------------------        *
 *                                                                                                                                      *
 *                                                                                                                                      *
 ****************************************************************************************************************************************/

/*********************************************************************************************************************
 * Para essa aula fiz corretamente que foi criar um componente apartado e reinderizar na tela.                       *                    
 * Mas nesse caso fui um pouco alem e coloquei um evento que exiba os dados de pergunta e resposta perinentes.       *
 * Porém não atualizou a tela                                                                                        *        
 *                                                                                                                   *                             
 *********************************************************************************************************************/