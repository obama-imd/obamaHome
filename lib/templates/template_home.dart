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

class _HomeDesktopState extends State<TemplateHome>
    with TickerProviderStateMixin {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              Stack(children: [
                Container(
                    width: swidth,
                    constraints: BoxConstraints(maxHeight: 660),
                    child: Image.asset("assets/images/animate.gif",
                        fit: BoxFit.cover)),
                LinearProgressIndicator(
                  minHeight: 5,
                  backgroundColor: onSecondary,
                  value: controller.value,
                ),
              ]),
              ...widget.children,
              Carousel(swidth),
              Footer(swidth),
            ])));
  }
}
