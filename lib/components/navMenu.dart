import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:obamahome/components/modalSearch.dart';

import '../app/views/search/searchOA_view.dart';
import '../utils/app_theme.dart';

class ItemValue {
  List<String?> subItems;
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
    name: "Home",
    path: ['/'],
    subItems: [],
    itemHover: false,
    subItemHover: List.generate(1, (index) => false),
  ),
  ItemValue(
    name: "Sobre",
    path: ['/sobre'],
    subItems: [],
    itemHover: false,
    subItemHover: List.generate(1, (index) => false),
  ),
  ItemValue(
    name: "Serviços",
    path: ['/servicos', '/trilhas', '/manuais'],
    subItems: ["OA", "Trilhas", "Manuais"],
    itemHover: false,
    subItemHover: List.generate(3, (index) => false),
  ),
  ItemValue(
    name: "Publicações",
    path: ['/blog', '/blog-detalhes'],
    subItems: ["Lista de Posts", "Último post"],
    itemHover: false,
    subItemHover: List.generate(2, (index) => false),
  ),
  ItemValue(
    name: "Formações",
    path: ['/formacoes'],
    subItems: [],
    itemHover: false,
    subItemHover: List.generate(1, (index) => false),
  ),
  ItemValue(
    name: "Planos de Aula",
    path: ['/planos-aulas/lista', '/planos-aulas/criar'],
    subItems: ['Lista', 'Criar um novo'],
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

String searchText = '';

Future searchObject(context, String value) async {
  if (value == '') {
    showMessage(context);
  } else {
    Navigator.pushNamed(context, '/servicos', arguments: value);
  }
}

class _NavMenuState extends State<NavMenu> {
  bool isHovered = false;

  Future registerSearch(context, String value) async {
    setState(() {
      searchText = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    String? currentRoute = ModalRoute.of(context)?.settings.name;
    double swidth = MediaQuery.of(context).size.width;

    return MenuBar(children: [
      for (int i = 0; i < itemValues.length; i++) ...{
        if (itemValues[i].subItems.isEmpty) ...{
          Center(
              child: Container(
                  height: 20,
                  padding: EdgeInsets.only(left: 18),
                  child: Material(
                    color: background,
                    child: InkWell(
                      onHover: (value) {
                        setState(() {
                          itemValues[i].itemHover = value;
                        });
                      },
                      hoverColor: background,
                      highlightColor: background,
                      onTap: () {
                        Navigator.pushNamed(context, itemValues[i].path[0]);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(itemValues[i].name.toUpperCase(),
                            style: GoogleFonts.raleway(
                                fontWeight: FontWeight.bold,
                                color: itemValues[i].path[0] == currentRoute
                                    ? primary
                                    : itemValues[i].itemHover
                                        ? primary
                                        : onPrimary)),
                      ),
                    ),
                  ))),
        } else ...{
          Padding(
              padding: EdgeInsets.only(left: 18),
              child: SubmenuButton(
                onHover: (value) {
                  setState(() {
                    itemValues[i].itemHover = value;
                  });
                },
                menuStyle: MenuStyle(
                  backgroundColor: MaterialStateProperty.all(background),
                ),
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
                      Container(
                        decoration: BoxDecoration(
                            // color: background,
                            border: j == 0
                                ? Border(
                                    top: BorderSide(color: surface, width: 3))
                                : Border(top: BorderSide.none)),
                        child: MenuItemButton(
                          onHover: (value) {
                            setState(() {
                              itemValues[i].itemHover = value;
                              itemValues[i].subItemHover[j] = value;
                            });
                          },
                          style: ButtonStyle(
                            padding: MaterialStatePropertyAll(
                                EdgeInsets.symmetric(horizontal: 20)),
                            minimumSize:
                                MaterialStatePropertyAll(Size(250, 44)),
                            backgroundColor:
                                MaterialStateProperty.all(background),
                            overlayColor: MaterialStateProperty.all(primary),
                            foregroundColor: MaterialStateProperty.all(
                                itemValues[i].subItemHover[j]
                                    ? background
                                    : onPrimary),
                            textStyle: MaterialStateProperty.all(
                                textTheme.displaySmall),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, itemValues[i].path[j],
                                arguments:
                                    itemValues[i].path[j] == '/blog-detalhes'
                                        ? 0
                                        : searchText);
                          },
                          child:
                              MenuAcceleratorLabel(itemValues[i].subItems[j]!),
                        ),
                      )
                    }
                  }
                ],
                child: MenuAcceleratorLabel(itemValues[i].name.toUpperCase()),
              )),
        }
      },
      Padding(
        padding: const EdgeInsets.only(left: 18),
        child: SizedBox(
          width: 36,
          height: 40,
          child: SearchDialog(
              swidth: swidth, searchText: searchText, isHovered: isHovered),
        ),
      ),
    ]);
  }
}
