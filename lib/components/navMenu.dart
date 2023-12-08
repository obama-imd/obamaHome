import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:obamahome/components/menu.dart';

final TextEditingController _searchController = TextEditingController();

List<String> selValue = [
  "HOME",
  "SOBRE",
  "SERVIÇOS",
  "PUBLICAÇÕES",
  "FORMAÇÕES",
  "PLANOS DE AULA",
];

List<dynamic> selValueContent = [
  menuItem(const Text("HOME")),
  menuItem(const Text("SOBRE")),
  menuItem(const Text("SERVIÇOS")),
  menuItem(const Text("PUBLICAÇÕES")),
  menuItem(const Text("FORMAÇÕES")),
  menuItem(const Text("PLANOS DE AULA")),
];

// List<itemValue> itemKeys = [
//     'itemsHome',
//     'itemsBoutUs',
//     'itemsServices',
//     'itemsBlog',
//     'itemsPages',
//     'itemsShop',
//     'itemsContact',
// ];

class ItemValue {
  final List<String>? itemsHome;
  final List<String>? itemsBoutUs;
  final List<String>? itemsServices;
  final List<String>? itemsBlog;
  final List<String>? itemsPages;
  final List<String>? itemsShop;
  // final List<String>? itemsSearch;

  ItemValue({
    this.itemsHome,
    this.itemsBoutUs,
    this.itemsServices,
    this.itemsBlog,
    this.itemsPages,
    this.itemsShop,
    // this.itemsSearch,
  });
}

final List<ItemValue> itemValues = [
  ItemValue(
    itemsHome: ["Item 1", "Item 2"],
    itemsBoutUs: ["Sobre"],
    itemsServices: ["Item 1", "Item 2"],
    itemsBlog: ["Lista de Posts", "Último post"],
    itemsPages: ["Item 1", "Item 2"],
    itemsShop: ["Item 1", "Item 2"],
    // itemsSearch: ["Item 1", "Item 2"],
  )
];

List<String> navigateTo = [
  '/',
  '/aboutus',
  '/servicos',
  '/blog',
  '/paginas',
  '/loja',
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
  @override
  Widget build(BuildContext context) {
    bool displaySearchBtn = true;
    bool showBtn = true;
    double sizedBoxWidth;

    if (widget.eixoLista == Axis.vertical) {
      sizedBoxWidth = widget.swidth * .3;
      showBtn = false;
    } else {
      sizedBoxWidth = widget.swidth * 0.5;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          width: sizedBoxWidth,
          height: widget.heightBtn,
          child: ListView(scrollDirection: widget.eixoLista, children: [
            for (int i = 0; i < selValue.length; i++) ...{
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.5),
                  child: MenuBar0(context, i, selValue[i], selValueContent[i])),
            },
            if (showBtn == true) ...{
              AnimSearchBar(
                rtl: true,
                autoFocus: true,
                width: 300,
                textController: _searchController,
                onSuffixTap: () {
                  _searchController.clear();
                },
                onSubmitted: (String value) {
                  debugPrint('onFieldSubmitted value $value');
                },
              ),
            }
          ]),
        ),
      ],
    );
  }
}
