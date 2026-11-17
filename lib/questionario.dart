import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';

class Questionario extends StatelessWidget {

  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) responder;


  Questionario(
  {
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.responder
  });



  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaselecionada ? perguntas[perguntaSelecionada]['resposta'] as List<Map<String, Object>> : []; // [] significa null em lista
    List<Widget> widgets = respostas.map((resp) =>
        Resposta(
            resp['texto'] as String,
            () => responder(int.parse(resp['nota'].toString()))
        )).toList();

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
