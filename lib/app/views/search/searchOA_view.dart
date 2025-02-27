// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obamahome/app/models/objeto_aprendizagem.dart';

import '../../../components/loadCircle.dart';
import '../../../utils/app_theme.dart';
import '../../../utils/responsivo.dart';
import '../../controllers/search_controller.dart';
import 'responsividade/search_desktop.dart';
import 'responsividade/search_mobile.dart';
import 'responsividade/search_tablet.dart';

class SearchPage extends ConsumerStatefulWidget {
  String termSearched;
  String? queryParams;

  SearchPage({
    Key? key,
    required this.termSearched,
    required this.queryParams,
  }) : super(key: key);

  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends ConsumerState<SearchPage> {
  int selectedPageIndex = 0;
  bool loadObjects = false;
  late TextStyle titleStyle;
  String nivelEnsinoSelected = '0';
  String temaConteudoSelected = '0';

  List<NivelEnsino> niveisEnsino = [];

  void updateData(newData) {
    setState(() {
      widget.termSearched = '$newData';
      selectedPageIndex = 0;
    });
  }

  void updateDataFromAdvancedSearchPage(newData) {
    setState(() {
      widget.queryParams = newData;
      selectedPageIndex = 0;
    });
  }

  @override
  void initState() {
    super.initState();
    waitData();
    activateLoad();
  }

  void activateLoad() {
    setState(() {
      loadObjects = true;
    });
  }

  void waitData() async {
    Future.wait([fetchData("", 0, null)])
        .timeout(Duration(seconds: 5))
        .whenComplete(() => setState(() {
              loadObjects = false;
            }));
    Future.wait([fetchNivelEnsino()])
        .then((data) => setState(() {
              niveisEnsino = data.first;
            }))
        .timeout(Duration(seconds: 5))
        .whenComplete(() => setState(() {
              loadObjects = false;
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Responsivo(
              mobile: SearchMobile(
                  termSearched: widget.termSearched,
                  selectedPageIndex: selectedPageIndex,
                  updateData: updateData,
                  titleStyle: textTheme.headlineSmall!),
              tablet: SearchTablet(
                  termSearched: widget.termSearched,
                  selectedPageIndex: selectedPageIndex,
                  updateData: updateData,
                  titleStyle: textTheme.headlineSmall!),
              desktop: SearchDesktop(
                  termSearched: widget.termSearched,
                  selectedPageIndex: selectedPageIndex,
                  updateData: updateData,
                  queryParams: widget.queryParams ?? '',
                  updateDataFromAdvancedSearchPage:
                      updateDataFromAdvancedSearchPage,
                  titleStyle: textTheme.titleSmall!)),
          if (loadObjects) ...{circleLoadSpinner(context)}
        ],
      ),
    );
  }
}
