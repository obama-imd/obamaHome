import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:obamahome/components/cores_personalizadas.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class AccordionItem {
  final String accordionTitle;
  final String sectionTitle;
  final String firstParagraph;
  final String secondParagraph;
  final String duration;
  final String thirdParagraph;
  final String urlVideo;

  AccordionItem({
    required this.accordionTitle,
    required this.sectionTitle,
    required this.firstParagraph,
    required this.secondParagraph,
    required this.duration,
    required this.thirdParagraph,
    required this.urlVideo,
  });
}

List<AccordionItem> accordionContent = [
  AccordionItem(
    accordionTitle: "Conhecendo a Plataforma Obama",
    sectionTitle: "Objetivo Geral",
    firstParagraph:
        "Utilizar as funcionalidades da plataforma OBAMA em práticas pedagógicas de Matemática na Educação Básica.",
    secondParagraph:
        "Os dispositivos móveis, como os smartphones, são populares e estão nas mãos dos nossos estudantes. Mas como utilizar esse recurso na sala de aula? É possível utilizar o smartphone nas aulas de matemática? Descubra todo o potencial dessa ferramenta e apresente um mundo novo a seus alunos! Com esta oficina, esperamos que você saia preparado para usar as ferramentas do smartphone com objetivo pedagógico nas aulas de Matemática.",
    duration: "4 Horas",
    thirdParagraph:
        "Para escolas da rede pública localizadas próximas ao campus central da UFRN ou que não gerem custos elevados de transporte, diária e/ou necessidade de refeição para a equipe de formadores (nesses casos cabe aos interessados na formação viabilizar transporte, diária e/ou refeição para os formadores). No caso das instituições privadas será cobrada uma taxa de R\$ 500,00.",
    urlVideo: "FbkEJp004ko",
  ),
  AccordionItem(
    accordionTitle: "Desenvolvimento de Praticas Inovadoras em Matemática",
    sectionTitle: "Objetivo Geral",
    firstParagraph:
        "Elaborar e compartilhar práticas inovadoras em Matemática com suporte da Plataforma OBAMA.",
    secondParagraph:
        "Esta oficina é para você que pretende inovar no ensino da Matemática. A partir da Plataforma OBAMA você vai planejar, inclusive de forma colaborativa, e disponibilizar planos de aulas de Matemática com uso de diferentes tecnologias. Para tanto, você vai conhecer recursos educacionais digitais e metodologias ativas compatíveis com o perfil dos alunos!",
    duration: "4 Horas",
    thirdParagraph:
        "Para escolas da rede pública localizadas próximas ao campus central da UFRN ou que não gerem custos elevados de transporte, diária e/ou necessidade de refeição para a equipe de formadores (nesses casos cabe aos interessados na formação viabilizar transporte, diária e/ou refeição para os formadores). No caso das instituições privadas será cobrada uma taxa de R\$ 500,00.",
    urlVideo: "H9h5qv6rgJo",
  ),
  AccordionItem(
    accordionTitle: "Uso Pedagogico do Smartphone nas Aulas de Matemática",
    sectionTitle: "Objetivo Geral",
    firstParagraph:
        "Reconhecer o smartphone como uma possibilidade pedagógica em Matemática.",
    secondParagraph:
        "A Plataforma OBAMA pode compor seu dia-a-dia como professor de Matemática! Além de buscar e avaliar objetos de aprendizagem (OA), classificados por critérios pedagógicos como blocos de conteúdos e habilidades matemática, você poderá elaborar seu plano de aula com suporte da Plataforma e, inclusive, deixá-lo disponível para outras pessoas acessá-lo! Quer saber mais sobre essas tecnologias digitais na Educação Matemática? Participe desta oficina!",
    duration: "4 Horas",
    thirdParagraph:
        "Para escolas da rede pública localizadas próximas ao campus central da UFRN ou que não gerem custos elevados de transporte, diária e/ou necessidade de refeição para a equipe de formadores (nesses casos cabe aos interessados na formação viabilizar transporte, diária e/ou refeição para os formadores). No caso das instituições privadas será cobrada uma taxa de R\$ 500,00.",
    urlVideo: "dI4mU8IBk4o",
  ),
  AccordionItem(
    accordionTitle:
        "Ferramentas Colaborativas do Google Drive : Aplicações do Google Docs e Slides para o Ensino e Aprendizado",
    sectionTitle: "Objetivo Geral",
    firstParagraph:
        "Utilizar as ferramentas do Google Drive como apoio pedagógico para o ensino e aprendizagem.",
    secondParagraph:
        "A oficina de Documentos e Apresentações Google é para que, junto com você e o grupo de participantes da oficina, possamos discutir e utilizar o conhecimento de ferramentas digitais colaborativas e suas aplicações para o ensino e aprendizado. Colocaremos a mão na massa, sem medo de clicar, explorar e descobrir o mundo das ferramentas digitais colaborativas.",
    duration: "4 Horas",
    thirdParagraph:
        "Para escolas da rede pública localizadas próximas ao campus central da UFRN ou que não gerem custos elevados de transporte, diária e/ou necessidade de refeição para a equipe de formadores (nesses casos cabe aos interessados na formação viabilizar transporte, diária e/ou refeição para os formadores). No caso das instituições privadas será cobrada uma taxa de R\$ 500,00.",
    urlVideo: "5Xqk5BcbL-8",
  ),
  AccordionItem(
    accordionTitle:
        "Ferramentas do Google For Education: Aplicações do Google Forms e Classroom para o Ensino e Aprendizado",
    sectionTitle: "Objetivo Geral",
    firstParagraph:
        "Utilizar o Google Classroom e o Google Forms como ferramentas pedagógicas.",
    secondParagraph:
        "Com esta oficina buscamos que você e o grupo de participantes da oficina vivenciem, desenvolvam e compartilhem práticas com simulações de situações reais utilizando o Google Classroom e o Google Forms. Envolvendo teoria e prática, este é o momento ideal para colocar a mão na massa e se aventurar mais em suas aulas utilizando, também, uma sala de aula virtual com seus alunos e colegas de trabalho.",
    duration: "4 Horas",
    thirdParagraph:
        "Para escolas da rede pública localizadas próximas ao campus central da UFRN ou que não gerem custos elevados de transporte, diária e/ou necessidade de refeição para a equipe de formadores (nesses casos cabe aos interessados na formação viabilizar transporte, diária e/ou refeição para os formadores). No caso das instituições privadas será cobrada uma taxa de R\$ 500,00.",
    urlVideo: "krWykANooFs",
  ),
  AccordionItem(
    accordionTitle: "InRede Visita Tecnica",
    sectionTitle: "Objetivo Geral",
    firstParagraph:
        "Reestruturar o espaço digital das escolas públicas por meio da mão de obra realizada pela sua equipe.",
    secondParagraph:
        "Sua escola está limitada ou não têm como realizar as atividades digitais por problemas em seu laboratório de informática? Nós do projeto InREDE podemos ajudar a sua escola!",
    duration: "Indeterminado",
    thirdParagraph: "",
    urlVideo: "FBqMLUSdYoU",
  ),
];

