import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/app_theme.dart';
import 'cores_personalizadas.dart';

class contentItem {
  final List<String>? texto;
  final List<String>? subtexto;
  final List<IconData>? icone;

  contentItem({
    this.texto,
    this.subtexto,
    this.icone,
  });
}

final List<contentItem> contentItems = [
  contentItem(texto: [
    'OAs',
    'OAs autorais',
    'Planos de Aula',
    'Trilhas',
  ], subtexto: [
    'Número',
    'Número',
    'Número',
    'Número'
  ], icone: [
    FontAwesomeIcons.faceSmile,
    FontAwesomeIcons.laptop,
    FontAwesomeIcons.desktop,
    FontAwesomeIcons.windows
  ]),
];

class iconspanel extends StatelessWidget {
  const iconspanel({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: contentItems.length,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          final item = contentItems[index];
          return Container(
              padding: const EdgeInsets.only(top: 60),
              width: 200,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      child: Icon(item.icone![index],
                          size: 60.0, color: CoresPersonalizadas.azulObama),
                    ),
                    Container(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(item.texto![index],
                            textAlign: TextAlign.end,
                            style: textTheme.titleSmall)),
                    Container(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(item.subtexto![index],
                            textAlign: TextAlign.end,
                            style: textTheme.displayMedium))
                  ]));
        });
  }
}
