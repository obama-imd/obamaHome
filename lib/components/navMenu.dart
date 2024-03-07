import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:obamahome/app/views/search/searchOA_view.dart';

import '../app/controllers/search_controller.dart';
import '../utils/app_theme.dart';

class ItemValue {
  final List<String> subItems;
  final List<bool> subItemHover;
  bool itemHover;
  final String name;
  final List<String> path;

  ItemValue(
      {required this.subItems,
      required this.subItemHover,
      required this.name,
      required this.itemHover,
      required this.path});
}

final List<ItemValue> itemValues = [
  ItemValue(
    name: "HOME",
    path: ['/', '/'],
    subItems: ["Item 1", "Item 2"],
    itemHover: false,
    subItemHover: List.generate(2, (index) => false),
  ),
  ItemValue(
    name: "SOBRE",
    path: ['/aboutus'],
    subItems: ["Sobre"],
    itemHover: false,
    subItemHover: List.generate(1, (index) => false),
  ),
  ItemValue(
    name: "SERVIÇOS",
    path: ['/servicos', '/trilhas', '/manuais'],
    subItems: ["OA", "Trilhas", "Manuais"],
    itemHover: false,
    subItemHover: List.generate(3, (index) => false),
  ),
  ItemValue(
    name: "PUBLICAÇÕES",
    path: ['/blog', 'blog-details'],
    subItems: ["Lista de Posts", "Último post"],
    itemHover: false,
    subItemHover: List.generate(2, (index) => false),
  ),
  ItemValue(
    name: "FORMAÇÕES",
    path: ['/formacoes', '/formacoes'],
    subItems: ["Item 1", "Item 2"],
    itemHover: false,
    subItemHover: List.generate(2, (index) => false),
  ),
  ItemValue(
    name: "PLANOS DE AULA",
    path: ['/loja', '/loja'],
    subItems: ["Item 1", "Item 2"],
    itemHover: false,
    subItemHover: List.generate(2, (index) => false),
  ),
];

class NavMenu extends StatefulWidget {
  final double swidth;
  final double heightBtn;

  const NavMenu({
    required this.swidth,
    required this.heightBtn,
  });

  @override
  State<NavMenu> createState() => _NavMenuState();
}

class _NavMenuState extends State<NavMenu> {
  String searchText = '';
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    Future searchObject() async {
      (List<Map<String, dynamic>>, Object?, Object?, Object?) filteredData =
          await fetchData(searchText);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SearchDesktop(datas: filteredData.$1)));
    }

    String? currentRoute = ModalRoute.of(context)?.settings.name;
    double swidth = MediaQuery.of(context).size.width;

    return MenuBar(children: [
      for (int i = 0; i < itemValues.length; i++) ...{
        Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 5),
            child: SubmenuButton(
              onHover: (value) {
                setState(() {
                  itemValues[i].itemHover = value;
                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(background),
                foregroundColor: MaterialStateProperty.all(
                    itemValues[i].path.contains(currentRoute)
                        ? primary
                        : itemValues[i].itemHover
                            ? primary
                            : onPrimary),
                textStyle: MaterialStateProperty.all(textTheme.headlineSmall),
              ),
              menuChildren: <Widget>[
                if (i >= 0 && i < itemValues.length) ...{
                  for (var j = 0; j < itemValues[i].subItems.length; j++) ...{
                    MenuItemButton(
                      onHover: (value) {
                        setState(() {
                          itemValues[i].itemHover = value;
                          itemValues[i].subItemHover[j] = value;
                        });
                      },
                      style: ButtonStyle(
                        padding: MaterialStatePropertyAll(
                            EdgeInsets.symmetric(horizontal: 20)),
                        minimumSize: MaterialStatePropertyAll(Size(250, 44)),
                        backgroundColor: MaterialStateProperty.all(background),
                        overlayColor: MaterialStateProperty.all(primary),
                        foregroundColor: MaterialStateProperty.all(
                            itemValues[i].subItemHover[j]
                                ? background
                                : onPrimary),
                        textStyle:
                            MaterialStateProperty.all(textTheme.displaySmall),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, itemValues[i].path[j]);
                      },
                      child: MenuAcceleratorLabel(itemValues[i].subItems[j]),
                    ),
                  }
                }
              ],
              child: MenuAcceleratorLabel(itemValues[i].name),
            )),
      },
      MenuItemButton(
          onHover: (value) {
            setState(() {
              isHovered = value;
            });
          },
          child: Container(
              width: 40,
              height: 40,
              child: Icon(Icons.search,
                  size: 20, color: isHovered ? primary : onPrimary)),
          onPressed: () => showDialog<String>(
                barrierColor: modalBackground,
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  backgroundColor: onSecondary,
                  contentPadding: EdgeInsets.all(0),
                  content: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25)),
                        padding: EdgeInsets.only(left: 20),
                        width: swidth * .7,
                        height: 100,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: swidth * .6,
                              child: TextField(
                                  style: TextStyle(
                                      fontSize: 60,
                                      fontWeight: FontWeight.bold,
                                      color: background),
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(bottom: 20),
                                      hintText: "Busca de OA",
                                      hintStyle: TextStyle(
                                        fontSize: 60,
                                        fontWeight: FontWeight.bold,
                                        color: background,
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: secondary))),
                                  onChanged: (value) => setState(() {
                                        searchText = value;
                                      }),
                                  onSubmitted: (value) {
                                    searchObject();
                                  }),
                            ),
                            Container(
                              width: 100,
                              height: 100,
                              child: IconButton(
                                hoverColor: null,
                                highlightColor: null,
                                icon: Icon(CupertinoIcons.search,
                                    color: secondary, size: 80),
                                onPressed: () {
                                  searchObject();
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 25),
                            child: Text("Consulte os OA disponíveis no nosso catálogo"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )),
    ]);
  }
}
