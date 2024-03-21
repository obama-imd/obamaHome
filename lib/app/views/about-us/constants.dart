import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AccordionItem {
  final String accordionTitle;
  final String accordionContent;

  AccordionItem({
    required this.accordionTitle,
    required this.accordionContent,
  });
}

List<AccordionItem> accordionItems = [
  AccordionItem(  
    accordionTitle: "O que nós fazemos?",
    accordionContent: 'A Plataforma OBAMA é um repositório que faz a catalogação de Objetos de Aprendizagem (OA) classificados a partir de critérios pedagógicos e técnicos, com conteúdos explorados e habilidades que podem ser desenvolvidas em plataformas de funcionamento diferentes (desktop ou mobile). Além do desenvolvimento do repositório para ajudar professores da Educação Básica a encontrar recursos educativos digitais para diversificar as estratégias de ensino de Matemática em sala de aula, a OBAMA intenciona formar docentes para a busca, utilização e integração dos OA em processos de ensino e aprendizagem. A plataforma também tem mapeados e catalogados aplicativos voltados para o ensino da Matemática segundo as habilidades trabalhadas na Prova Brasil e na Base Nacional Comum Curricular (BNCC). São exemplos de OA’s animações, simulações, jogos educativos e softwares, os quais podem ser favoritados e até compor planos virtuais de aulas, recurso permitido para docentes cadastrados na OBAMA.'
  ),
  AccordionItem(
    accordionTitle: "Nossa História",
    accordionContent: "A história do Obama começa no ano de 2010 com o professor Dennys Leite Maia, formado em Pedagogia, que na época ainda era estudante de Mestrado na Universidade Estadual do Ceará (UECE) e fazia muitas formações de professores mostrando os objetos de aprendizagem e tecnologias digitais."
    "\n\nA principal tecnologia existente nesse período eram os objetos de aprendizagem e durante as formações, Dennys Leite apresentava uma lista com 8 a 10 repositórios para as pessoas identificarem, guardarem os endereços e buscarem os objetos de aprendizagem."
    "\n\nDurante as formações, ele percebeu a dificuldade dos professores, seja porque tinham pouca fluência tecnológica ou porque não lembravam qual era o objeto e em qual repositório estava. Diante desse cenário, Dennys percebeu que seria ótimo se existisse um ambiente que armazenasse, de forma organizada, todos os objetos de aprendizagem e os professores só tivessem a preocupação de identificar as habilidades que desejassem trabalhar com os alunos."
    "\n\nApós terminar o Mestrado, Dennys assumiu como professor substituto na UECE, na área de tecnologia educacionais e Educação em Matemática e junto com o os bolsistas de iniciação científica do Grupo de Pesquisa Matemática e Ensino (MAES), teve a ideia de criar um repositório e assim nasceu o Obama (Objetos de Aprendizagem de Matemática)."
    "\n\nO Obama foi lançado em 2013  como um Google Site, que consistia em uma lista com os títulos dos objetos e com os links para onde eles estavam hospedados. Quem usasse o site tinha que fazer uma busca manual (teclas ctrl +f), usando o nome do objeto ou palavras chaves para encontrar o objeto desejado."
    "\n\nDurante as formações, Dennys Leite recebia feedback positivos dos professores pois o repositório ajudava muito, mesmo com limitações de design de interface e de interatividade, pois já reunia metadados relevantes para a classificação e busca de OA, como: nível de ensino, blocos de conteúdos e descritores da Prova Brasil, além de possuir mais de 260 Objetos de Aprendizagem do tipo animação/simulação."
    "\n\nCom a aprovação no concurso da Universidade Federal do Rio Grande do Norte, no final de 2014, o professor Dennys Leite se mudou para a capital potiguar e o projeto passou a fazer parte do Grupo Interdisciplinar de Estudos e Pesquisas em Informática na Educação (GIIFE), vinculado ao Instituto Metrópole Digital (IMD) da UFRN."
    "\n\nEm 2016  o projeto tomou corpo com a aprovação do projeto de pesquisa “Objetos de Aprendizagem para o ensino de Matemática: pesquisa, formação e desenvolvimento”, aprovado pela Pró-Reitoria de Pesquisa da UFRN."
    "\n\nHouve a primeira seleção de bolsista do projeto, com o propósito de avançar na concepção do repositório e criar mecanismos para melhorar a busca a partir dos critérios utilizados anteriormente e outros critérios pedagógicos como as habilidades da Base Nacional Comum Curricular (BNCC)."
    "Foi necessário atualizar e aperfeiçoar a estrutura do OBAMA. A atualização do repositório de OA para Matemática, empreendida pelo IMD/UFRN, ficou conhecida como “OBAMA 2.0” e teve seu lançamento em 2017 no II Congresso sobre Tecnologias na Educação (Ctrl+E 2017), na Paraíba, onde foi lançado como repositório com sistema de busca e recebeu prêmio de melhor oficina durante o evento."
    "\n\nO grande diferencial era o sistema de busca, utilizando os critérios de habilidade das áreas de conhecimento da matemática e habilidades da BNCC, se tornando referência e sendo utilizado atualmente em outros repositórios de recursos educativos."
    "\n\nA partir de 2018 foi implementada a função de plano de aula onde a pessoa pode criar um planejamento de aula vinculando um OA (ou não) e podendo compartilhar, transformando o Obama em uma plataforma. No mesmo ano, o Obama conquistou o segundo lugar como melhor protótipo do Congresso Brasileiro de Informática na Educação (CBIE)."
    "\n\nEm 2019 a plataforma passou a ofertar trilhas de aprendizagem, ou seja, tutoriais de uso simples, disponíveis para google classroom, google forms, google meet, gmail e formações (Conhecendo a Plataforma Obama, Desenvolvimento de Práticas Inovadoras em Matemática e Uso Pedagógico do Smartphone nas Aulas de Matemática, Ferramentas colaborativas do Google Drive, ferramentas do Google for education e visita técnica)."
    "\n\nAtualmente, a maioria dos OAs disponíveis no OBAMA são oriundos de instituições produtoras ou que hospedam os recursos, mas também contam com alguns desenvolvidos diretamente ou em parceria pela equipe do Obama como o OA bicalculo, disponível na plataforma desde 2016. "
    "O Obama conta com vinte e três fontes de OA para desktop e sete repositórios de apps educativos. Portanto, em um único repositório, professores passam a ter acesso a trinta bases diferentes de recursos educativos digitais para a Matemática."
    "Hoje fazem parte do projeto professores do IMD e estudantes do curso técnico e de bacharelado em Tecnologia da Informação e dos cursos de Licenciatura em Matemática e Pedagogia.",
  ),
];

  List<String> LeaderNames = [
    "Dennys Leite Maia",
    // "Nelson Ion de Oliveira",
  ];

  List<String> LeaderImgs = [
    "assets/images/DennysLeite.png",
    // "assets/images/nelson.jpg",
  ];

  List<String> staffNames = [
    "Amanda Maria",
    "Ana Carolina",
    "Dênis Silva",
    "Flávia Viana",
    "Gabriel Barreto",
    "Giluiza Borges",
    "Igor Rauan",
    "Lucas Toshio",
    "Mayara Cabral",
    "Sara Rocha",
  ];

  List<String> staffImgs = [
    "assets/images/AmandaMaria.jpg",
    "assets/images/AnaCarolina.jpg",
    "assets/images/DenisSilva.jpg",
    "assets/images/FláviaViana.jpg",
    "assets/images/GabrielBarreto.png",
    "assets/images/GiluizaCatarina.jpeg",
    "assets/images/IgorRauan.jpg",
    "assets/images/LucasToshio.jpg",
    "assets/images/MayaraCabral.jpg",
    "assets/images/SaraSilva.png"
  ];

  List<String> grid1Title = [
    "Objetos de Aprendizagem",
    "Planos de Aula",
    "Publicações",
    "Formações",
  ];

  List<IconData> grid1Icon = [
    FontAwesomeIcons.wrench,
    Icons.settings,
    Icons.settings_backup_restore_rounded,
    FontAwesomeIcons.heart,
  ];

  List<double> iconSize = [38, 44, 46, 39];

  List<String> grid1Content = [
    "nononon nono nonon non !",
    "nononon nono nonon non !",
    "nononon nono nonon non !",
    "nononon nono nonon non !",
  ];