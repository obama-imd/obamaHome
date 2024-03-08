import 'package:flutter/material.dart';
import 'package:obamahome/components/mainButton.dart';

import '../../../../utils/app_theme.dart';
import '../../../controllers/search_controller.dart';
import '../searchOA_view.dart';

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
  final List<dynamic> datas;
  final bool dataAvailable;
  final Function(List<dynamic>) updateData;
  const OAFilters({
    required this.swidth,
    required this.datas,
    required this.dataAvailable,
    required this.updateData,
    Key? key,
  }) : super(key: key);

  @override
  State<OAFilters> createState() => _HomePage1State(
        swidth: swidth,
        datas: datas,
        dataAvailable: dataAvailable,
        updateData: updateData,
      );
}

class _HomePage1State extends State<OAFilters> {
  final double swidth;
  final List<dynamic> datas;
  final bool dataAvailable;
  final Function(List<dynamic>) updateData;

  _HomePage1State({
    required this.swidth,
    required this.datas,
    required this.dataAvailable,
    required this.updateData,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: swidth * .288,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(bottom: 30),
            child: Text('BUSCA', style: textTheme.titleSmall)),
        Container(
            height: 50,
            margin: const EdgeInsets.only(bottom: 50),
            child: TextField(
                onSubmitted: (value) async {
                  final postsFiltrados = await fetchData(value);
                  if (postsFiltrados.$1.isNotEmpty) {
                    updateData(postsFiltrados.$1);
                  } else {
                    showMessage(context);
                  }
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
                    Text("PCN", )
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
                      Text("BNCC", )
                    ],
                  ),
                ),
              ],
            ),
            for (var lista in tileTitle) ...{
              Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 40, bottom: 20),
                  child: Text(lista, style: textTheme.titleSmall)),
              Container(
                  height: 40,
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(bottom: 4),
                  child: DropdownButton<String>(
                      value: descritor.first,
                      icon: const Icon(Icons.arrow_drop_down),
                      elevation: 5,
                       style: textTheme.displayMedium,
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
                              width: swidth * .245, child: Text(value)),
                        );
                      }).toList())),
            },
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  mainButton(context, 'Busca Avançada', ""),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
