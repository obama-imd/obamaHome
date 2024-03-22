import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:obamahome/utils/app_padding.dart';
import 'package:obamahome/utils/app_theme.dart';
import 'package:obamahome/utils/cores_personalizadas.dart';
import 'package:responsive_grid/responsive_grid.dart';

import 'youtubePlayer.dart';

class DropdownFormations extends StatefulWidget {
  final List<dynamic> accordionContent;

  const DropdownFormations({
    Key? key,
    required this.accordionContent,
  }) : super(key: key);

  @override
  State<DropdownFormations> createState() => _DropdownsState();
}

class _DropdownsState extends State<DropdownFormations> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingValues("sideMainPadding", context),
      child: ExpansionPanelList.radio(
        expandedHeaderPadding: EdgeInsets.symmetric(vertical: 0),
        children:
            widget.accordionContent.map<ExpansionPanelRadio>((dynamic item) {
          return ExpansionPanelRadio(
            canTapOnHeader: true,
            value: item,
            backgroundColor: background,
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                selected: isExpanded,
                selectedTileColor: CoresPersonalizadas.azulObama,
                selectedColor: background,
                leading: Icon(FontAwesomeIcons.chartColumn, size: 20),
                title: Text(item.accordionTitle,
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              );
            },
            body: Padding(
              padding: const EdgeInsets.only(
                  top: 20, left: 20, right: 20, bottom: 30),
              child: ResponsiveGridRow(
                children: [
                  ResponsiveGridCol(
                    lg: 6,
                    md: 12,
                    child: Container(
                      padding: EdgeInsets.only(right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Text(item.sectionTitle,
                                    style: textTheme.titleSmall),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Text(
                              item.firstParagraph,
                              textAlign: TextAlign.justify,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Text(
                              item.secondParagraph,
                              textAlign: TextAlign.justify,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Row(
                              children: [
                                Text("Duração da Formação: ",
                                    style: textTheme.headlineMedium),
                                Text(
                                  item.duration,
                                ),
                              ],
                            ),
                          ),
                          if (item.thirdParagraph != '') ...{
                            Container(
                              padding: EdgeInsets.only(left: 15),
                              decoration: BoxDecoration(
                                  border: Border(
                                      left: BorderSide(
                                          width: 5,
                                          color:
                                              CoresPersonalizadas.azulObama))),
                              child: Text(
                                item.thirdParagraph,
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          }
                        ],
                      ),
                    ),
                  ),
                  ResponsiveGridCol(
                    lg: 6,
                    md: 12,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          child: Text('Vídeo de apresentação',
                              style: textTheme.titleSmall),
                        ),
                        CustomVideo(urlVideo: item.idVideo)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class DropdownManuais extends StatefulWidget {
  final List<dynamic> accordionContent;

  const DropdownManuais({
    Key? key,
    required this.accordionContent,
  }) : super(key: key);

  @override
  State<DropdownManuais> createState() => _DropdownManuaisState();
}

class _DropdownManuaisState extends State<DropdownManuais> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingValues("sideMainPadding", context),
      child: ExpansionPanelList.radio(
        expandedHeaderPadding: EdgeInsets.symmetric(vertical: 0),
        children:
            widget.accordionContent.map<ExpansionPanelRadio>((dynamic item) {
          return ExpansionPanelRadio(
            canTapOnHeader: true,
            value: item,
            backgroundColor: background,
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                selected: isExpanded,
                selectedTileColor: CoresPersonalizadas.azulObama,
                selectedColor: background,
                leading: Icon(FontAwesomeIcons.chartColumn, size: 20),
                title: Text(item.accordionTitle,
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              );
            },
            body: Padding(
              padding: const EdgeInsets.only(
                  top: 20, left: 20, right: 20, bottom: 30),
              child: ResponsiveGridRow(
                children: [
                  ResponsiveGridCol(
                    lg: 6,
                    md: 12,
                    child: Container(
                      padding: EdgeInsets.only(right: 20),
                      width: MediaQuery.of(context).size.width * .45,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (item.paragraph != "") ...{
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Text(
                                item.paragraph,
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          },
                          if (item.subtitle != "") ...{
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Text(item.subtitle,
                                  textAlign: TextAlign.justify,
                                  style: textTheme.headlineSmall),
                            ),
                          },
                          for (var i = 0; i < item.topics.length; i++) ...{
                            if (item.topics[i] != "") ...{
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Text(
                                  (i + 1).toString() + ". " + item.topics[i],
                                ),
                              ),
                            },
                          },
                        ],
                      ),
                    ),
                  ),
                  ResponsiveGridCol(
                    lg: 6,
                    md: 12,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          child: Text('Vídeo de apresentação',
                              style: textTheme.titleSmall),
                        ),
                        CustomVideo(urlVideo: item.idVideo)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
