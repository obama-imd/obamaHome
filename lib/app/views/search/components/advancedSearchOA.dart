import 'package:flutter/material.dart';
import 'package:obamahome/components/mainButton.dart';
import 'package:obamahome/utils/cores_personalizadas.dart';

import '../../../../components/searchDropdown.dart';
import '../../../../utils/app_theme.dart';
import '../../../controllers/search_controller.dart';

List<String> tileTitle = <String>[
  'Selecione o currículo',
  '',
  '',
  '',
  'Selecione o descritor',
  'Selecione a habilidade',
];

class OAFilters extends StatefulWidget {
  final double swidth;
  final data;
  final Function(String) updateData;
  final TextStyle titleStyle;

  OAFilters({
    required this.swidth,
    required this.data,
    required this.updateData,
    required this.titleStyle,
  });

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
  bool willExpand = false;

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
  bool blockCleanFilters = false;

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
      shouldToggle: false,
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

  List<(int, String)>? removingRepeatedDescritors(data) {
    Map<String, int> descricaoComPrimeiroId = {};
    for (var item in data) {
      int id = item.$1;
      String descricao = item.$2;
      if (!descricaoComPrimeiroId.containsKey(descricao)) {
        descricaoComPrimeiroId[descricao] = id;
      }
    }
    return descricaoComPrimeiroId.entries.map((e) => (e.value, e.key)).toList();
  }

  void _removeSelectionFrom(int selectedId) {
    for (var key in selectedValues!.keys) {
      if (key >= selectedId) selectedValues![key] = 0;
    }
  }

  void _refreshNivelEnsinoTemaConteudo(String curriculo) async {
    try {
      final response = await fetchSearchData(curriculo);
      setState(() {
        nivelEnsinolData =
            response.allNivelEnsino.map((x) => (x.id, x.nome)).toList();
        temaConteudoData = response.allTemaConteudo
            .map((x) => (x.id, x.getNomeWithCurriculo()))
            .toList();

        descritorData = removingRepeatedDescritors(response.allDescricoes
            .map((x) => (x.id, x.formattedDescricao))
            .toList());

        nivelEnsinoRadioTextField = RadioTextField(
          array: nivelEnsinolData ?? [],
          radioTextFieldID: 1,
          titleStyle: textTheme.bodySmall!,
          tileHeight: 40,
          shoulAddOptionAll: false,
          initialValue: selectedValues,
          shouldToggle: true,
          refreshData: curriculo == "BNCC"
              ? _refreshAnoEnsino
              : _refreshDescritorHabilidade,
        );
        tileTitle[1] = "Selecione o nível de ensino";
        tileTitle[2] = curriculo == "BNCC" ? "Selecione o ano de ensino" : "";
        tileTitle[3] = 'Selecione o Tema/Conteúdo';

        temaConteudoRadioTextField = RadioTextField(
          array: temaConteudoData ?? [],
          radioTextFieldID: 3,
          titleStyle: textTheme.bodySmall!,
          tileHeight: 45,
          initialValue: selectedValues,
          shoulAddOptionAll: false,
          refreshData: _refreshDescritorHabilidade,
          shouldToggle: true,
        );

        descritorRadioTextField = RadioTextField(
          array: descritorData ?? [],
          radioTextFieldID: 4,
          tileHeight: 35,
          initialValue: selectedValues,
          shoulAddOptionAll: false,
          titleStyle: textTheme.bodySmall!,
          shouldToggle: true,
        );

        RadioTextFieldsList[1] = nivelEnsinoRadioTextField;
        RadioTextFieldsList[2] =
            curriculo == "PCN" ? null : RadioTextFieldsList[2];
        RadioTextFieldsList[3] = temaConteudoRadioTextField;

        willExpand = false;
        _removeSelectionFrom(1);
      });
    } finally {
      reOpenModal();
    }
  }

