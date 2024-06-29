import 'package:flutter/material.dart';
import 'package:obamahome/components/drawer.dart';

import '../../../../components/carousel.dart';
import '../../../../components/footer.dart';
import '../../../../components/navMenu.dart';
import '../../../../components/topbar.dart';
import '../components/bannerSuperior.dart';
import '../components/librasButton.dart';
import '../components/menuClass.dart';
import '../components/menuMobile.dart';

class TemplateColumn extends StatefulWidget {
  final List<Widget> children;

  const TemplateColumn({
    required this.children,
  });
  @override
  State<TemplateColumn> createState() => TemplateColumnState();
}

class TemplateColumnState extends State<TemplateColumn> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  String pageName = "";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => getPageName(context));
  }

  String getPageName(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    final matchingItem =
        itemValues.firstWhere((item) => item.path.contains(currentRoute ?? ""));

    setState(() {
      pageName = matchingItem.name;
    });
    return pageName;
  }

  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;

    return Scaffold(
        key: scaffoldKey,
        drawer: const drawermenu(),
        floatingActionButton: LibrasButton(),
        body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
                child: Column(children: <Widget>[
              TopBar(swidth),
              if (MediaQuery.of(context).size.width > 1360) ...[
                Container(
                    constraints: BoxConstraints(maxWidth: 1200),
                    width: swidth,
                    height: 125,
                    margin: EdgeInsets.only(
                        left: swidth * 0.068, right: swidth * 0.058),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              width: 240,
                              child: Image.asset('assets/images/logo.png',
                                  fit: BoxFit.fitHeight)),
                          NavMenu(
                              swidth: swidth,
                              heightBtn: 50,
                              itemValues: itemValues,
                              searchAvailable: true),
                        ])),
              ] else ...[
                menuMobile(context, scaffoldKey, swidth),
              ],
              if (ModalRoute.of(context)?.settings.name !=
                  '/planos-aulas/criar') ...{
                BannerSuperior(context, pageName),
              },
              Column(children: [...widget.children]),
              if (ModalRoute.of(context)?.settings.name !=
                  '/planos-aulas/criar') ...{
                Carousel(swidth),
                Footer(swidth),
              }
            ]))));
  }
}
