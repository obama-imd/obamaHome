import 'package:flutter/material.dart';
import 'package:obamahome/components/mainButton.dart';
import 'package:obamahome/utils/app_padding.dart';
import 'package:obamahome/utils/cores_personalizadas.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../../../components/sectionTitle.dart';
import '../../../../templates/template_basic_col.dart';
import '../../../../utils/app_theme.dart';
import '../constants.dart';

class TrilhasDesktop extends StatefulWidget {
  const TrilhasDesktop({super.key});
  @override
  State<TrilhasDesktop> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<TrilhasDesktop> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    return TemplateColumn(children: [
      Container(
        padding: paddingValues("carouselTop", context),
        margin: EdgeInsets.only(bottom: 75),
        child: Stack(
          children: [
            Container(
                width: swidth,
                height: 1200,
                color: CoresPersonalizadas.azulObama),
            Container(
                width: swidth * .7,
                height: 1200,
                color: const Color.fromARGB(255, 241, 238, 238),
                padding: paddingValues("sideMainPadding", context)),
            Center(
              child: Container(
                constraints: BoxConstraints(maxWidth: 1200),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            constraints: BoxConstraints(maxWidth: 900),
                            padding: paddingValues("sectionPadding", context),
                            child: SectionTitle(
                                'Trilhas de aprendizagem',
                                'Como o nome já diz, as trilhas que você acessará aqui são dicas para seguir um caminho e conhecer as principais funcionalidades das mais importantes ferramentas do Google que podem te auxiliar no processo de ensino remoto. Ah, e nós já trilhamos o caminho das pedras por você. Então agora basta você ir respondendo às perguntas, quando houver, e seguir as instruções. Bons estudos!',
                                CrossAxisAlignment.start),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              constraints: BoxConstraints(maxWidth: 900),
                              padding: paddingValues("fullGrid", context),
                              child: ResponsiveGridRow(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    for (int i = 0;
                                        i < sectionImage.length;
                                        i++) ...{
                                      ResponsiveGridCol(
                                        lg: 6,
                                        sm: 12,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 100),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 25),
                                                  child: ClipOval(
                                                      child: Container(
                                                    color: background,
                                                    padding:
                                                        const EdgeInsets.all(
                                                            20),
                                                    child: Image.asset(
                                                      "assets/images/" +
                                                          sectionImage[i],
                                                      fit: BoxFit.contain,
                                                      width: 130,
                                                      height: 130,
                                                    ),
                                                  )),
                                                ),
                                                // Image.asset(
                                                //     "assets/images/" +
                                                //         sectionImage[i],
                                                //     width: 200, height: 200, ),
                                                mainButton(
                                                    context,
                                                    "Acessar Trilha",
                                                    sectionLinks[i],
                                                    null)
                                              ]),
                                        ),
                                      ),
                                    },
                                  ])),
                        ],
                      )
                    ]),
              ),
            ),
          ],
        ),
      )
    ]);
  }
}
