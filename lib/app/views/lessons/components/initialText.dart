import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

void initText(QuillController _controller) {
  try {
    var initialText = new Delta()
      ..insert("Objetivo geral")
      ..insert("\n", {"list": "bullet"})
      ..insert(
          "Ao final desta aula espera-se que o(s) aluno(s) esteja(m) apto(s) a…")
      ..insert("\n", {"list": "bullet", "indent": 1})
      ..insert("Objetivos especificos")
      ..insert(
          "Para alcançar o objetivo geral, o(s) aluno(s) deve(m) aprender a ou sobre...")
      ..insert("\n", {"list": "bullet", "indent": 1})
      ..insert("Metodologia")
      ..insert("\n", {"list": "bullet"})
      ..insert(
          "Descreva detalhadamente como executar os objetivos específicos (como se fosse um manual de instruções). Explicite quais recursos utilizar e como utilizá-los.")
      ..insert("\n", {"list": "bullet", "indent": 1})
      ..insert("Avaliação")
      ..insert("\n", {"list": "bullet"})
      ..insert(
          "Como você pretende avaliar/verificar se o(s) aluno(s) alcançou(aram) o objetivo específico?")
      ..insert("\n", {"list": "bullet", "indent": 1})
      ..insert("Recursos")
      ..insert("\n", {"list": "bullet"})
      ..insert("Quais os materiais você vai precisar para executar sua aula?")
      ..insert("\n", {"list": "bullet", "indent": 1})
      ..insert("Referências")
      ..insert("\n", {"list": "bullet"})
      ..insert(
          "Para que outro professor possa se preparar para executar sua proposta de aula, nos diga: De onde você tirou toda sua inspiração? (livros, revistas, sites, outros planos de aula)")
      ..insert("\n", {"list": "bullet", "indent": 1});

    _controller.compose(
        initialText,
        TextSelection.collapsed(offset: initialText.length),
        ChangeSource.local);
  } catch (err, st) {
    print('Cannot read welcome.json: $err\n$st');
    _controller = _controller;
  }
}
