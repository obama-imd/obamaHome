import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:obamahome/components/cores_personalizadas.dart';

import '../../../../utils/app_theme.dart';
import '../constants.dart';

class Dropdowns extends StatelessWidget {
  const Dropdowns({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 70),
        child: ExpansionPanelList.radio(
          expandedHeaderPadding: EdgeInsets.symmetric(vertical: 0),
          children:
              accordionContent.map<ExpansionPanelRadio>((AccordionItem item) {
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
                    title: Text(item.accordionTitle),
                  );
                },
                body: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 30),
                  child: ListTile(title: Text(item.accordionContent)),
                ));
          }).toList(),
        ));
  }
}
