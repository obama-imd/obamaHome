import 'package:flutter/material.dart';
import 'package:obamahome/components/mainButton.dart';

import '../../../../utils/app_theme.dart';

const List<String> nivelEnsino = <String>['Todos'];
const List<String> temaCurricular = <String>['Todos'];
const List<String> tipo = <String>['Todos'];
const List<String> descritor = <String>['Todos'];

const List<String> tileTitle = <String>[
  'Selecione o nível de ensino',
  'Selecione o tema curricular',
  'Selecione o tipo',
  'Selecione o descritor',
];

bool pcnCheck = false;
bool bnccCheck = false;

class OAFilters extends StatefulWidget {
  final double swidth;
  final String data;
  final Function(String) updateData;
  final TextStyle titleStyle;
  const OAFilters({
    required this.swidth,
    required this.data,
    required this.updateData,
    required this.titleStyle});

  @override
  State<OAFilters> createState() => OAFilterState(
        swidth: swidth,
        data: data,
        updateData: updateData,
        titleStyle: titleStyle
      );
}

class OAFilterState extends State<OAFilters> {
  final double swidth;
  final String data;
  final Function(String) updateData;
  final TextStyle titleStyle;

  OAFilterState({
    required this.swidth,
    required this.data,
    required this.updateData,
    required this.titleStyle
  });

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(bottom: 30),
          child: Text('BUSCA', style: titleStyle)),
      Container(
          height: 50,
          margin: const EdgeInsets.only(bottom: 50),
          child: TextField(
              onSubmitted: (value) async {
                updateData(value);
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(100)),
                  hintText: 'Buscar',
                  hintStyle: textTheme.bodySmall,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 218, 216, 216),
                  suffixIcon: const Icon(Icons.search)))),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Row(
                children: [
                  Checkbox(
                    tristate: true,
                    value: pcnCheck,
                    onChanged: (bool? value) {
                      setState(() {
                        if (value == null) {
                          pcnCheck = false;
                        } else {
                          pcnCheck = !pcnCheck;
                          bnccCheck = false;
                        }
                      });
                    },
                  ),
                  Text(
                    "PCN",
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Checkbox(
                      tristate: true,
                      value: bnccCheck,
                      onChanged: (bool? value) {
                        setState(() {
                          if (value == null) {
                            bnccCheck = false;
                          } else {
                            bnccCheck = !bnccCheck;
                            pcnCheck = false;
                          }
                        });
                      },
                    ),
                    Text(
                      "BNCC",
                    )
                  ],
                ),
              ),
            ],
          ),
          for (var lista in tileTitle) ...{
            Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 40, bottom: 20),
                child: Text(lista, style: titleStyle)),
            Container(
                height: 40,
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(bottom: 4),
                child: DropdownButton<String>(
                    value: descritor.first,
                    icon: const Icon(Icons.arrow_drop_down),
                    elevation: 5,
                    style: textTheme.bodySmall,
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      // setState(() {
                      //   dropdownValue = value!;
                      // });
                    },
                    items: descritor
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Container(
                            width: swidth * .21, child: Text(value)),
                      );
                    }).toList())),
          },
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                mainButton(context, 'Busca Avançada', null, null),
              ],
            ),
          ),
        ],
      ),
    ]);
  }
}
