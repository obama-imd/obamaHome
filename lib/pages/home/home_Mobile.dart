import 'package:flutter/material.dart';
import 'package:obamahome/components/cores_personalizadas.dart';
import 'package:obamahome/components/drawer.dart';
import 'package:obamahome/pages/home/components/firstSectionHome.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../components/carousel.dart';
import '../../components/footer.dart';
import '../../components/sectionTitle.dart';
import '../../components/topbar.dart';
import '../formations/dropdowns_formations.dart';
import 'components/our_product_item.dart';
import 'constants.dart';
import 'home1.dart';

class HomeMobile extends StatelessWidget {
  final TrackingScrollController scrollController;
  final bool dataAvailable;
  final List<dynamic> datas;

  const HomeMobile({
    required this.scrollController,
    required this.dataAvailable,
    required this.datas,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyStatefulWidget(
        scrollController: scrollController,
        dataAvailable: dataAvailable,
        datas: datas,
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  final TrackingScrollController scrollController;
  final bool dataAvailable;
  final List<dynamic> datas;

  const MyStatefulWidget({
    required this.scrollController,
    required this.dataAvailable,
    required this.datas,
    Key? key,
  }) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double paddingCard = MediaQuery.of(context).size.width * .3;
    double swidth = MediaQuery.of(context).size.width;

    return Scaffold(
      key: scaffoldKey,
      drawer: const drawermenu(),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(children: <Widget>[

            TopBar(swidth),

            if (MediaQuery.of(context).size.width != 1200) ...[
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 125,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  TextButton(
                      child: const Icon(Icons.menu, color: Colors.black),
                      onPressed: () => scaffoldKey.currentState?.openDrawer()),
                ]),
              ),

            ],

            // box com gif da foto tela inicial
            SizedBox(
                width: swidth,
                height: 300,
                // color: Colors.grey,
                child: Image.asset("assets/images/animate.gif",
                    fit: BoxFit.cover)),

            //abaixo do gif
            Container(
              height: 330,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(top: 120.0, bottom: 65.0),
              child: SectionTitle(
                  'Plataforma OBAMA',
                  'Objetos de Aprendizagem para Matemática',
                  CrossAxisAlignment.center),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: swidth * .05),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Expanded(
                  child: ResponsiveGridRow(
                    children: [
                      for (int i = 0; i < sectionTitle.length; i++) ...{
                        ResponsiveGridCol(
                          lg: 3,
                          md: 6,
                          xs: 12,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 30),
                            child: ItemProduto("Data Recovery",
                                "nononon nono nonon non !", "i1.png"),
                          ),
                        ),
                      }
                    ],
                  ),
                )),
            Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(top: 100),
                child: ResponsiveGridRow(children: [
                  ResponsiveGridCol(lg: 8, sm: 12, child: const Dropdowns()),
                  ResponsiveGridCol(
                    lg: 4,
                    sm: 12,
                    child: Container(
                        padding: const EdgeInsets.only(top: 17.5),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                  height: 50,
                                  child: Text('Need file recovery?',
                                      style: TextStyle(
                                          fontSize: 28,
                                          fontWeight: FontWeight.w500))),
                              const SizedBox(
                                  height: 120,
                                  child: Text('Texto',
                                      style: TextStyle(color: Colors.grey))),
                              Row(children: [
                                Container(
                                    height: 50,
                                    width: 170,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: TextButton(
                                        onPressed: () {},
                                        style: const ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  CoresPersonalizadas.azulObama),
                                          overlayColor:
                                              MaterialStatePropertyAll(
                                                  Colors.lightBlue),
                                        ),
                                        child: const Text('READ MORE',
                                            style: TextStyle(
                                                shadows: [
                                                  Shadow(
                                                      offset: Offset(1.1, 1.1))
                                                ],
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white)))),
                              ]),
                              Container(height: 140),
                            ])),
                  )
                ])),
            ResponsiveGridRow(children: [
              ResponsiveGridCol(
                lg: 8,
                sm: 12,
                child: Container(
                    color: const Color.fromARGB(255, 241, 238, 238),
                    padding: const EdgeInsets.only(top: 110, left: 90),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SectionTitle(
                              'ABOUT SERVICE',
                              'Easy and effective way to get your device repaired.',
                              CrossAxisAlignment.start),
                          Container(
                              padding: const EdgeInsets.only(top: 60),
                              child: ResponsiveGridRow(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    for (int i = 0;
                                        i < grid1Title.length;
                                        i++) ...{
                                      ResponsiveGridCol(
                                        lg: 6,
                                        sm: 12,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 100),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                    height: 100,
                                                    width: 100,
                                                    decoration: BoxDecoration(
                                                        color: CoresPersonalizadas.azulObama,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100)),
                                                    child: Icon(grid1Icon[i],
                                                        size: iconSize2[i],
                                                        color: Colors.white)),
                                                Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 20),
                                                    child: Text(grid1Title[i],
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20))),
                                                Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 20),
                                                    child: Text(grid1Content[i],
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.grey)))
                                              ]),
                                        ),
                                      ),
                                    },
                                  ]))
                        ])),
              ),
              if (swidth > 992) ...{
                ResponsiveGridCol(
                  lg: 4,
                  child: SizedBox(
                      height: 865,
                      child: Image.asset('assets/images/img2.jpg',
                          fit: BoxFit.cover)),
                ),
              }
            ]),
            Container(
              margin: const EdgeInsets.only(top: 120, bottom: 65.0),
              child: SectionTitle(
                  'OUR PRODUCTS',
                  'We package the products with best services to make you a happy customer.',
                  CrossAxisAlignment.center),
            ),
            // if (MediaQuery.of(context).size.width > 1000) ...[
            Padding(
              padding: EdgeInsets.only(
                  left: swidth * .05, right: swidth * .05, bottom: 100),
              child: ResponsiveGridRow(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  for (int i = 0; i < 4; i++) ...{
                    ResponsiveGridCol(
                      lg: 3,
                      md: 6,
                      xs: 12,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: paddingCard, vertical: 15),
                        child: const OurProductItem(
                          title: "PRODUCT",
                          image: 'assets/images/prod.jpg',
                        ),
                      ),
                    ),
                  }
                ],
              ),
            ),
            ResponsiveGridRow(children: [
              if (swidth > 992) ...{
                ResponsiveGridCol(
                  lg: 4,
                  child: SizedBox(
                      height: 865,
                      child: Image.asset('assets/images/img2.jpg',
                          fit: BoxFit.cover)),
                ),
              },
              ResponsiveGridCol(
                lg: 8,
                sm: 12,
                child: Container(
                    color: const Color.fromARGB(255, 241, 238, 238),
                    padding: const EdgeInsets.only(top: 110, right: 90),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SectionTitle(
                              'OUR FEEDBACK',
                              'Easy and effective way to get your device repaired.',
                              CrossAxisAlignment.end),
                          Container(
                              padding: const EdgeInsets.only(top: 60),
                              child: ResponsiveGridRow(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    for (int i = 0;
                                        i < grid2Title.length;
                                        i++) ...{
                                      ResponsiveGridCol(
                                        lg: 6,
                                        sm: 12,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 100),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Container(
                                                    height: 100,
                                                    width: 100,
                                                    decoration: BoxDecoration(
                                                        color: CoresPersonalizadas.azulObama,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100)),
                                                    child: Icon(grid2Icon[i],
                                                        size: iconSize2[i],
                                                        color: Colors.white)),
                                                Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 20),
                                                    child: Text(grid2Title[i],
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20))),
                                                Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 20),
                                                    child: Text(grid2Content[i],
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.grey)))
                                              ]),
                                        ),
                                      ),
                                    },
                                  ]))
                        ])),
              ),
            ]),
            if (widget.dataAvailable == false) ...{
              Padding(
                padding: const EdgeInsets.only(top: 120, left: 74, right: 74),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SectionTitle('Últimos posts do blog', '',
                              CrossAxisAlignment.start),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: ResponsiveGridRow(
                        children: [
                          for (int i = 0; i < widget.datas.length; i++) ...{
                            ResponsiveGridCol(
                                lg: 4,
                                md: 6,
                                xs: 12,
                                child: blogData(context, i, widget.datas)),
                          }
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            },
            Carousel(swidth),
            Footer(swidth),
          ])),
    );
  }
}
