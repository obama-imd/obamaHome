import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../utils/app_theme.dart';
import '../constants.dart';

class Dropdowns extends StatelessWidget {
  const Dropdowns({super.key});

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
                  child: ListTile(
                      title: Text(item.accordionContent)),
                ));
          }).toList(),
        ));
  }
}
