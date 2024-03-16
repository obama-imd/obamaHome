import 'package:flutter/material.dart';
import 'package:obamahome/components/drawer.dart';

import '../../../../components/carousel.dart';
import '../../../../components/footer.dart';
import '../../../../components/navMenu.dart';
import '../../../../components/topbar.dart';
import '../../../../utils/app_theme.dart';

// ignore: must_be_immutable
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

  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;

    return Scaffold(
        key: scaffoldKey,
        drawer: const drawermenu(),
        body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
                child: Column(children: <Widget>[
              TopBar(swidth),
              if (MediaQuery.of(context).size.width > 1360) ...[
                Container(
                    width: swidth,
                    height: 125,
                    margin:  EdgeInsets.only(
                        left: swidth * 0.068, right: swidth * 0.058),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              width: 240,
                              child: Image.asset('assets/images/logo.png',
                                  fit: BoxFit.fitHeight)),
                          NavMenu(swidth: swidth, heightBtn: 50),
                        ])),
              ] else ...[
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 125,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              child: const Icon(Icons.menu, color: onPrimary),
                              onPressed: () =>
                                  scaffoldKey.currentState?.openDrawer()),
                          Container(
                              width: 280,
                              margin:
                                  const EdgeInsets.only(right: 15, left: 15),
                              child: Image.asset('assets/images/logo.png',
                                  fit: BoxFit.fitHeight)),
                          TextButton(
                              onPressed: () {},
                              child: const Icon(Icons.search,
                                  color: onPrimary, size: 25))
                        ]))
              ],
              Column(
                  children: [
                    ...widget.children
                  ]),
              Carousel(swidth),
              Footer(swidth),
            ]))));
  }
}
