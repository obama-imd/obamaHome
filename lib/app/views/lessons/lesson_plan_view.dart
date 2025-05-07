import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:obamahome/app/controllers/lessons_controller.dart';
import 'package:obamahome/app/models/lesson_plan_models.dart';
import 'package:obamahome/templates/template_basic_col.dart';
import 'package:obamahome/utils/app_padding.dart';
import 'package:obamahome/utils/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class ListLessonPlan extends ConsumerStatefulWidget {
  const ListLessonPlan({super.key});

  @override
  _ListLessonPlanState createState() => _ListLessonPlanState();
}

class _ListLessonPlanState extends ConsumerState<ListLessonPlan> {
  String searchTerm = "";
  int _currentPage = 0;
  int _itemsPerPage = 10;
  List<LessonPlanModel> lessonsData = [
    LessonPlanModel(
      escola: "Escola Estadual João Silva",
      idNivelEnsino: 2,
      disciplinasEnvolvida: [1, 3],
      idAnoEnsino: 3,
      duracaoEmMinutos: 50,
      titulo: "Introdução à Cinemática",
      autores: "SOUZA, José; MAIA, João",
      metodologia: "Aula expositiva com uso de vídeos e experimentos simples.",
      objetivosEspecificos: "Compreender conceitos de velocidade e aceleração.",
      objetivoGeral:
          "Introduzir os fundamentos da cinemática para análise de movimentos.",
      avaliacao:
          "Questionário com perguntas objetivas e experimentos práticos.",
      referencias:
          "Livro de Física - Volume 1, autor X; Vídeos do Canal Y no YouTube.",
    ),
    LessonPlanModel(
      escola: "Colégio Modelo Maria Fernandes",
      idNivelEnsino: 1,
      disciplinasEnvolvida: [2],
      idAnoEnsino: 5,
      duracaoEmMinutos: 45,
      titulo: "Frações na Vida Real",
      autores: "SOUZA, José; MAIA, João",
      metodologia:
          "Atividades em grupo e jogos educativos com materiais concretos.",
      objetivosEspecificos: "Resolver problemas simples com frações.",
      objetivoGeral: "Entender o uso de frações em situações do cotidiano.",
      avaliacao: "Atividades práticas e autoavaliação com base nos jogos.",
      referencias:
          "Livro de Matemática - Editora ABC; Jogo 'Frações Divertidas'.",
    ),
    LessonPlanModel(
      escola: "Colégio Modelo Maria Fernandes",
      idNivelEnsino: 1,
      disciplinasEnvolvida: [2],
      idAnoEnsino: 5,
      duracaoEmMinutos: 45,
      titulo: "Frações na Vida Real",
      autores: "JOÃO, Maria; SOUZA, José",
      metodologia:
          "Atividades em grupo e jogos educativos com materiais concretos.",
      objetivosEspecificos: "Resolver problemas simples com frações.",
      objetivoGeral: "Entender o uso de frações em situações do cotidiano.",
      avaliacao: "Atividades práticas e autoavaliação com base nos jogos.",
      referencias:
          "Livro de Matemática - Editora ABC; Jogo 'Frações Divertidas'.",
    ),
    LessonPlanModel(
      escola: "Colégio Modelo Maria Fernandes",
      idNivelEnsino: 1,
      disciplinasEnvolvida: [2],
      idAnoEnsino: 5,
      duracaoEmMinutos: 45,
      titulo: "Frações na Vida Real",
      autores: "DARC, Joana; MAIA, José",
      metodologia:
          "Atividades em grupo e jogos educativos com materiais concretos.",
      objetivosEspecificos: "Resolver problemas simples com frações.",
      objetivoGeral: "Entender o uso de frações em situações do cotidiano.",
      avaliacao: "Atividades práticas e autoavaliação com base nos jogos.",
      referencias:
          "Livro de Matemática - Editora ABC; Jogo 'Frações Divertidas'.",
    ),
  ];

  // void initState() {
  //   super.initState();
  //   fetchLessonPlan().then((value) {
  //   });
  // }

