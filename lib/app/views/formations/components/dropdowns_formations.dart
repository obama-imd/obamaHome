import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:obamahome/components/cores_personalizadas.dart';
import 'package:obamahome/utils/app_theme.dart';

import '../../../../components/youtubePlayer.dart';
import '../constants.dart';

class Dropdowns extends StatefulWidget {
  const Dropdowns({super.key});

  @override
  State<Dropdowns> createState() => _DropdownsState();
}

class _DropdownsState extends State<Dropdowns> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 70),
        child: ExpansionPanelList.radio(
          children: accordionContent.map<ExpansionPanelRadio>((AccordionItem item) {
            return ExpansionPanelRadio(
                value: item,
                backgroundColor: background,
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    leading: Icon(FontAwesomeIcons.chartColumn, size: 20),
                    title: Text(item.accordionTitle),
                  );
                },
                body: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 40),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 20),
                          width: MediaQuery.of(context).size.width * .45,
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
                                child: Text(item.firstParagraph,
                                    style: TextStyle(height: 1.4)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Text(item.secondParagraph,
                                    style: TextStyle(height: 1.4)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Row(
                                  children: [
                                    Text("Duração da Formação: ",
                                        style: TextStyle(
                                            height: 1.4,
                                            fontWeight: FontWeight.bold)),
                                    Text(item.duration,
                                        style: TextStyle(height: 1.4)),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 15),
                                decoration: BoxDecoration(
                                    border: Border(
                                        left: BorderSide(
                                            width: 5,
                                            color:
                                                CoresPersonalizadas.azulObama))),
                                child: Text(item.thirdParagraph,
                                    style: TextStyle(height: 1.4)),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .4,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Text('Vídeo de apresentação',
                                    style: textTheme.titleSmall),
                              ),
                              CustomVideo(urlVideo: item.idVideo)
                            ],
                          ),
                        ),
                      ],
                    ),
                ));
          }).toList(),
        ));
  }
}