class Dropdowns extends StatelessWidget {
  const Dropdowns({super.key});

  @override
  Widget build(BuildContext context) {
    // Exemplo de inicialização da lista de AccordionItem
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(children: [
        for (var lista in accordionContent) ...{
          ExpansionTile(
              title: Row(children: [
                SizedBox(height: 30, width: 2),
                Icon(FontAwesomeIcons.chartColumn, size: 19),
                SizedBox(height: 30, width: 10),
                Text(lista.accordionTitle,
                    style: TextStyle(color: Colors.black)),
              ]),
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      width: MediaQuery.of(context).size.width * .5,
                      height: 500,
                      child: ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Text(lista.sectionTitle,
                                style: TextStyle(
                                    height: 1.4, fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Text(lista.firstParagraph,
                                style: TextStyle(height: 1.4)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Text(lista.secondParagraph,
                                style: TextStyle(height: 1.4)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Row(
                              children: [
                                Text("Duração da Formação: ",
                                    style: TextStyle(
                                        height: 1.4, fontWeight: FontWeight.bold)),
                                Text(lista.duration, style: TextStyle(height: 1.4)),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 15),
                            decoration: BoxDecoration(border: Border(left: BorderSide(width: 5, color: CoresPersonalizadas.azulObama))),
                            child: Text(lista.thirdParagraph,
                                style: TextStyle(height: 1.4)),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      width: MediaQuery.of(context).size.width * .44,
                      height: 500,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Text('Vídeo de apresentação',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(
                              height: 300,
                              child: Container(
                                  child: CustomVideo(urlVideo: lista.urlVideo)))
                        ],
                      ),
                    ),
                  ],
                ),
              ]),
          SizedBox(height: 20, width: 10),
        },
      ]),
    );
  }
}

class CustomVideo extends StatelessWidget {
  final String urlVideo;

  CustomVideo({Key? key, required this.urlVideo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: urlVideo,
      params: const YoutubePlayerParams(
        autoPlay: true,
        mute: false,
      ),
    );

    return Scaffold(
      body: Center(
        child: YoutubePlayerIFrame(
          controller: _controller,
          aspectRatio: 16 / 9,
        ),
      ),
    );
  }
}
