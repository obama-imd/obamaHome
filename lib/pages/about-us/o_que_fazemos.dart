import 'package:flutter/material.dart';

class OqueFazemos extends StatelessWidget {
  const OqueFazemos({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'A Plataforma OBAMA é um repositório que faz a catalogação de Objetos de Aprendizagem (OA) \n'
      'classificados a partir de critérios pedagógicos e técnicos,\n'
      'com conteúdos explorados e habilidades que podem ser desenvolvidas \n'
      'em plataformas de funcionamento diferentes (desktop ou mobile).\n'

      'Além do desenvolvimento do repositório para ajudar professores da Educação Básica\n'
      'a encontrar recursos educativos digitais para diversificar as estratégias \n'
      'de ensino de Matemática em sala de aula, a OBAMA intenciona formar docentes para a busca,\n'
      'utilização e integração dos OA em processos de ensino e aprendizagem.\n'
      'A plataforma também tem mapeados e catalogados aplicativos voltados para o \n'
      'ensino da Matemática segundo as habilidades trabalhadas na Prova Brasil\n'
      'e na Base Nacional Comum Curricular (BNCC).\n'
      'São exemplos de OA’s animações, simulações, jogos educativos e softwares,\n'
      'os quais podem ser favoritados e até compor planos virtuais de aulas,\n'
      'recurso permitido para docentes cadastrados na OBAMA.\n\n',
        textScaleFactor: 1.1,
        style: TextStyle(color: Colors.grey)
    );
  }
}
