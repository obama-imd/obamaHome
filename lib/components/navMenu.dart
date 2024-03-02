import 'package:flutter/material.dart';
import 'package:obamahome/app/views/search/searchOA_view.dart';
import 'package:obamahome/components/menu.dart';
import 'package:obamahome/utils/app_theme.dart';

import '../app/controllers/search_controller.dart';

final TextEditingController _searchController = TextEditingController();

List<dynamic> selValueContent = [
  menuItem(const Text("HOME")),
  menuItem(const Text("SOBRE")),
  menuItem(const Text("SERVIÇOS")),
  menuItem(const Text("PUBLICAÇÕES")),
  menuItem(const Text("FORMAÇÕES")),
  menuItem(const Text("PLANOS DE AULA")),
];

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
    path: ['/servicos', '/trilhas'],
    subItems: ["OA", "Trilhas"],
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
  final Axis eixoLista;
  final double heightBtn;

  const NavMenu({
    required this.swidth,
    required this.eixoLista,
    required this.heightBtn,
  });

  @override
  State<NavMenu> createState() => _NavMenuState();
}

class _NavMenuState extends State<NavMenu> {
  String searchText = '';
  final TextEditingController _controller = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    bool dataAvailable = true;
    Key key = UniqueKey();

    List<dynamic> postsList = [];
    List<dynamic> datas = [];

    bool showBtn = false;
    double sizedBoxWidth;
    double sheight = MediaQuery.of(context).size.height;

    if (widget.eixoLista == Axis.vertical) {
      sizedBoxWidth = widget.swidth * .8;
      showBtn = false;
    } else {
      sizedBoxWidth = widget.swidth * 0.505;
    }

    void initState() {
      super.initState();
    }

    void updateData(newData) {
      setState(() {
        datas = newData;
        key = UniqueKey();
      });
    }

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
        SizedBox(
          width: sizedBoxWidth,
          height: widget.heightBtn,
          child: ListView(scrollDirection: widget.eixoLista, children: [
            for (int i = 0; i < itemValues.length; i++) ...{
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.5),
                  child: MenuBar0(
                      context, i, itemValues[i].name, selValueContent[i])),
            },
            IconButton(
                iconSize: 20,
                icon: Icon(Icons.search),
                onPressed: () => showDialog<String>(
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
                                    style: TextStyle(color: secondary),
                                    decoration: InputDecoration(
                                        hintText: "Busca de OA",
                                        hintStyle: TextStyle(color: secondary),
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
                                padding: EdgeInsets.only(left: 10),
                                child: IconButton(
                                  icon: Icon(Icons.search, color: secondary),
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
        ),
      ],
    );
  }
}
