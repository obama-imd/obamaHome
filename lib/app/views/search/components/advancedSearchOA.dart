import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obamahome/components/mainButton.dart';

import '../../../../components/loadCircle.dart';
import '../../../../utils/app_theme.dart';
import '../../../controllers/search_controller.dart';

List<String> nivelEnsino = <String>['Todos'];
List<String> temaCurricular = <String>['Todos'];
List<String> tipo = <String>['Todos'];
List<String> descritor = <String>['Todos'];

const List<String> tileTitle = <String>[
  'Selecione o nível de ensino',
  'Selecione o tema curricular',
  'Selecione o tipo',
  'Selecione o descritor',
];

// bool pcnCheck = false;
// bool bnccCheck = false;

class OAFilters extends ConsumerStatefulWidget {
  final double swidth;
  final String data;
  final Function(String) updateData;
  final TextStyle titleStyle;
  OAFilters(
      {required this.swidth,
      required this.data,
      required this.updateData,
      required this.titleStyle});

  @override
  OAFilterState createState() => OAFilterState();
}

class OAFilterState extends ConsumerState<OAFilters> {
  // List<String> learningLevels = [];
  // late List<String> learningLevels;

  // List<String> getLevels() {
  //   // try {
  //   // print("Iniciando getLevels");
  //   List<String> setLevels = [];
  //   List<String> levels = ref.watch(searchLevels);

  //   print("jsonData: $levels");
  //   for (var level in levels) {
  //     setLevels.add(level.nome);
  //   }
  //   // levels.map((level) {
  //   //   setLevels.add(level.nome);
  //   // });

  //   setState() {
  //     learningLevels = setLevels;
  //   }

  //   return learningLevels;

  //   // } catch (e) {
  //   //   print('Erro em getLevels: $e');
  //   // }
  // }

  @override
  void initState() {
    // learningLevels = getLevels();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: fetchLevels(ref), // Chama a função getLevels
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final studyLevelData = ref.watch(searchLevels);
          List<String> studyLevels = [];

          for (var level in studyLevelData) {
            studyLevels.add(level.nome);
          }

          print("jsonData => $studyLevelData");

          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(bottom: 30),
                    child: Text('BUSCA', style: widget.titleStyle)),
                Container(
                    height: 50,
                    margin: const EdgeInsets.only(bottom: 50),
                    child: TextField(
                        onSubmitted: (value) async {
                          widget.updateData(value);
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(100)),
                            hintText: 'Buscar',
                            hintStyle: textTheme.bodySmall,
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 15),
                            filled: true,
                            fillColor: const Color.fromARGB(255, 218, 216, 216),
                            suffixIcon: const Icon(Icons.search)))),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Row(
                    //   children: [
                    //     Row(
                    //       children: [
                    //         Checkbox(
                    //           tristate: true,
                    //           value: pcnCheck,
                    //           onChanged: (bool? value) {
                    //             setState(() {
                    //               if (value == null) {
                    //                 pcnCheck = false;
                    //               } else {
                    //                 pcnCheck = !pcnCheck;
                    //                 bnccCheck = false;
                    //               }
                    //             });
                    //           },
                    //         ),
                    //         Text(
                    //           "PCN",
                    //         )
                    //       ],
                    //     ),
                    //     Padding(
                    //       padding: const EdgeInsets.only(left: 8.0),
                    //       child: Row(
                    //         children: [
                    //           Checkbox(
                    //             tristate: true,
                    //             value: bnccCheck,
                    //             onChanged: (bool? value) {
                    //               setState(() {
                    //                 if (value == null) {
                    //                   bnccCheck = false;
                    //                 } else {
                    //                   bnccCheck = !bnccCheck;
                    //                   pcnCheck = false;
                    //                 }
                    //               });
                    //             },
                    //           ),
                    //           Text(
                    //             "BNCC",
                    //           )
                    //         ],
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    for (var lista in tileTitle) ...{
                      Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(top: 40, bottom: 20),
                          child: Text(lista, style: widget.titleStyle)),
                      Container(
                          height: 40,
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(bottom: 4),
                          child: DropdownButton<String>(
                              value: studyLevels.first,
                              icon: const Icon(Icons.arrow_drop_down),
                              elevation: 5,
                              style: textTheme.bodySmall,
                              onChanged: (String? value) {
                                // This is called when the user selects an item.
                                // setState(() {
                                //   dropdownValue = value!;
                                // });
                              },
                              items: studyLevels.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Container(child: Text(value)),
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
        } else if (snapshot.hasError) {
          Container(
              padding: const EdgeInsets.only(top: 100, left: 90, right: 15),
              width: widget.swidth * 0.67,
              child: Text(
                "Perdão, não há nenhum item a ser exibido no momento.",
              ));
        }
        return circleLoadSpinner(context);
      },
    );
  }
}
