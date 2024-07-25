import 'package:flutter/material.dart';

class resposta_desafio extends StatelessWidget{
const resposta_desafio(this.resposta,this.questao,this.NumeroQuestao, {super.key});
final String resposta;
final String questao;
final int NumeroQuestao;
void _exibirResposta()
{
  print('Pergunta "$questao" foi respondida como "$resposta"');
}


Widget build(BuildContext context)
{
  return ElevatedButton(onPressed: _exibirResposta,child:  Text(resposta));
}

}