  void _refreshAnoEnsino() async {
    if (selectedValues![1]! <= 0) return;
    try {
      final response = await fetchAnoEnsino();
      setState(() {
        anoEnsinoData = response
            .where((x) {
              switch (selectedValues![1]!) {
                case 1:
                  return x.id == 1;
                case 2:
                  return x.id > 1 && x.id < 7;
                case 3:
                  return x.id > 6 && x.id < 11;
                case 4:
                  return x.id > 10 && x.id < 14;
                case 5:
                  return x.id == 14;
                case 6:
                  return x.id == 15;
                case 7:
                  return x.id == 16;
                default:
                  return false;
              }
            })
            .map((x) => (x.id, x.nome))
            .toList();

        anoEnsinoRadioTextField = RadioTextField(
          array: anoEnsinoData ?? [],
          radioTextFieldID: 2,
          tileHeight: 35,
          initialValue: selectedValues,
          titleStyle: textTheme.bodySmall!,
          shoulAddOptionAll: false,
          shouldToggle: true,
          refreshData: _refreshDescritorHabilidade,
        );

        RadioTextFieldsList[2] = anoEnsinoRadioTextField;
        willExpand = false;
      });
    } finally {
      reOpenModal();
    }
  }

  void _refreshDescritorHabilidade() async {
    if (selectedValues![1]! == 0 || selectedValues![3]! == 0) {
      setState(() {
        selectedValues![4] = 0;
        selectedValues![5] = 0;
      });
      return;
    }

    if (selectedValues![0]! == 1) {
      setState(() {
        anoEnsinoData = [];
        RadioTextFieldsList[4] = descritorRadioTextField;
        willExpand = true;
      });
      reOpenModal();
    } else if (selectedValues![0]! == 2 &&
        selectedValues![2]! > 0 &&
        selectedValues![3]! > 0) {
      try {
        final response = await fetchHabilidadeByAnoEnsinoTemaConteudo(
            selectedValues![2]!, selectedValues![3]!);

        setState(() {
          habilidadeData =
              response.map((x) => (x.id, x.formattedHabilidade)).toList();
          habilidadeRadioTextField = RadioTextField(
            array: habilidadeData ?? [],
            radioTextFieldID: 5,
            initialValue: selectedValues,
            titleStyle: textTheme.bodySmall!,
            shoulAddOptionAll: false,
            refreshData: null,
            shouldToggle: true,
          );

          RadioTextFieldsList[5] = habilidadeRadioTextField;
          willExpand = true;
        });
        reOpenModal();
      } finally {}
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
    widget.updateData(_buildQueryString());
  }

  List<Widget> _buildSelectedFiltersChips() {
    List<Widget> chips = [];
    Map<int, String> labels = {
      0: 'Currículo',
      1: 'Nível de Ensino',
      2: 'Ano de Ensino',
      3: 'Tema/Conteúdo',
      4: 'Descritor',
      5: 'Habilidade',
    };

    for (var entry in selectedValues!.entries) {
      int index = entry.key;
      int? value = entry.value;
      if (value != null && value > 0) {
        final array = RadioTextFieldsList[index]?.array;
        final match =
            array?.firstWhere((e) => e.$1 == value, orElse: () => (0, ''));
        if (match != null && match.$1 != 0) {
          chips.add(
            Chip(
              side: BorderSide.none,
              label: Text(
                '${labels[index]}: ${match.$2}',
                style: TextStyle(color: background, fontSize: 12),
              ),
              backgroundColor: CoresPersonalizadas.azulObama,
              deleteIcon: Icon(Icons.close, color: background),
              onDeleted: () {
                setState(() {
                  selectedValues![index] = 0;
                });
                mainSearch();
              },
            ),
          );
        }
      }
    }

    if (searchTerm.isNotEmpty) {
      chips.add(
        Chip(
          side: BorderSide.none,
          label: Text('Busca: $searchTerm',
              style: TextStyle(color: background, fontSize: 12)),
          backgroundColor: CoresPersonalizadas.azulObama,
          deleteIcon: Icon(Icons.close, color: background),
          onDeleted: () {
            setState(() {
              searchTextController.clear();
              searchTerm = '';
            });
            mainSearch();
          },
        ),
      );
    }

    return chips;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('BUSCA', style: widget.titleStyle),
        SizedBox(height: 15),
        TextField(
          controller: searchTextController,
          onSubmitted: (value) => mainSearch(),
          decoration: InputDecoration(
            hintText: 'Buscar',
            hintStyle: textTheme.bodySmall,
            filled: true,
            fillColor: const Color.fromARGB(255, 218, 216, 216),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide.none,
            ),
            // suffixIcon: Icon(Icons.search),
            contentPadding: EdgeInsets.symmetric(horizontal: 15),
          ),
        ),
        SizedBox(height: 10),
        if (_buildSelectedFiltersChips().isNotEmpty)
          Wrap(
            spacing: 6,
            runSpacing: 10,
            children: _buildSelectedFiltersChips(),
          ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.blue,
                padding: EdgeInsets.zero,
                minimumSize: Size(0, 0),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: const Text('Limpar filtros'),
              onPressed: () {
                final values = selectedValues;
                if (values != null) {
                  blockCleanFilters = values.entries.any((entry) =>
                      (entry.value != null && entry.value! > 0) ||
                      searchTextController.text.isNotEmpty);
                }
                if (blockCleanFilters) {
                  setState(() {
                    _removeSelectionFrom(0);
                    searchTextController.clear();
                    searchTerm = '';
                  });
                  mainSearch();
                }
              },
            ),
            SizedBox(width: 15),
          ],
        ),
        SizedBox(height: 12),
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
    );
  }

  String _buildQueryString() {
    final params = [];
    if (selectedNivelEnsino.isNotEmpty)
      params.add('nivelEnsino=$selectedNivelEnsino');
    if (selectedTemaConteudo.isNotEmpty)
      params.add('temaConteudo=$selectedTemaConteudo');
    if (selectedDescritor.isNotEmpty)
      params.add('descritor=$selectedDescritor');
    if (selectedHabilidade.isNotEmpty)
      params.add('habilidade=$selectedHabilidade');
    if (searchTerm.isNotEmpty) {
      params.add('nome=$searchTerm');
    } else {
      params.add('nome=');
    }
    return params.join('&');
  }

  void advancedSearchModal(List<RadioTextField?> RadioTextFieldsList) {
    Item generateValuesList(int i) {
      i = i + 3;
      if (RadioTextFieldsList[i] != null &&
          RadioTextFieldsList[i]!.array.isNotEmpty) {
        return Item(
            expandedValue: Container(child: RadioTextFieldsList[i]),
            headerValue: tileTitle[i]);
      } else {
        return Item(
            expandedValue: Container(
                child: Text("Nenhum Resultado encontrado",
                    style: textTheme.bodySmall)),
            headerValue: tileTitle[i]);
      }
    }

    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: background,
          content: Container(
            color: background,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width * .95,
            child: SingleChildScrollView(
              child: Wrap(
                alignment: WrapAlignment.spaceEvenly,
                children: [
                  for (var i = 0; i < RadioTextFieldsList.length - 2; i++)
                    if (tileTitle[i].isNotEmpty)
                      Container(
                        width: MediaQuery.of(context).size.width * .23,
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 25, bottom: 8),
                              child: Text(tileTitle[i],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                            ),
                            RadioTextFieldsList[i] ?? SizedBox(),
                          ],
                        ),
                      ),
                  if (selectedValues![0]! > 0)
                    Container(
                      width: MediaQuery.of(context).size.width * .85,
                      child: ExpansionPanelListSimple(
                        data: [generateValuesList(selectedValues![0]!)],
                        isExpanded: willExpand,
                      ),
                    ),
                ],
              ),
            ),
          ),
          actions: [
            mainButton(context, 'Voltar', null, () {
              Navigator.of(context).pop();
              _removeSelectionFrom(0);
            }),
            mainButton(context, 'Buscar', null, () {
              final counterOfSelectedValues = selectedValues!.values
                  .where((value) => value != null && value > 0);

              if (counterOfSelectedValues.length > 1) {
                mainSearch();
                Navigator.of(context).pop();
              }
            }),
          ],
        );
      },
    );
  }
}
