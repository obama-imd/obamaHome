import 'package:flutter/material.dart';
import 'package:obamahome/app/views/search/searchOA_view.dart';

import '../app/controllers/search_controller.dart';
import '../utils/app_theme.dart';

class ItemValue {
  final List<String> subItems;
  final String name;
  final List<String> path;

  ItemValue({required this.subItems, required this.name, required this.path});
}

final List<ItemValue> itemValues = [
  ItemValue(
    name: "HOME",
    path: ['/', '/'],
    subItems: ["Item 1", "Item 2"],
  ),
  ItemValue(
    name: "SOBRE",
    path: ['/aboutus'],
    subItems: ["Sobre"],
  ),
  ItemValue(
    name: "SERVIÇOS",
    path: ['/servicos', '/trilhas', '/manuais'],
    subItems: ["OA", "Trilhas", "Manuais"],
  ),
  ItemValue(
    name: "PUBLICAÇÕES",
    path: ['/blog', 'blog-details'],
    subItems: ["Lista de Posts", "Último post"],
  ),
  ItemValue(
    name: "FORMAÇÕES",
    path: ['/formacoes', '/formacoes'],
    subItems: ["Item 1", "Item 2"],
  ),
  ItemValue(
    name: "PLANOS DE AULA",
    path: ['/loja', '/loja'],
    subItems: ["Item 1", "Item 2"],
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

  @override
  Widget build(BuildContext context) {

    Future searchObject() async {
      List<dynamic> filteredData = await fetchData(searchText);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SearchDesktop(datas: filteredData)));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MenuBar( children: [
          for (int i = 0; i < itemValues.length; i++) ...{
            Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 5),
                child: SubmenuButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(background),
                    textStyle: MaterialStateProperty.all(
                        textTheme.headlineSmall),
                  ),
                  menuChildren: <Widget>[
                    if (i >= 0 && i < itemValues.length) ...{
                      for (var j = 0;
                          j < itemValues[i].subItems.length;
                          j++) ...{
                        MenuItemButton(
                          style: ButtonStyle(
                            padding: MaterialStatePropertyAll(
                                EdgeInsets.symmetric(horizontal: 20)),
                            minimumSize:
                                MaterialStatePropertyAll(Size(250, 44)),
                            backgroundColor:
                                MaterialStateProperty.all(background),
                            textStyle: MaterialStateProperty.all(
                                textTheme.displaySmall),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(
                                context, itemValues[i].path[j]);
                          },
                          child: MenuAcceleratorLabel(
                              itemValues[i].subItems[j]),
                        ),
                      }
                    }
                  ],
                  child: MenuAcceleratorLabel(itemValues[i].name),
                )),
          },
          InkWell(
              child: Container(
                  width: 40,
                  height: 40,
                  child: Icon(Icons.search, size: 20)),
              onTap: () => showDialog<String>(
                    barrierColor: modalBackground,
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      contentPadding: EdgeInsets.all(0),
                      content: Container(
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(23, 160, 242, .8),
                            borderRadius: BorderRadius.circular(25)),
                        padding: EdgeInsets.only(left: 20),
                        width: 500,
                        height: 100,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 420,
                              child: TextField(
                                  style: textTheme.bodySmall,
                                  decoration: InputDecoration(
                                      hintText: "Busca de OA",
                                      hintStyle: textTheme.bodySmall,
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: secondary))),
                                  onChanged: (value) => setState(() {
                                        searchText = value;
                                      }),
                                  onSubmitted: (value) {
                                    searchObject();
                                  }),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              child: IconButton(
                                icon:
                                    Icon(Icons.search, color: secondary),
                                onPressed: () {
                                  searchObject();
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
        ]),
      ],
    );
  }
}
