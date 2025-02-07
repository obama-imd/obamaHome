import 'package:flutter/material.dart';
import 'package:obamahome/components/drawer.dart';

import '../../../../components/carousel.dart';
import '../../../../components/footer.dart';
import '../../../../components/menuMobile.dart';
import '../../../../components/navMenu.dart';
import '../../../../components/topbar.dart';
import '../components/librasButton.dart';
import '../components/menuClass.dart';
import '../utils/app_theme.dart';

final List<String> imageCarousel = [
  "assets/images/slider1.jpg",
  "assets/images/slider2.jpg",
  "assets/images/slider3.jpg"
];

class TemplateHome extends StatefulWidget {
  final List<Widget> children;

  const TemplateHome({
    required this.children,
  });

  @override
  State<TemplateHome> createState() => _TemplateHomeState();
}

class _TemplateHomeState extends State<TemplateHome>
    with TickerProviderStateMixin {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  late AnimationController controller;
  int index = 0;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this);
    _changeImagePeriodically();
  }

  void _changeImagePeriodically() {
    Future.delayed(Duration(seconds: 4), () {
      setState(() {
        index = (index + 1) % imageCarousel.length;
      });
      controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 4),
      )..forward();
      _changeImagePeriodically();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;

    return Scaffold(
        key: scaffoldKey,
        drawer: const drawermenu(),
        floatingActionButton: LibrasButton(swidth: swidth),
        body: SafeArea(
          child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(children: <Widget>[
                TopBar(swidth),
                if (swidth >= 1360) ...[
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
                                itemValues: getItemValues(),
                                searchAvailable: true),
                          ])),
                ] else ...[
                  menuMobile(context, scaffoldKey, swidth),
                ],
                Stack(
                  children: [
                    // Container(
                    //   //   constraints: BoxConstraints(maxHeight: 660, minWidth: swidth),
                    //   //   child: Image.asset("assets/images/team.gif", fit: BoxFit.cover,)
                    //   child: ImageSlideshow(
                    //       // width: swidth,
                    //       height: 660,
                    //       initialPage: 0,
                    //       // indicatorColor: CoresPersonalizadas.azulObama,
                    //       // indicatorBackgroundColor: Colors.grey,
                    //       onPageChanged: (value) {},
                    //       autoPlayInterval: 3600,
                    //       isLoop: true,
                    //       children: [
                    //         for (int i = 0; i < imageCarousel.length; i++) ...{
                    //           Image.asset(
                    //             imageCarousel[i],
                    //             fit: BoxFit.cover,
                    //           ),
                    //         },
                    //       ]),
                    // ),
                    Stack(
                      children: [
                        Container(
                            constraints: BoxConstraints(
                                maxHeight: 660, minWidth: swidth),
                            child: Image.asset(
                              imageCarousel[(index + 1) % imageCarousel.length],
                              fit: BoxFit.cover,
                            )),
                        Container(
                            constraints: BoxConstraints(
                                maxHeight: 660, minWidth: swidth),
                            child: Image.asset(
                              imageCarousel[index],
                              fit: BoxFit.cover,
                            )),
                        AnimatedBuilder(
                          animation: controller,
                          builder: (context, child) {
                            return LinearProgressIndicator(
                              minHeight: 5,
                              backgroundColor: onSecondary,
                              value: controller.value,
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                ...widget.children,
                Carousel(swidth),
                Footer(swidth),
              ])),
        ));
  }
}
