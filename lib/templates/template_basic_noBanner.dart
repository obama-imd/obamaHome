import 'package:flutter/material.dart';
import 'package:obamahome/components/drawer.dart';

import '../../../../components/carousel.dart';
import '../../../../components/footer.dart';
import '../../../../components/navMenu.dart';
import '../../../../components/topbar.dart';
import '../../../../utils/app_theme.dart';

class TemplateNoBanner extends StatefulWidget {
  dynamic children;
  TemplateNoBanner(this.children);
  @override
  State<TemplateNoBanner> createState() => BlogPageState();
}

class BlogPageState extends State<TemplateNoBanner> {
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
                    margin: EdgeInsets.only(
                        left: swidth * 0.068, right: swidth * 0.06),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              width: 250,
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
              Padding(
                padding: paddingValues("sideMainPadding", context),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ...widget.children
                    ]),
              ),
              Carousel(swidth),
              Footer(swidth),
            ]))));
  }
}
