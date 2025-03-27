import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:obamahome/components/mainButton.dart';

import '../../../../components/searchDropdown.dart';
import '../../../../utils/app_theme.dart';
import '../../../controllers/search_controller.dart';

const List<String> tileTitle = <String>[
  'Selecione o nível de ensino',
  'Selecione o Tema/Conteúdo',
  'Selecione o descritor',
  'Selecione a disciplina',
  'Selecione a habilidade',
];

class OAFilters extends StatefulWidget {
  final double swidth;
  var data;
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

class OAFilterState extends State<OAFilters> {
  String selectedNivelEnsino = '';
  String selectedTemaConteudo = '';
  int? temaConteudoSelecionado = 0;
  int? nivelEnsinoSelecionado = 0;
  String searchTerm = '';

  List<(int, String)>? nivelEnsinolData;
  List<(int, String)>? temaConteudoData;
  List<(int, String)>? habilidadeData;
  List<(int, String)>? descritorData;

  RadioTextField? nivelEnsinoRadioTextField;
  RadioTextField? temaConteudoRadioTextField;
  RadioTextField? descritorRadioTextField;
  RadioTextField? habilidadeRadioTextField;

  TextEditingController searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchSearchData().then((response) {
      setState(() {
        nivelEnsinolData =
            response.allNivelEnsino.map((x) => (x.id, x.nome)).toList();
        temaConteudoData = response.allTemaConteudo
            .map((x) => (x.id, x.getNomeWithCurriculo()))
            .toList();
      });
      nivelEnsinoRadioTextField = RadioTextField(
        array: nivelEnsinolData ?? [],
        title: tileTitle[0],
        titleStyle: textTheme.bodySmall!,
        initalValue: 0,
        refreshData: _refreshDescritorHabilidade,
      );
      temaConteudoRadioTextField = RadioTextField(
        array: temaConteudoData ?? [],
        title: tileTitle[1],
        titleStyle: textTheme.bodySmall!,
        initalValue: 0,
        refreshData: _refreshDescritorHabilidade,
      );
    });
  }

  void _refreshDescritorHabilidade(int? value) {
    fetchHabilidadeByAnoEnsinoTemaConteudo(
            selectedNivelEnsino, selectedTemaConteudo)
        .then((response) {
      setState(() {
        habilidadeData = response.map((x) => (x.id, x.descricao)).toList();
      });
      habilidadeRadioTextField = RadioTextField(
        array: habilidadeData ?? [],
        title: tileTitle[2],
        titleStyle: textTheme.bodySmall!,
        initalValue: 0,
      );
    });

    descritorRadioTextField = RadioTextField(
      array: descritorData ?? [],
      title: tileTitle[2],
      titleStyle: textTheme.bodySmall!,
      initalValue: 0,
    );
  }

  void mainSearch() {
    setState(() {
      selectedNivelEnsino = nivelEnsinoRadioTextField!.selectedValue != null &&
              nivelEnsinoRadioTextField!.selectedValue > 0
          ? '${nivelEnsinoRadioTextField!.selectedValue}'
          : '';
      selectedTemaConteudo =
          temaConteudoRadioTextField!.selectedValue != null &&
                  temaConteudoRadioTextField!.selectedValue > 0
              ? '${temaConteudoRadioTextField!.selectedValue}'
              : '';
      searchTerm = searchTextController.text;
    });
    final queryString = _buildQueryString();
    widget.updateData(queryString);
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(bottom: 30),
          child: Text('BUSCA', style: widget.titleStyle)),
      Container(
          height: 50,
          margin: const EdgeInsets.only(bottom: 30),
          child: TextField(
              controller: searchTextController,
              onSubmitted: (value) => mainSearch(),
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
          // Container(child: Text(tileTitle[0])),
          // ExpansionPanelListSimple(data: [
          //   Item(
          //       expandedValue: nivelEnsinoRadioTextField ?? Container(),
          //       headerValue: tileTitle[0]),
          //   Item(
          //       expandedValue: temaConteudoRadioTextField ?? Container(),
          //       headerValue: tileTitle[1]),
          // ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              mainButton(
                context,
                'Buscar',
                null,
                () {
                  mainSearch();
                },
              ),
              SizedBox(width: 8),
              mainButton(context, 'Busca Avançada', null, () {
                showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width * .9,
                        child: Column(
                          children: [
                            Wrap(
                              alignment: WrapAlignment.spaceEvenly,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      tileTitle[0],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .75,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .45,
                                        child: nivelEnsinoRadioTextField),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      tileTitle[1],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .75,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .45,
                                        child: temaConteudoRadioTextField),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        mainButton(
                          context,
                          'Voltar',
                          null,
                          () {
                            Navigator.of(context).pop();
                          },
                        ),
                        mainButton(
                          context,
                          'Buscar',
                          null,
                          () {
                            mainSearch();
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              }),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [],
          ),
        ],
      ),
    ]);
  }

  String _buildQueryString() {
    final params = [];
    if (selectedNivelEnsino.isNotEmpty) {
      params.add('nivelEnsinoId=$selectedNivelEnsino');
    }
    if (selectedTemaConteudo.isNotEmpty) {
      params.add('temaConteudoId=$selectedTemaConteudo');
    }
    if (searchTerm.isNotEmpty) {
      params.add('nome=$searchTerm');
    } else {
      params.add('nome=');
    }
    return params.join('&');
  }
}
