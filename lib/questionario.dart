import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';

class Questionario extends StatelessWidget {

  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function() responder;


  Questionario(
  {
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.responder
  });



  @override
  Widget build(BuildContext context) {
    List<String> respostas = temPerguntaselecionada ? perguntas[perguntaSelecionada]['resposta'] as List<String> : []; // [] significa null em lista
    List<Widget> widgets = respostas.map((t) => Resposta(t, responder)).toList();

    return Column(
      children: [
        Questao(perguntas[perguntaSelecionada]['texto'].toString()),
        ...widgets
      ],
    );
  }


  bool get temPerguntaselecionada {
    return perguntaSelecionada < perguntas.length;
  }
}
