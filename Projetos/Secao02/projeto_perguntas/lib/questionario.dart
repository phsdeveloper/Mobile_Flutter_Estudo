// ignore_for_file: must_be_immutable, file_names



import 'package:flutter/material.dart';
import './questao.dart';
import './resposta_desafio.dart';

class Questionario extends StatelessWidget {
   Questionario({super.key, required this.perguntas
                    ,required this.perguntaSelecionada
                    ,required this.responder
                    ,required this.reiniciarQuestoes
                    ,required this.finalizarQuestionario
                    ,required this.blExibirOpcaoRessetar
                    
                    });


  final List<Map<String,Object>> perguntas;
  final int perguntaSelecionada;
  final bool blExibirOpcaoRessetar;
  final void Function(int) responder;
  final void Function() reiniciarQuestoes;
  final void Function() finalizarQuestionario;




   List<Widget> _respostas = [];

  @override
  Widget build(BuildContext context) {


  _respostas.clear();
  /**
   * O map é similar ao select do Entity
   */
List<Map<String,Object>> lstRespostas = [];
if(perguntaSelecionada<perguntas.length)
{
  //O erro estava neste ponto, pois eu precisava obter as respostas disponiveis, juntamente com a pontuacao
  //mas eu estava apenas passando a listagem completa comm as perguntas e respostas..
  //Com isso dava ruim, pois eu apresentava as perguntas como se fossem respostas.
    lstRespostas = perguntas[perguntaSelecionada]['resposta'] as List<Map<String,Object>>;
    _respostas = lstRespostas.map((resp) => Resposta_desafio(resp['texto'].toString(),perguntas[perguntaSelecionada]['texto'].toString(),()=> responder(0)))
                            .toList();
}
  //if(perguntaSelecionada>=perguntas.length)
  //{
  //  finalizarQuestionario();
  //}

    return  
        (perguntaSelecionada>=(perguntas.length) && blExibirOpcaoRessetar)?        
        (
          Column(children: [
            Questao('Deseja finalizar o questionario?'.toString()),
            Resposta_desafio('Sim - Finalizar!','',finalizarQuestionario),
            Resposta_desafio('Nao - Reiniciar!', '',reiniciarQuestoes )
          ])
        )
        : 
        (
          Column(
              children: [
                Questao(perguntas[perguntaSelecionada]['texto'].toString()),
                //...respostas, ///Esses 3 (sprad) pontos adicona todos os elementos nesta lista, ou seja, é como se fosse um foreach para o item
                ...lstRespostas.map((resp) => Resposta_desafio(resp['texto'].toString(),
                                    resp['texto'].toString(),
                                    ()=> responder(resp['pontuacao'] as int) )),
                const ElevatedButton(onPressed: null,child: Text('Não vou responder - Desabilitado')),
              ],
            )
        );
  }
}