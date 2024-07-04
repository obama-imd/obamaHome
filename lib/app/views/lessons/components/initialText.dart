import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill/quill_delta.dart';

String initText(QuillController _controller, List<String>? cachedObjects, List<String> dataList) {
  print("selected => ${cachedObjects}");

  try {
    var startText = new Delta()
      ..insert("PLANO DE AULA INCLUSIVO", {
        "bold": "true",
      })
      ..insert("\n", {"align": "center"})
      ..insert("\n")
      ..insert("\n")
      ..insert("Identificação", {
        "bold": "true",
      })
      ..insert("\n", {"align": "center"})
      ..insert("\n")
      ..insert("\n")
      ..insert("Escola: ", {
        "bold": "true",
      })
      ..insert(dataList[0])
      ..insert("\n")
      ..insert("\n")
      ..insert("Professor (a): ", {
        "bold": "true",
      })
      ..insert("JARDEANE DE SOUZA SILVA")
      ..insert("\n")
      ..insert("\n")
      ..insert("Disciplina: ", {
        "bold": "true",
      })
      ..insert("ENSINO DE LIBRAS")
      ..insert("\n")
      ..insert("\n")
      ..insert("Resumo: ", {
        "bold": "true",
      })
      ..insert(dataList[1])
      ..insert("\n")
      ..insert("\n")
      ..insert("Ano: ", {
        "bold": "true",
      })
      ..insert(dataList[2])
      ..insert("\n")
      ..insert("\n")
      ..insert("Turno: ", {
        "bold": "true",
      })
      ..insert("TARDE")
      ..insert("\n")
      ..insert("\n")
      ..insert("Duração: ", {
        "bold": "true",
      })
      ..insert(dataList[3])
      ..insert("\n")
      ..insert("\n")
      ..insert("Aluno (a) incluído (a): ", {
        "bold": "true",
      })
      ..insert("\n")
      ..insert("\n")
      ..insert("(   ) Surdo")
      ..insert("\n")
      ..insert("\n")
      ..insert("(   ) Cego")
      ..insert("\n")
      ..insert("\n")
      ..insert("(   ) TEA Transtorno do Espectro Autista")
      ..insert("\n")
      ..insert("\n")
      ..insert("(   ) Deficiência Intelectual")
      ..insert("\n")
      ..insert("\n")
      ..insert("(   ) Altas Habilidades")
      ..insert("\n")
      ..insert("\n")
      ..insert("(   ) Deficiente Auditivo")
      ..insert("\n")
      ..insert("\n")
      ..insert("(   ) Baixa Visão")
      ..insert("\n")
      ..insert("\n")
      ..insert("(   ) Síndrome de Down")
      ..insert("\n")
      ..insert("\n")
      ..insert("(   ) Surdocego")
      ..insert("\n")
      ..insert("\n")
      ..insert("Recursos de acessibilidade: ", {
        "bold": "true",
      })
      ..insert("Livro acessível; LSE; TILS")
      ..insert("\n")
      ..insert("\n")
      ..insert("Sala de Recursos Multifuncionais: ", {
        "bold": "true",
      })
      ..insert("(   ) Sim ")
      ..insert("(   ) Não")
      ..insert("\n")
      ..insert("\n")
      ..insert("Materiais: ", {
        "bold": "true",
      })
      ..insert("\n");

    var endText = new Delta()
      // ..insert("\n")
      // ..insert("-")
      ..insert("\n")
      ..insert("Estratégias de promoção da aprendizagem em sala de aula: ", {
        "bold": "true",
      })
      ..insert("\n")
      ..insert("\n")
      ..insert(
          "(   ) Proporcionar situações de apoio individualizado na sala de aula. Responsável pelo apoio: TILS")
      ..insert("\n")
      ..insert("\n")
      ..insert("(   ) Promover ações de tutorias entre os estudantes")
      ..insert("\n")
      ..insert("\n")
      ..insert("(   ) Atividades para casa")
      ..insert("\n")
      ..insert("\n")
      ..insert("(   ) Atividades cooperativas em sala de aula")
      ..insert("\n")
      ..insert("\n")
      ..insert(
          "(   ) Realizar revisões de conteúdos anteriores no começo da aula")
      ..insert("\n")
      ..insert("\n")
      ..insert(
          "(   ) Planejamento de resoluções de problemas de forma colaborativa")
      ..insert("\n")
      ..insert("\n")
      ..insert("(   ) Promoção da autoavaliação")
      ..insert("\n")
      ..insert("\n")
      ..insert("(   ) Correção coletiva das atividades e avaliações")
      ..insert("\n")
      ..insert("\n")
      ..insert("(   ) Promoção de conflitos sociocognitivos")
      ..insert("\n")
      ..insert("\n")
      ..insert("(   ) Outras")
      ..insert("\n")
      ..insert("\n")
      ..insert("\n")
      ..insert("\n")
      ..insert("Plano de Aula", {"bold": "true"})
      ..insert("\n", {"align": "center"})
      ..insert("\n")
      ..insert("\n")
      ..insert("Tema da Aula: ", {
        "bold": "true",
      })
      ..insert("Antônimos")
      ..insert("\n")
      ..insert("\n")
      ..insert("Objetivos da aula (de aprendizagem e desenvolvimento): ", {
        "bold": "true",
      })
      ..insert("\n")
      ..insert("\n")
      ..insert("Discutir os Antônimos em Libras;")
      ..insert("\n")
      ..insert("\n")
      ..insert("Aumentar o vocabulário em Libras")
      ..insert("\n")
      ..insert("\n")
      ..insert("Relacionar os antônimos em libras de acordo com o cotidiano")
      ..insert("\n")
      ..insert("\n")
      ..insert("Conteúdo: ", {
        "bold": "true",
      })
      ..insert("\n")
      ..insert("\n")
      ..insert("Conceituais: Antônimos em Libras")
      ..insert("\n")
      ..insert("\n")
      ..insert("Procedimentais: Identificar os Antônimos em Libras")
      ..insert("\n")
      ..insert("\n")
      ..insert("Atitudinais: Uso de Antônimos em Libras no cotidiano.")
      ..insert("\n")
      ..insert("\n")
      ..insert("Pergunta (s) essencial(is) da aula: ", {
        "bold": "true",
      })
      ..insert("Como usamos os Antônimos no nosso cotidiano")
      ..insert("\n")
      ..insert("\n")
      ..insert("Palavras-chave: ", {
        "bold": "true",
      })
      ..insert("\n")
      ..insert("\n")
      ..insert("Antônimos – Libras - Cotidiano")
      ..insert("\n")
      ..insert("\n")
      ..insert("Competência a ser desenvolvida (BNCC): ")
      ..insert("\n")
      ..insert("\n")
      ..insert(
          "Utilizar diferentes linguagens – verbal (oral ou visual-motora, como Libras, e escrita), corporal, visual, sonora e digital –, para se expressar e partilhar informações, experiências, ideias e sentimentos em diferentes contextos e produzir sentidos que levem ao diálogo, à resolução de conflitos e à cooperação.")
      ..insert("\n")
      ..insert("\n")
      ..insert("Habilidade (s) da BNCC: ", {
        "bold": "true",
      })
      ..insert("\n")
      ..insert("\n")
      ..insert(
          "(EF02LP10) Identificar sinônimos de palavras de texto lido, determinando a diferença de sentido entre eles, e formar antônimos de palavras encontradas em texto lido pelo acréscimo do prefixo de negação in-/im-.")
      ..insert("\n")
      ..insert("\n")
      ..insert("Recursos didático-pedagógicos para esta aula: ", {
        "bold": "true",
      })
      ..insert("\n")
      ..insert("\n")
      ..insert(
          "Vídeos do youtube; Livro acessível; Jogo da Memória com Antônimos em Libras")
      ..insert("\n")
      ..insert("\n")
      ..insert("Uso de Tecnologias Assistivas: ", {
        "bold": "true",
      })
      ..insert("\n")
      ..insert("\n")
      ..insert("-")
      ..insert("\n")
      ..insert("\n")
      ..insert("Objetos Educacionais Digitais (OEDs): ", {
        "bold": "true",
      })
      ..insert("\n")
      ..insert("\n")
      ..insert("-")
      ..insert("\n")
      ..insert("\n")
      ..insert(
          "Estratégias mediadoras em sala de aula para trabalhar o conteúdo desta aula: ",
          {
            "bold": "true",
          })
      ..insert("\n")
      ..insert("\n")
      ..insert(
          "(   ) Mediação individual (professor) nas atividades e avaliações.")
      ..insert("\n")
      ..insert("\n")
      ..insert("(   ) Trabalhar os conceitos/conteúdos no concreto.")
      ..insert("\n")
      ..insert("\n")
      ..insert(
          "(   ) Proporcionar tempo estendido para realização de atividades e avaliações.")
      ..insert("\n")
      ..insert("\n")
      ..insert("(   ) Reduzir textos e enunciados para melhor compreensão.")
      ..insert("\n")
      ..insert("\n")
      ..insert("(   ) Questões objetivas.")
      ..insert("\n")
      ..insert("\n")
      ..insert("(   ) Correção diferenciada nas avaliações.")
      ..insert("\n")
      ..insert("\n")
      ..insert("(   ) Adaptação curricular.")
      ..insert("\n")
      ..insert("\n")
      ..insert("\n")
      ..insert("\n")
      ..insert("Procedimentos Didático-metodológicos", {"bold": "true"})
      ..insert("\n", {"align": "center"})
      ..insert("\n")
      ..insert("\n")
      ..insert("Desenvolvimento do tema: ", {
        "bold": "true",
      })
      ..insert("\n")
      ..insert("\n")
      ..insert(
          "Vou apresentar o Vídeo do Youtube: https://www.youtube.com/watch?v=NfprdgxxeWU – o que são Antônimos?.")
      ..insert("\n")
      ..insert("\n")
      ..insert(
          "Questionar o que o Vídeo conceitua o que é Antônimo? Então podemos utilizar os Antônimos no nosso cotidiano?")
      ..insert("\n")
      ..insert("\n")
      ..insert(
          "Pedir para que os alunos sinalizem quais Antônimos que conhecemos no nosso cotidiano.")
      ..insert("\n")
      ..insert("\n")
      ..insert("Trabalhar o Jogo da Memória com Antônimos em Libras")
      ..insert("\n")
      ..insert("\n")
      ..insert(
          "Atividades pedagógicas que serão desenvolvidas para promover experiências de aprendizagem: ",
          {
            "bold": "true",
          })
      ..insert("\n")
      ..insert("\n")
      ..insert("Atividades em grupo para trabalhar o Jogo da Memória.")
      ..insert("\n")
      ..insert("\n")
      ..insert(
          "Modelo de Ação (operações) para a realização da atividade pedagógica: ",
          {
            "bold": "true",
          })
      ..insert("\n")
      ..insert("\n")
      ..insert("Trabalho em grupo.")
      ..insert("\n")
      ..insert("\n")
      ..insert("Cooperação.")
      ..insert("\n")
      ..insert("\n")
      ..insert("Colaboração.")
      ..insert("\n")
      ..insert("\n")
      ..insert("Avaliação: ", {
        "bold": "true",
      })
      ..insert("\n")
      ..insert("\n")
      ..insert("Formativa e processual.")
      ..insert("\n")
      ..insert("\n")
      ..insert("Modelo de Controle (autoavaliação): ")
      ..insert("\n")
      ..insert("\n")
      ..insert(
          "Os alunos irão falar sobre as aprendizagens do dia de forma coletiva.")
      ..insert("\n")
      ..insert("\n")
      ..insert("Formas de registro da avaliação: ")
      ..insert("\n")
      ..insert("\n")
      ..insert(
          "Os alunos irão gravar um vídeo em Libras usando os Antônimos que foram aprendidos na aula.")
      ..insert("\n")
      ..insert("\n")
      ..insert("\n")
      ..insert("\n")
      ..insert("Referências", {"bold": "true"})
      ..insert("\n", {"align": "center"})
      ..insert("\n")
      ..insert("\n")
      ..insert(
          "BRASIL. Base Nacional Comum Curricular (BNCC). Educação é a Base. Brasília, MEC/CONSED/UNDIME, 2017. Disponível em: <http://basenacionalcomum.mec.gov.br/images/BNCC_EI_EF_110518_versaofinal_site.pdf>. Acesso em 24/07/2020.")
      ..insert("\n")
      ..insert("\n");

    _controller.compose(endText,
        TextSelection.collapsed(offset: endText.length), ChangeSource.local);
    if (cachedObjects != null) {
      for (var selected in cachedObjects!) {
        // print("selected => $selected");
        var mainList = new Delta()
          ..insert(selected, { "size": "14"})
          ..insert("\n", {"list": "bullet" });

        _controller.compose(
            mainList,
            TextSelection.collapsed(offset: mainList.length),
            ChangeSource.local);
      }
    } else {
      var mainList = new Delta()
        ..insert("\n")
        ..insert("-")
        ..insert("\n");

      _controller.compose(mainList,
          TextSelection.collapsed(offset: mainList.length), ChangeSource.local);
    }
    _controller.compose(startText,
        TextSelection.collapsed(offset: startText.length), ChangeSource.local);

    return _controller.document.toPlainText();
  } catch (err, st) {
    print('Cannot read welcome.json: $err\n$st');
    _controller = _controller;
    return '';
  }
}
