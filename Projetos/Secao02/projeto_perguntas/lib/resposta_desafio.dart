import 'package:flutter/material.dart';

class resposta_desafio extends StatelessWidget {
  const resposta_desafio(this.resposta, this.questao, this.quandoSelecionado, {super.key});

  final void Function() quandoSelecionado;    
  final String resposta;
  final String questao;

  Widget build(BuildContext context) {
    return  SizedBox(
      width: double.infinity,

      child: ElevatedButton(
        onPressed: quandoSelecionado,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white
        ), 
        child: Text(resposta),
        ),
    );
  }
}
/*********************************************************************************************************************
 * Para que o click funcionasse tive que passar a funcao como parametro da classe, achei estranho essa abordagem     *
 * mas vida que segue,quem sabe depois melhora.                                                                      *
 *********************************************************************************************************************/