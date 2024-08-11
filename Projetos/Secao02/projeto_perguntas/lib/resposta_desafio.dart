import 'package:flutter/material.dart';

// ignore: camel_case_types
class Resposta_desafio extends StatelessWidget {
  const Resposta_desafio(this.resposta, this.questao, this.quandoSelecionado, {super.key});

  final void Function() quandoSelecionado;    
  final String resposta;
  final String questao;
  @override
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