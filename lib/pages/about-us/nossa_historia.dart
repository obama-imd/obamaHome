import 'package:flutter/material.dart';

class NossaHistoria extends StatelessWidget {
  const NossaHistoria({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        padding: EdgeInsets.all(20.0),

        child: SingleChildScrollView(
          child: const Text(

          "Nossa história\n\n"
          "Era uma vez…   A história do Obama começa no ano de 2010 com o professor Dennys Leite Maia, formado em Pedagogia, que na época ainda era estudante de Mestrado na Universidade Estadual do Ceará  (UECE) e fazia muitas formações de professores mostrando os objetos de aprendizagem e tecnologias digitais.\n\n"
          "A  principal tecnologia existente nesse período eram os objetos de aprendizagem e durante as formações, Dennys Leite apresentava uma lista com 8 a 10 repositórios para as pessoas identificarem, guardarem os endereços e buscarem os objetos de aprendizagem."
          "Durante as formações, ele percebeu a dificuldade dos professores, seja porque tinham pouca fluência tecnológica ou porque não lembravam qual era o objeto e em qual repositório estava. Diante desse cenário, Dennis percebeu que seria ótimo se existisse um ambiente que armazenasse, de forma organizada, todos os objetos de aprendizagem e os professores só tivessem a preocupação de identificar as habilidades que desejassem trabalhar com os alunos."
          "\n\nApós terminar o Mestrado, Dennys assumiu como professor substituto na UECE, na área de tecnologia educacionais e Educação em Matemática e junto com o os bolsistas de iniciação científica do Grupo de Pesquisa Matemática e Ensino (MAES), teve a ideia de criar um repositório e assim nasceu o Obama (Objetos de Aprendizagem  de Matemática)."
          "O Obama  foi  lançado em 2013  como um Google Site, que consistia em uma lista com os títulos dos objetos e com os links para onde eles estavam hospedados. Quem usasse o site tinha que fazer uma busca manual (teclas ctrl +f), usando o nome do objeto ou palavras chaves para encontrar o objeto desejado."
          "Durante as formações, Dennys Leite recebia feedback positivos dos professores pois o repositório ajudava muito, mesmo com limitações de design de interface e de interatividade, pois já reunia metadados relevantes para a classificação e busca de OA, como: nível de ensino, blocos de conteúdos e descritores da Prova Brasil, além de possuir  mais de 260 Objetos de Aprendizagem do tipo animação/simulação.\n"
          "\nCom a aprovação no  concurso da Universidade Federal do Rio Grande do Norte, no final de 2014, o professor Dennys Leite se mudou para a capital potiguar e o projeto passou  a fazer parte do Grupo Interdisciplinar de Estudos e Pesquisas em Informática na Educação (GIIFE), vinculado ao Instituto Metrópole Digital (IMD) da UFRN."
          "Em 2016  o projeto tomou corpo  com a aprovação do projeto de pesquisa “Objetos de Aprendizagem para o ensino de Matemática: pesquisa, formação e desenvolvimento”, aprovado pela Pró-Reitoria de Pesquisa da UFRN."
    "Houve a primeira seleção de bolsista do projeto, com o propósito de avançar na concepção do repositório e criar mecanismos para melhorar a busca a partir dos critérios utilizados anteriormente e  outros critérios pedagógicos como as habilidades da Base Nacional Comum Curricular (BNCC)."
    "Foi necessário atualizar e aperfeiçoar a estrutura do OBAMA.  A atualização do repositório de OA para Matemática, empreendida pelo  IMD/UFRN, ficou conhecida como “OBAMA 2.0” e teve seu lançamento em 2017 no II Congresso sobre Tecnologias na Educação (Ctrl+E 2017), na Paraíba, onde foi lançado como repositório com sistema de busca e recebeu prêmio de melhor oficina durante o evento."
    "\n\nO grande diferencial era o sistema de busca, utilizando os critérios de habilidade das áreas de conhecimento da matemática e habilidades da BNCC, se tornando referência e sendo   utilizado atualmente em outros repositórios de recursos educativos."
    "A partir de 2018 foi implementada a função de  plano de aula onde a pessoa pode criar um planejamento de aula vinculando um OA (ou não) e podendo compartilhar, transformando o Obama em uma plataforma. No mesmo ano, o Obama conquistou o segundo lugar como melhor protótipo do Congresso Brasileiro de Informática na Educação (CBIE).\n\n"
    "Em 2019 a plataforma passou a ofertar trilhas de aprendizagem, ou seja, tutoriais de uso simples, disponíveis para google classroom, google forms, google meet, gmail e formações (Conhecendo a Plataforma Obama, Desenvolvimento de Práticas Inovadoras em Matemática e Uso Pedagógico do Smartphone nas Aulas de Matemática, Ferramentas colaborativas do Google Drive, ferramentas do Google for education e visita técnica)."
    "Atualmente, a maioria dos OAs disponíveis no OBAMA são oriundos de instituições produtoras ou que hospedam os recursos, mas também contam com alguns desenvolvidos diretamente ou em parceria pela equipe do Obama como o OA bicalculo, disponível na plataforma desde 2016."
          "O Obama conta com vinte e três fontes de OA para desktop e sete repositórios de apps educativos. Portanto, em um único repositório, professores passam a ter acesso a trinta bases diferentes de recursos educativos digitais para a Matemática."
          "Hoje fazem parte do projeto professores do IMD e estudantes do curso técnico e de bacharelado em Tecnologia da Informação e dos cursos de Licenciatura em Matemática e Pedagogia.\n\n\n\n\n\n\n\n\n\n\n\\n\n\n"
         , style: TextStyle(
            fontSize: 14,

          ), ),
        ),
      ),
    );

  }
}