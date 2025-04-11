import 'package:flutter/material.dart';
import 'package:obamahome/components/mainButton.dart';

import '../../../../components/searchDropdown.dart';
import '../../../../utils/app_theme.dart';
import '../../../controllers/search_controller.dart';

List<String> tileTitle = <String>[
  'Selecione o currículo',
  'Selecione o nível de ensino',
  '',
  'Selecione o Tema/Conteúdo',
  'Selecione o descritor',
  // 'Selecione a disciplina',
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
  String selectedAnoEnsino = '';
  String selectedNivelEnsino = '';
  String selectedTemaConteudo = '';
  String selectedDescritor = '';
  String selectedHabilidade = '';

  int? curriculoSelecionado = 0;
  int? temaConteudoSelecionado = 0;
  int? nivelEnsinoSelecionado = 0;
  int? anoEnsinoSelecionado = 0;
  int? descritorSelecionado = 0;
  int? habilidadeSelecionada = 0;

  String searchTerm = '';

  List<(int, String)>? nivelEnsinolData;
  List<(int, String)>? anoEnsinoData;
  List<(int, String)>? temaConteudoData;
  List<(int, String)>? habilidadeData;
  List<(int, String)>? descritorData;

  RadioTextField? curriculoRadioTextField;
  RadioTextField? nivelEnsinoRadioTextField;
  RadioTextField? anoEnsinoRadioTextField;
  RadioTextField? temaConteudoRadioTextField;
  RadioTextField? descritorRadioTextField;
  RadioTextField? habilidadeRadioTextField;

  TextEditingController searchTextController = TextEditingController();

  Map<int, int?>? selectedValues = {};
  List<RadioTextField?> RadioTextFieldsList = [];

  @override
  void initState() {
    super.initState();

    selectedValues = {
      0: curriculoSelecionado,
      1: nivelEnsinoSelecionado,
      2: anoEnsinoSelecionado,
      3: temaConteudoSelecionado,
      4: descritorSelecionado,
      5: habilidadeSelecionada
    };

    curriculoRadioTextField = RadioTextField(
      array: [(1, 'PCN'), (2, 'BNCC')],
      radioTextFieldID: 0,
      titleStyle: textTheme.bodySmall!,
      tileHeight: 35,
      initialValue: selectedValues,
      refreshData2: _refreshNivelEnsinoTemaConteudo,
      shoulAddOptionAll: false,
    );
    setState(() {
      RadioTextFieldsList = [
        curriculoRadioTextField,
        nivelEnsinoRadioTextField,
        anoEnsinoRadioTextField,
        temaConteudoRadioTextField,
        descritorRadioTextField,
        habilidadeRadioTextField,
      ];
    });
  }

  void reOpenModal() {
    Navigator.of(context).pop();
    advancedSearchModal(RadioTextFieldsList);
  }

  void _refreshNivelEnsinoTemaConteudo(String curriculo) {
    fetchSearchData(curriculo).then((response) {
      setState(() {
        nivelEnsinolData =
            response.allNivelEnsino.map((x) => (x.id, x.nome)).toList();
        if (nivelEnsinolData != null) {
          nivelEnsinolData?.sort((a, b) => a.$1.compareTo(b.$1));
        }
        temaConteudoData = response.allTemaConteudo
            .map((x) => (x.id, x.getNomeWithCurriculo()))
            .toList();
        descritorData = response.allDescricoes
            .map((x) => (x.id, x.formattedDescricao))
            .toList();

        nivelEnsinoRadioTextField = RadioTextField(
          array: nivelEnsinolData ?? [],
          radioTextFieldID: 1,
          titleStyle: textTheme.bodySmall!,
          tileHeight: 35,
          initialValue: selectedValues,
          refreshData: curriculo == "BNCC"
              ? _refreshAnoEnsino
              : _refreshDescritorHabilidade,
        );

        curriculo == "BNCC"
            ? tileTitle[2] = "Selecione o ano de ensino"
            : tileTitle[2] = "";

        temaConteudoRadioTextField = RadioTextField(
          array: temaConteudoData ?? [],
          radioTextFieldID: 3,
          titleStyle: textTheme.bodySmall!,
          tileHeight: 35,
          initialValue: selectedValues,
          refreshData: _refreshDescritorHabilidade,
        );
        descritorRadioTextField = RadioTextField(
          array: descritorData ?? [],
          radioTextFieldID: 2,
          tileHeight: 35,
          initialValue: selectedValues,
          titleStyle: textTheme.bodySmall!,
        );

        RadioTextFieldsList[1] = nivelEnsinoRadioTextField;
        RadioTextFieldsList[3] = temaConteudoRadioTextField;
      });
    }).whenComplete(() {
      reOpenModal();
    });
  }

  void _refreshAnoEnsino() {
    if (selectedValues![1]! > 0) {
      fetchAnoEnsino().then((response) {
        setState(() {
          if (selectedValues![1]! == 1) {
            anoEnsinoData = response
                .where((x) => x.id == 1)
                .map((x) => (x.id, x.nome))
                .toList();
          } else if (selectedValues![1]! == 2) {
            anoEnsinoData = response
                .where((x) => x.id > 1 && x.id < 7)
                .map((x) => (x.id, x.nome))
                .toList();
          } else if (selectedValues![1]! == 3) {
            anoEnsinoData = response
                .where((x) => x.id > 6 && x.id < 11)
                .map((x) => (x.id, x.nome))
                .toList();
          } else if (selectedValues![1]! == 4) {
            anoEnsinoData = response
                .where((x) => x.id > 10 && x.id < 14)
                .map((x) => (x.id, x.nome))
                .toList();
          } else if (selectedValues![1]! == 5) {
            anoEnsinoData = response
                .where((x) => x.id == 14)
                .map((x) => (x.id, x.nome))
                .toList();
          } else if (selectedValues![1]! == 6) {
            anoEnsinoData = response
                .where((x) => x.id == 15)
                .map((x) => (x.id, x.nome))
                .toList();
          } else if (selectedValues![1]! == 7) {
            anoEnsinoData = response
                .where((x) => x.id == 16)
                .map((x) => (x.id, x.nome))
                .toList();
          }

          anoEnsinoRadioTextField = RadioTextField(
            array: anoEnsinoData ?? [],
            radioTextFieldID: 2,
            tileHeight: 35,
            initialValue: selectedValues,
            titleStyle: textTheme.bodySmall!,
            shoulAddOptionAll: false,
            refreshData: _refreshDescritorHabilidade,
          );
        });
        RadioTextFieldsList[2] = anoEnsinoRadioTextField;
      }).whenComplete(() {
        reOpenModal();
      });
    }
  }

  void _refreshDescritorHabilidade() {
    if (selectedValues![1]! > 0 && selectedValues![3]! > 0) {
      if (selectedValues![0]! == 1) {
        RadioTextFieldsList[4] = descritorRadioTextField;
        reOpenModal();
      } else if (selectedValues![0]! == 2 && selectedValues![2]! > 0) {
        fetchHabilidadeByAnoEnsinoTemaConteudo(
                selectedValues![2]!, selectedValues![3]!)
            .then((response) {
          setState(() {
            habilidadeData =
                response.map((x) => (x.id, x.formattedHabilidade)).toList();

            habilidadeRadioTextField = RadioTextField(
                array: habilidadeData ?? [],
                radioTextFieldID: 5,
                initialValue: selectedValues,
                titleStyle: textTheme.bodySmall!,
                shoulAddOptionAll: false,
                refreshData: null);

            RadioTextFieldsList[5] = habilidadeRadioTextField;
          });
        }).whenComplete(() {
          reOpenModal();
        });
      }
    } else {
      setState(() {
        selectedValues![4] = 0;
        selectedValues![5] = 0;
      });
    }
  }

  void mainSearch() {
    setState(() {
      selectedNivelEnsino =
          selectedValues![1] != null && selectedValues![1]! > 0
              ? '${selectedValues![1]}'
              : '';
      selectedTemaConteudo =
          selectedValues![3] != null && selectedValues![3]! > 0
              ? '${selectedValues![3]}'
              : '';
      selectedDescritor = selectedValues![4] != null && selectedValues![4]! > 0
          ? '${selectedValues![4]}'
          : '';
      selectedHabilidade = selectedValues![5] != null && selectedValues![5]! > 0
          ? '${selectedValues![5]}'
          : '';
      searchTerm = searchTextController.text;
    });

    var queryString = _buildQueryString();
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              mainButton(context, 'Buscar', null, mainSearch),
              SizedBox(width: 8),
              mainButton(context, 'Busca Avançada', null,
                  () => advancedSearchModal(RadioTextFieldsList)),
            ],
          ),
        ],
      ),
    ]);
  }

  void advancedSearchModal(List<RadioTextField?> RadioTextFieldsList) {
    List<Item> generateValuesList(int i) {
      i = i + 3;
      List<Item> itemValue = [
        Item(
            expandedValue: Container(child: RadioTextFieldsList[i]),
            headerValue: tileTitle[i])
      ];
      return itemValue;
    }

    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          surfaceTintColor: background,
          content: Container(
            color: background,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width * .95,
            child: SingleChildScrollView(
              child: Wrap(alignment: WrapAlignment.spaceEvenly, children: [
                for (var i = 0; i < RadioTextFieldsList.length - 2; i++) ...{
                  // if (tileTitle[i].length > 0) ...{
                    Container(
                      width: MediaQuery.of(context).size.width * .45,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 25, bottom: 8),
                            child: Text(
                              tileTitle[i],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                          Container(child: RadioTextFieldsList[i]),
                        ],
                      ),
                    ),
                  },
                // },
                if (selectedValues![0]! > 0) ...{
                  Container(
                    width: MediaQuery.of(context).size.width * .8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: ExpansionPanelListSimple(
                              data: generateValuesList(selectedValues![0]!)),
                        )
                      ],
                    ),
                  ),
                }
              ]),
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
  }

  String _buildQueryString() {
    final params = [];
    if (selectedNivelEnsino.isNotEmpty) {
      params.add('nivelEnsino=$selectedNivelEnsino');
    }
    if (selectedTemaConteudo.isNotEmpty) {
      params.add('temaConteudo=$selectedTemaConteudo');
    }
    if (selectedDescritor.isNotEmpty) {
      params.add('descritor=$selectedDescritor');
    }
    if (selectedHabilidade.isNotEmpty) {
      params.add('habilidade=$selectedHabilidade');
    }
    if (searchTerm.isNotEmpty) {
      params.add('nome=$searchTerm');
    } else {
      params.add('nome=');
    }
    return params.join('&');
  }
}
