import 'package:flutter/material.dart';
import 'package:obamahome/app/models/lesson_plan_models.dart';
import 'package:obamahome/app/views/lessons/controller.dart';
import 'package:obamahome/components/navMenu.dart';
import 'package:obamahome/components/topbar.dart';
import 'package:obamahome/utils/cores_personalizadas.dart';

import '../../../utils/app_theme.dart';
import 'components/pageView/pageViewFirst.dart';
import 'components/pageView/pageViewSecond.dart';
import 'components/textEditorClass.dart';

final List<(String, TextEditingController)> pageHints = [
  (
    'Qual o nome da instituição a que se destina esse plano de aula?*',
    new TextEditingController()
  ),
  (
    'Escreva uma frase curta que defina sua aula.*',
    new TextEditingController()
  ),
  (
    'A qual ano de ensino esta proposta de aula melhor se aplica?*',
    new TextEditingController()
  ),
  (
    'Quanto tempo (em minutos) você acha necessário para a aplicação deste plano de aula?*',
    new TextEditingController()
  )
];

List<String> options = <String>[
  'Infantil - EDUCAÇÃO INFANTIL',
  '1º Ano - ANOS INICIAIS',
  '2º Ano - ANOS INICIAIS',
  '3º Ano - ANOS INICIAIS',
  '4º Ano - ANOS INICIAIS',
  '5º Ano - ANOS INICIAIS',
  '6º Ano - ANOS FINAIS',
  '7º ano - ANOS FINAIS'
];

class NewLessonPlan extends StatefulWidget {
  const NewLessonPlan({super.key});

  @override
  State<NewLessonPlan> createState() => _NewLessonPlanState();
}

class _NewLessonPlanState extends State<NewLessonPlan> {
  late PageController _pageViewController;
  int stepSelected = 0;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
  }

  List<Widget> paveViewContent = [PageViewFirst(), PageViewSecond()];
  String escola = '';
  String titulo = '';
  int duracao = 0;

  // void _updateCurrentPageIndex(int index) {
  //   // _tabController.index = index;
  //   _pageViewController.animateToPage(
  //     index,
  //     duration: const Duration(milliseconds: 400),
  //     curve: Curves.easeInOut,
  //   );
  // }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    double logoWidth = 250;

    if (swidth < 700) {
      logoWidth = 180;
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          TopBar(swidth),
          Container(
            margin: EdgeInsets.symmetric(horizontal: swidth * .1),
            padding: const EdgeInsets.only(top: 35, bottom: 15),
            constraints: BoxConstraints(maxWidth: 1200),
            child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (swidth > 1024) ...{
                    Image.asset("assets/images/logo.png", width: logoWidth),
                  } else ...{
                    Container(
                      width: 100,
                      child: Image.asset("assets/images/icone.png"),
                    )
                  },
                  NavMenu(
                    swidth: swidth,
                    heightBtn: 50,
                    itemValues: getEditorValues(() {
                      setState(() {
                        escola = pageHints[0].$2.text;
                        titulo = pageHints[1].$2.text;
                        duracao = int.parse(pageHints[3].$2.text);
                        saveNewLessonPlan(LessonPlanModel(
                            escola: escola,
                            idNivelEnsino: 1,
                            disciplinasEnvolvida: [1],
                            idAnoEnsino: 1,
                            duracaoEmMinutos: duracao,
                            titulo: titulo,
                            metodologia: '',
                            objetivosEspecificos: '',
                            objetivoGeral: '',
                            avaliacao: '',
                            referencias: ''));
                      });
                    }),
                    searchAvailable: false,
                  )
                ]),
          ),
          Container(
            width: swidth,
            padding: EdgeInsets.only(top: 15),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              for (var i = 0; i < 2; i++) ...{
                Material(
                  child: InkWell(
                    child: Container(
                      width: swidth > 1200 ? 1200 * .5 : swidth * .5,
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 2,
                                  color: stepSelected == i
                                      ? CoresPersonalizadas.azulObama
                                      : onPrimary))),
                      // padding: EdgeInsets.only(bottom: 10),
                      child: Center(
                          child: Text("Passo ${i + 1}",
                              style: TextStyle(
                                  fontWeight: stepSelected == i
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  color: stepSelected == i
                                      ? CoresPersonalizadas.azulObama
                                      : onPrimary))),
                    ),
                    onTap: () {
                      setState(() {
                        stepSelected = i;
                      });
                      if (_pageViewController.hasClients) {
                        _pageViewController.animateToPage(
                          i,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                  ),
                )
              }
            ]),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: PageView.builder(
                controller: _pageViewController,
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  return Material(
                    child: Column(children: [paveViewContent[index]]),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
