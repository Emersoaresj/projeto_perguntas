import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/resultado.dart';

class PerguntaApp extends StatefulWidget {
  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final List<Map<String, Object>> _perguntas = [
    {
      'texto': 'Qual a sua cor favorita?',
      'resposta': [
        {'texto': 'Preto', 'nota': 10},
        {'texto': 'Vermelho', 'nota': 5},
        {'texto': 'Verde', 'nota': 3},
        {'texto': 'Branco', 'nota': 1},
      ],
    },
    {
      'texto': 'Qual o seu animal favorito?',
      'resposta':
      [
        {'texto':'Coelho','nota': 10},
        {'texto':'Cobra','nota': 5},
        {'texto':'Elefante','nota': 3},
        {'texto':'Leão','nota': 01}
      ],
    },
    {
      'texto': 'Qual o seu instrutor favorito?',
      'resposta':
      [
        {'texto': 'Maria', 'nota': 10},
        {'texto': 'João', 'nota': 5},
        {'texto': 'Leo', 'nota': 4},
        {'texto': 'Pedro', 'nota': 1}
      ],
    },
  ];

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Perguntas')),
        body: temPerguntaselecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder,
              )
            : Resultado(_pontuacaoTotal),
      ),
    );
  }

  void _responder(int pontuacao) {
    if (temPerguntaselecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  bool get temPerguntaselecionada {
    return _perguntaSelecionada < _perguntas.length;
  }
}