  // List<LessonPlanModel> _pagedItems(List<LessonPlanModel> data) {
  //   int startIndex = _currentPage * _itemsPerPage;
  //   int endIndex = startIndex + _itemsPerPage;
  //   if (endIndex > data.length) {
  //     endIndex = data.length;
  //   }
  //   return data.sublist(startIndex, endIndex);
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: randomName(searchTerm, ref),
      builder: (context, snapshot) {
        List<LessonPlanModel> data = lessonsData;
        return TemplateColumn(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 90),
              child: Container(
                constraints: BoxConstraints(maxWidth: 1200),
                color: borderInput,
                margin: paddingValues("carouselTop", context),
                padding: paddingValues("sideMainPadding", context),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                        child: TextField(
                          decoration: InputDecoration(
                              constraints: BoxConstraints(
                                  maxWidth: 600, minWidth: 200, maxHeight: 50),
                              filled: true,
                              fillColor: background,
                              focusColor: background,
                              hoverColor: background,
                              labelStyle: TextStyle(fontSize: 14),
                              hintText: "Busca",
                              hintStyle: textTheme.bodySmall,
                              // contentPadding: EdgeInsets.all(5),
                              border: InputBorder.none),
                          // suffixIcon: Icon(CupertinoIcons.search,
                          //     color: secondary, size: 16)),
                          onChanged: (value) {
                            setState(() {
                              searchTerm = value;
                            });
                          },
                          onSubmitted: (value) {
                            setState(() {
                              searchTerm = value;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            _buildHeader(),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                final lessonPlan = data[index];
                                return _buildRow(
                                  lessonPlan.titulo,
                                  lessonPlan.autores,
                                  lessonPlan.escola,
                                  index,
                                );
                              },
                            ),
                          ],
                        ),
                      )
                      // Row(
                      //   crossAxisAlignment: CrossAxisAlignment.center,
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [
                      //     Container(
                      //       width: 100,
                      //       padding: EdgeInsets.all(10.0),
                      //       child: Scrollbar(
                      //         controller: _scrollController,
                      //         child: SingleChildScrollView(
                      //           scrollDirection: Axis.horizontal,
                      //           controller: _scrollController,
                      //           child: Row(
                      //             mainAxisAlignment: MainAxisAlignment.start,
                      //             crossAxisAlignment: CrossAxisAlignment.start,
                      //             children: List.generate(
                      //               10,
                      //               (index) => Container(
                      //                 width: 20,
                      //                 padding: EdgeInsets.all(0.0),
                      //                 margin: EdgeInsets.all(0.0),
                      //                 child: TextButton(
                      //                   style: ButtonStyle(
                      //                     padding: WidgetStateProperty.all<
                      //                         EdgeInsetsGeometry>(
                      //                       EdgeInsets.symmetric(
                      //                         horizontal: 0.0,
                      //                       ),
                      //                     ),
                      //                     shape: WidgetStatePropertyAll(
                      //                       RoundedRectangleBorder(
                      //                         side: BorderSide.none,
                      //                       ),
                      //                     ),
                      //                     overlayColor: WidgetStatePropertyAll(
                      //                       Color(0x00000000),
                      //                     ),
                      //                     backgroundColor: WidgetStatePropertyAll(
                      //                       Color(0x00000000),
                      //                     ),
                      //                   ),
                      //                   onPressed: () {
                      //                     setState(
                      //                       () {
                      //                         _currentPage = index;
                      //                       },
                      //                     );
                      //                   },
                      //                   child: Text(
                      //                     (index + 1).toString(),
                      //                     style: TextStyle(
                      //                       fontFamily: 'Raleway',
                      //                       fontSize: 15,
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildHeader() {
    return Material(
      child: Container(
        color: borderInput,
        padding: const EdgeInsets.all(12.0),
        margin: const EdgeInsets.all(0.0),
        child: const Row(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 3.0,
                ),
                child: Text(
                  'Título',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                'Autores',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                // 'Data de Publicação',
                'Instituição',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                'Baixar PDF',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String title, String author, String institution, int Index) {
    return Material(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Index % 2 > 0
              ? background
              : const Color.fromARGB(211, 219, 218, 218),
          border: const Border(
            bottom: BorderSide(
              width: 0.5,
              color: Colors.black87,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(author),
              ),
              Expanded(
                flex: 1,
                child: Text(institution),
              ),
              Expanded(
                flex: 1,
                child: InkWell(
                  hoverColor: const Color(0x00000001),
                  onTap: () {
                    final Uri url = Uri.parse(
                        "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf");
                    launchUrl(url);
                  },
                  child: Icon(FontAwesomeIcons.filePdf),
                  // _flutterMediaDownloaderPlugin.downloadMedia(context,
                  //     'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf');
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
