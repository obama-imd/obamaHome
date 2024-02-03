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
  String searchText = '';
  final TextEditingController _controller = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    // bool displaySearchBtn = true;
    // double btnWidth = 50;
    bool showBtn = false;
    double sizedBoxWidth;
    double sheight = MediaQuery.of(context).size.height;

    if (widget.eixoLista == Axis.vertical) {
      sizedBoxWidth = widget.swidth * .8;
      showBtn = false;
    } else {
      sizedBoxWidth = widget.swidth * 0.505;
    }

    // Future<void> _showSearch() async {
    //   return showDialog<void>(
    //     context: context,
    //     barrierDismissible: false, // user must tap button!
    //     builder: (BuildContext context) {
    //       return AlertDialog(
    //         title: const Text('AlertDialog Title'),
    //         content: const SingleChildScrollView(
    //           child: ListBody(
    //             children: <Widget>[
    //               Text('This is a demo alert dialog.'),
    //               Text('Would you like to approve of this message?'),
    //             ],
    //           ),
    //         ),
    //         actions: <Widget>[
    //           TextButton(
    //             child: const Text('Approve'),
    //             onPressed: () {
    //               Navigator.of(context).pop();
    //             },
    //           ),
    //         ],
    //       );
    //     },
    //   );
    // }

    void initState() {
      super.initState();

      // setState(() {
      //   btnWidth = 50;
      // });
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
            IconButton(
              iconSize: 20,
                icon: Icon(Icons.search),
                onPressed: () => showDialog<String>(
                      barrierColor: Color.fromARGB(222, 33, 149, 243),
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        // backgroundColor: Color.fromARGB(209, 33, 149, 243),
                        contentPadding: EdgeInsets.all(0),
                        content: Container(
                          width: 400,
                          height: 50,
                          child: SearchBar(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.white),
                              overlayColor:
                                  MaterialStatePropertyAll(Colors.white),
                              onChanged: (value) => setState(() {
                                    searchText = value;
                                  }),
                              onSubmitted: (value) {
                                debugPrint('value on Field Submitted');
                                setState(() {
                                  searchText = value;
                                });
                              }),
                        ),
                        // actions: <Widget>[
                        //   TextButton(
                        //     onPressed: () => Navigator.pop(context, 'Cancel'),
                        //     child: const Text('Cancel'),
                        //   ),
                        //   TextButton(
                        //     onPressed: () => Navigator.pop(context, 'OK'),
                        //     child: const Text('OK'),
                        //   ),
                        // ],
                      ),
                    )),
            // AnimSearchBar(
            //   rtl: true,
            //   autoFocus: true,
            //   width: 300,
            //   textController: _searchController,
            //   onSuffixTap: () {
            //     _searchController.clear();
            //   },
            //   onSubmitted: (String value) {
            //     debugPrint('onFieldSubmitted value $value');
            //   },
            // ),
          ]),
        ),
      ],
    );
  }
}
