
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../utils/app_theme.dart';
import '../../../../../utils/cores_personalizadas.dart';
import '../../../../controllers/search_controller.dart';
import '../../../../models/search_models.dart';

class PageViewThird extends ConsumerStatefulWidget {
  const PageViewThird({super.key});

  @override
  _PageViewThirdState createState() => _PageViewThirdState();
}

class _PageViewThirdState extends ConsumerState<PageViewThird> {
  List<SearchModel?> searchData = [];
  List<String> selectedOA = [];
  List<String>? cachedObjects = [];

  @override
  void initState() {
    getData();
    getObjects();
    super.initState();
  }

  void getData() async {
    SearchResponse fetchedData = await fetchDataAndUpdateState("", ref);
    SearchResponse pagination = fetchedData;
    List<SearchModel?> newPagination = pagination.content;
    setState(() {
      searchData = newPagination;
    });
  }

  void getObjects() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? items = prefs.getStringList('objects');
    setState(() {
      selectedOA = items!;
      cachedObjects = items;
    });
    // listOAText(_controller);
  }

  void addObjects() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('objects', selectedOA);
    getObjects();
  }

  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: background,
      ),
      constraints: BoxConstraints(maxWidth: 1200, maxHeight: 600),
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Wrap(
        children: [
          Container(
            width: swidth > 1200 ? 1200 * .6 : swidth * .6,
            child: Column(children: [
              Text("Escolha os OA"),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Divider(color: Colors.black38),
              ),
              for (var i = 0; i < searchData.length; i++) ...{
                // print(search?.nome);
                Container(
                    height: 40,
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    color: i % 2 == 0 ? Colors.white : Colors.black12,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(searchData[i]!.nome),
                        Row(
                          children: [
                            InkWell(
                                onTap: () {
                                  bool itemExists =
                                      selectedOA.contains(searchData[i]!.nome);
                                  if (!itemExists) {
                                    selectedOA.add(searchData[i]!.nome);
                                    addObjects();
                                  }
                                },
                                child: Icon(Icons.add_circle,
                                    color: CoresPersonalizadas.azulObama)),
                            InkWell(
                                onTap: () {
                                  selectedOA.remove(searchData[i]!.nome);
                                  addObjects();
                                },
                                child: Icon(Icons.remove_circle,
                                    color: CoresPersonalizadas.azulObama)),
                          ],
                        ),
                      ],
                    )),
              }
            ]),
          ),
          Container(
            width: swidth > 1200 ? 1200 * .4 : swidth * .4,
            child: Column(children: [
              Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("OA selecionados"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      cachedObjects == null || cachedObjects!.isEmpty
                          ? SizedBox()
                          : Tooltip(
                              message: "Remover tudo",
                              child: InkWell(
                                onTap: () async {
                                  final SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  await prefs.remove('objects');
                                  setState(() {
                                    selectedOA = [];
                                    cachedObjects = [];
                                  });
                                },
                                child: SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Center(
                                      child: Icon(Icons.clear,
                                          size: 18, color: onError)),
                                ),
                              )),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Divider(color: Colors.black38),
              ),
              if (cachedObjects == null || cachedObjects!.isEmpty) ...{
                Text("Sua lista de OA está vazia")
              } else ...{
                for (var cacheObject in cachedObjects!) ...{Text(cacheObject)}
              }
            ]),
          )
        ],
      ),
    );
  }
}