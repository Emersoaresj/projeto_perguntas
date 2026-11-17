import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/resultado.dart';

class PerguntaApp extends StatefulWidget {
  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  final List<Map<String, Object>> _perguntas = [
    {
      'texto': 'Qual a sua cor favorita?',
      'resposta': ['Preto', 'Vermelho', 'Verde', 'Branco'],
    },
    {
      'texto': 'Qual o seu animal favorito?',
      'resposta': ['Coelho', 'Cobra', 'Elefante', 'Leão'],
    },
    {
      'texto': 'Qual o seu instrutor favorito?',
      'resposta': ['Maria', 'João', 'Leo', 'Pedro'],
    },
  ];



  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Perguntas')),
        body: temPerguntaselecionada? Questionario(
            perguntas: _perguntas,
            perguntaSelecionada: _perguntaSelecionada,
            responder: _responder
        ) : Resultado()
      ),
    );
  }

  void _responder() {
    if (temPerguntaselecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  bool get temPerguntaselecionada {
    return _perguntaSelecionada < _perguntas.length;
  }
}
