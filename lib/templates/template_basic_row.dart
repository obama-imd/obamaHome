import 'package:flutter/material.dart';
import 'package:obamahome/components/drawer.dart';

import '../../../../components/carousel.dart';
import '../../../../components/footer.dart';
import '../../../../components/navMenu.dart';
import '../../../../components/topbar.dart';
import '../components/menuMobile.dart';

class TemplateRow extends StatefulWidget {
  final List<Widget> children;
  const TemplateRow({
    required this.children,
  });

  @override
  State<TemplateRow> createState() => TemplateRowState();
}

class TemplateRowState extends State<TemplateRow> {
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
                menuMobile(context, scaffoldKey, swidth),
              ],
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...widget.children
                  ]),
              Carousel(swidth),
              Footer(swidth),
            ]))));
  }
}
