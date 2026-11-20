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

    final tema = Theme.of(context);
    final total = perguntas.length;
    final progresso = (perguntaSelecionada + 1) / total;

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Pergunta ${perguntaSelecionada + 1} de $total',
            textAlign: TextAlign.center,
            style: tema.textTheme.titleMedium?.copyWith(
              color: tema.colorScheme.onPrimaryContainer,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: progresso,
              minHeight: 10,
              backgroundColor: tema.colorScheme.surface.withValues(alpha: 0.6),
            ),
          ),
          const SizedBox(height: 24),
          Questao(perguntas[perguntaSelecionada]['texto'].toString()),
          const SizedBox(height: 16),
          ...widgets
        ],
      ),
    );
  }


  bool get temPerguntaselecionada {
    return perguntaSelecionada < perguntas.length;
  }
}
