import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obamahome/advanced_search/data/study_levels_controller.dart';
import 'package:obamahome/advanced_search/utils.dart';
import 'package:obamahome/components/mainButton.dart';
import '../../../../utils/app_theme.dart';

class OAFilters extends ConsumerStatefulWidget {
  final double swidth;
  final String data;
  final Function(String) updateData;
  final TextStyle titleStyle;
  List<dynamic> learningLevels;

  OAFilters({
    required this.swidth,
    required this.data,
    required this.updateData,
    required this.learningLevels,
    required this.titleStyle,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OAFiltersState();
}

class _OAFiltersState extends ConsumerState<OAFilters> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final studyLevelsController = ref.watch(allStudyLevelProvider);

    if (!studyLevelsController.hasValue || studyLevelsController.isLoading) {
      return CircularProgressIndicator();
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(bottom: 30),
            child: Text(
              'BUSCA',
            ),
          ),
          Container(
            height: 50,
            margin: const EdgeInsets.only(bottom: 50),
            child: TextField(
              onSubmitted: (value) async {
                //updateData(value);
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(100),
                ),
                hintText: 'Buscar',
                hintStyle: textTheme.bodySmall,
                contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                filled: true,
                fillColor: const Color.fromARGB(255, 218, 216, 216),
                suffixIcon: const Icon(Icons.search),
              ),
            ),
          ),
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
                          setState(
                            () {
                              if (value == null) {
                                pcnCheck = false;
                              } else {
                                pcnCheck = !pcnCheck;
                                bnccCheck = false;
                              }
                            },
                          );
                        },
                      ),
                      Text(
                        "PCN",
                      ),
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
                            setState(
                              () {
                                if (value == null) {
                                  bnccCheck = false;
                                } else {
                                  bnccCheck = !bnccCheck;
                                  pcnCheck = false;
                                }
                              },
                            );
                          },
                        ),
                        Text(
                          "BNCC",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              for (var lista in tileTitle) ...{
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 40, bottom: 20),
                  child: Text(
                    lista,
                    // style: titleStyle,
                  ),
                ),
                // Container(
                //   height: 40,
                //   alignment: Alignment.centerLeft,
                //   margin: EdgeInsets.only(bottom: 4),
                //   child: DropdownButton<String>(
                //     value: "primeiro", //nivelEnsino.first,
                //     icon: const Icon(Icons.arrow_drop_down),
                //     elevation: 5,
                //     style: textTheme.bodySmall,
                //     onChanged: (String? value) {
                //       // This is called when the user selects an item.
                //       // setState(() {
                //       //   dropdownValue = value!;
                //       // });
                //     },
                //     items: nivelEnsino.map<DropdownMenuItem<String>>(
                //       (String value) {
                //         return DropdownMenuItem<String>(
                //           value: value,
                //           child: Container(
                //             child: Text(value),
                //           ),
                //         );
                //       },
                //     ).toList(),
                //   ),
                // ),
              },
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    mainButton(
                      context,
                      'Busca Avançada',
                      null,
                      null,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      );
    }
  }
}
