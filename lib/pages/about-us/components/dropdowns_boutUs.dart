import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

class Dropdowns extends StatelessWidget {
  const Dropdowns({super.key});

  @override
  Widget build(BuildContext context) {
    // Exemplo de inicialização da lista de AccordionItem
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70),
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
                Padding(
                  padding: EdgeInsets.all(20),
                  child: ListTile(
                    title: Text(lista.accordionContent,
                        style: TextStyle(
                            height: 1.4, fontWeight: FontWeight.bold)),
                  ),
                ),
              ]),
          SizedBox(height: 20, width: 10),
        },
      ]),
    );
  }
}
