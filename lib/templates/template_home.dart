import 'package:flutter/material.dart';
import 'package:obamahome/components/drawer.dart';

import '../../../../components/carousel.dart';
import '../../../../components/footer.dart';
import '../../../../components/menuMobile.dart';
import '../../../../components/navMenu.dart';
import '../../../../components/topbar.dart';
import '../../../../utils/app_theme.dart';

class TemplateHome extends StatefulWidget {
  final List<Widget> children;

  const TemplateHome({
    required this.children,
  });

  @override
  State<TemplateHome> createState() => _HomeDesktopState();
}

class _HomeDesktopState extends State<TemplateHome> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // double paddingCard = MediaQuery.of(context).size.width * .025;
    double swidth = MediaQuery.of(context).size.width;

    return Scaffold(
        key: scaffoldKey,
        drawer: const drawermenu(),
        body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(children: <Widget>[
              TopBar(swidth),
              if (swidth >= 1360) ...[
                Padding(
                  padding: EdgeInsets.only(
                      left: swidth * 0.068, right: swidth * 0.058),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: paddingValues("logo", context),
                          child: SizedBox(
                              width: 240,
                              child: Image.asset('assets/images/logo.png',
                                  fit: BoxFit.fitHeight)),
                        ),
                        NavMenu(swidth: swidth, heightBtn: 50),
                      ]),
                ),
              ] else ...[
                menuMobile(context, scaffoldKey, swidth),
              ],
              LinearProgressIndicator(
                minHeight: 5,
              ),
              ...widget.children,
              Carousel(swidth),
              Footer(swidth),
            ])));
  }
}
