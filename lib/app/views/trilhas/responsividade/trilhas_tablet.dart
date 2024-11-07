import 'package:flutter/material.dart';
import 'package:obamahome/components/mainButton.dart';
import 'package:obamahome/utils/cores_personalizadas.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../../../components/sectionTitle.dart';
import '../../../../templates/template_basic_col.dart';
import '../../../../utils/app_theme.dart';
import '../constants.dart';

class TrilhasTablet extends StatefulWidget {
  const TrilhasTablet({super.key});
  @override
  State<TrilhasTablet> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<TrilhasTablet> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    return TemplateColumn(children: [
      // BannerSuperior(context, "Trilhas de Aprendizagem"),
      Container(
          margin: const EdgeInsets.only(top: 120),
          width: swidth,
          color: CoresPersonalizadas.azulObama,
          child: ResponsiveGridRow(children: [
            ResponsiveGridCol(
              lg: 8,
              sm: 12,
              child: Container(
                  color: const Color.fromARGB(255, 241, 238, 238),
                  padding: EdgeInsets.only(right: 90, left: 90),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 110, bottom: 90),
                          child: SectionTitle(
                              'Trilhas de aprendizagem',
                              'Como o nome já diz, as trilhas que você acessará aqui são dicas para seguir um caminho e conhecer as principais funcionalidades das mais importantes ferramentas do Google que podem te auxiliar no processo de ensino remoto. Ah, e nós já trilhamos o caminho das pedras por você. Então agora basta você ir respondendo às perguntas, quando houver, e seguir as instruções. Bons estudos!',
                              CrossAxisAlignment.start),
                        ),
                        Container(
                            padding: const EdgeInsets.only(top: 60),
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
                                        padding:
                                            const EdgeInsets.only(bottom: 100),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 25),
                                                child: ClipOval(
                                                    child: Container(
                                                  color: background,
                                                  padding:
                                                      const EdgeInsets.all(20),
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
                                ]))
                      ])),
            ),
          ]))
    ]);
  }
}
