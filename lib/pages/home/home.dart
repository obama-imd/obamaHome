import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:html/parser.dart';
import 'package:image_network/image_network.dart';
import 'package:intl/intl.dart';
import 'package:obamahome/components/drawer.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../components/carousel.dart';
import '../../components/dropdowns.dart';
import '../../components/firstSectionHome.dart';
import '../../components/footer.dart';
import '../../components/menu.dart';
import '../../components/sectionTitle.dart';
import '../../components/topbar.dart';
import '../../services/api_blog.dart';
import '../../widgets/our_product_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: MyStatefulWidget());
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);
  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool dataAvailable = true;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  List<dynamic> datas = [];

  // First Component Section

  List<String> sectionTitle = [
    "Data Recovery",
    "Computer repair",
    "Mobile service",
    "Data Recovery",
  ];

  List<String> sectionImage = [
    "i1.png",
    "i2.png",
    "i3.png",
    "i4.png",
  ];

  List<String> sectionContent = [
    "nononon nono nonon non !",
    "nononon nono nonon non !",
    "nononon nono nonon non !",
    "nononon nono nonon non !",
  ];

  // First Grid Block

  List<String> grid1Title = [
    "Data Recovery",
    "Computer repair",
    "Mobile service",
    "Data Recovery",
  ];

  List<IconData> grid1Icon = [
    FontAwesomeIcons.wrench,
    Icons.settings,
    Icons.settings_backup_restore_rounded,
    FontAwesomeIcons.heart,
  ];

  List<double> iconSize = [38, 44, 46, 39];

  List<String> grid1Content = [
    "nononon nono nonon non !",
    "nononon nono nonon non !",
    "nononon nono nonon non !",
    "nononon nono nonon non !",
  ];

  // Second Grid Block

  List<String> grid2Title = [
    "OAs",
    "OAs Autorais",
    "Planos de Aula",
    "Trilhas",
  ];

  List<IconData> grid2Icon = [
    FontAwesomeIcons.faceSmile,
    FontAwesomeIcons.laptop,
    FontAwesomeIcons.desktop,
    FontAwesomeIcons.windows,
  ];

  List<double> iconSize2 = [60, 60, 65, 65];

  List<String> grid2Content = [
    "nononon nono nonon non !",
    "nononon nono nonon non !",
    "nononon nono nonon non !",
    "nononon nono nonon non !",
  ];

  Future<void> fetchDataAndUpdateState() async {
    final fetchedData = await fetchData();
    setState(() {
      if (fetchedData.isNotEmpty) {
        dataAvailable = false;
        datas = fetchedData;
      } else {
        dataAvailable = true;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    fetchDataAndUpdateState();
  }

  Widget BlogData(BuildContext context, index) {
    double swid = MediaQuery.of(context).size.width;

    final item = datas[index];

    String extractImagePath(String content) {
      final document = parse(content);
      final imgElement = document.getElementsByTagName('img').last;
      final result = imgElement.attributes['src'];
      return result!;
    }

    String imagePath = extractImagePath(item['content']);

    String extractSummaryPath(String summary) {
      final document = parse(summary);
      final sumElement = document.getElementsByTagName('p').last;
      final sumValue = sumElement.text;
      return sumValue;
    }

    String pubDate = item['published_date'];
    DateTime dateTime = DateTime.parse(pubDate);
    String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);

    // String sumValue = extractSummaryPath(item['summary']);

    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageNetwork(
              image: imagePath,
              width: swid * .3,
              height: 185,
              fitAndroidIos: BoxFit.cover,
              fitWeb: BoxFitWeb.cover),
          // Text(imagePath),
          Row(
            children: [
              const Icon(Icons.access_time, size: 16),
              Text(formattedDate, style: const TextStyle(fontSize: 14)),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Text(item['title'],
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 18)),
          ),
          Text(item['text'],
              style: const TextStyle(fontSize: 15), maxLines: 4),
          // Text(sumValue),
        ],
      ),
    );
  }

  _ajustarVisualizacao(double larguraTela) {
    int colunas = 2;
    if (larguraTela <= 600) {
      colunas = 2;
    } else if (larguraTela <= 960) {
      colunas = 4;
    } else {
      colunas = 4;
    }
    return colunas;
  }

  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    final double paddingCard;

    if (swidth > 992) {
      paddingCard = 10;
    } else {
      paddingCard = 120;
    }

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
                          navBarMenu(context, swidth),
                        ])),
              ] else ...[
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 125,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              child:
                                  const Icon(Icons.menu, color: Colors.black),
                              onPressed: () =>
                                  scaffoldKey.currentState?.openDrawer()),
                          Container(
                              width: 280,
                              padding:
                                  const EdgeInsets.only(right: 30, left: 30),
                              child: Image.asset('assets/images/logo.png',
                                  fit: BoxFit.fitHeight)),
                          TextButton(
                              onPressed: () {},
                              child: const Icon(Icons.search,
                                  color: Colors.black, size: 25))
                        ]))
              ],
              SizedBox(
                  width: swidth,
                  height: 660,
                  // color: Colors.grey,
                  child: Image.asset("assets/images/animate.gif",
                      fit: BoxFit.cover)),
              Container(
                height: 320,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(top: 120.0, bottom: 65.0),
                child: SectionTitle(
                    'Plataforma OBAMA',
                    'Objetos de Aprendizagem para Matemática',
                    CrossAxisAlignment.center),
              ),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 74),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Expanded(
                    child: ResponsiveGridRow(
                      // espaçamento entre itens
                      children: [
                        for (int i = 0; i < sectionTitle.length; i++) ...{
                          ResponsiveGridCol(
                            lg: 3,
                            md: 6,
                            xs: 12,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: ItemProduto("Data Recovery",
                                  "nononon nono nonon non !", "i1.png"),
                            ),
                          ),
                        }
                      ],
                    ),
                  )),
              if (MediaQuery.of(context).size.width > 1200) ...[
                Container(
                    height: 490,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(
                        top: 60,
                        left: MediaQuery.of(context).size.width * 0.07),
                    child: Row(children: [
                      const Dropdowns(),
                      Container(
                          padding: const EdgeInsets.only(left: 30, top: 17.5),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                    height: 50,
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    child: const Text('Need file recovery?',
                                        style: TextStyle(
                                            fontSize: 28,
                                            fontWeight: FontWeight.w500))),
                                SizedBox(
                                    height: 120,
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: const Text('Texto',
                                        style: TextStyle(color: Colors.grey))),
                                Container(
                                    child: Row(children: [
                                  Container(
                                      height: 50,
                                      width: 150,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: Colors.blue),
                                      child: TextButton(
                                          onPressed: () {},
                                          child: const Text('READ MORE',
                                              style: TextStyle(
                                                  shadows: [
                                                    Shadow(
                                                        offset:
                                                            Offset(1.1, 1.1))
                                                  ],
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white)))),
                                  SizedBox(
                                      height: 50,
                                      width: MediaQuery.of(context).size.width *
                                          0.15)
                                ])),
                                Container(height: 140),
                              ]))
                    ])),
              ] else ...[
                Container(
                    height: 640,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(top: 60),
                    child: Column(children: [
                      const Dropdowns(),
                      Container(
                          padding: const EdgeInsets.only(left: 40, top: 50),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                    height: 50,
                                    width: MediaQuery.of(context).size.width,
                                    child: const Text('Need file recovery?',
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w500))),
                                SizedBox(
                                    height: 120,
                                    width: MediaQuery.of(context).size.width,
                                    child: const Text('Texto',
                                        style: TextStyle(color: Colors.grey))),
                                Container(
                                    child: Row(children: [
                                  Container(
                                      height: 50,
                                      width: 150,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: Colors.blue),
                                      child: TextButton(
                                          onPressed: () {},
                                          child: const Text('READ MORE',
                                              style: TextStyle(
                                                  shadows: [
                                                    Shadow(
                                                        offset:
                                                            Offset(1.1, 1.1))
                                                  ],
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white)))),
                                  SizedBox(
                                      height: 30,
                                      width: MediaQuery.of(context).size.width *
                                          0.15)
                                ])),
                              ]))
                    ]))
              ],
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      for (int i = 0;
                                          i < grid1Title.length;
                                          i++) ...{
                                        ResponsiveGridCol(
                                          lg: 6,
                                          md: 12,
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
                                                          color: Colors.blue,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100)),
                                                      child: Icon(grid1Icon[i],
                                                          size: iconSize2[i],
                                                          color: Colors.white)),
                                                  Container(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 20),
                                                      child: Text(grid1Title[i],
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 20))),
                                                  Container(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 20),
                                                      child: Text(
                                                          grid1Content[i],
                                                          style: TextStyle(
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
                padding: EdgeInsets.only(left: 50, right: 50, bottom: 100),
                child: ResponsiveGridRow(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ResponsiveGridCol(
                      lg: 3,
                      md: 6,
                      xs: 12,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: paddingCard, vertical: 15),
                        child: OurProductItem(
                          title: "PRODUCT",
                          image: 'assets/images/prod.jpg',
                        ),
                      ),
                    ),
                    ResponsiveGridCol(
                      lg: 3,
                      md: 6,
                      xs: 12,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: paddingCard, vertical: 15),
                        child: OurProductItem(
                          title: "PRODUCT",
                          image: 'assets/images/prod.jpg',
                        ),
                      ),
                    ),
                    ResponsiveGridCol(
                      lg: 3,
                      md: 6,
                      xs: 12,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: paddingCard, vertical: 15),
                        child: OurProductItem(
                          title: "PRODUCT",
                          image: 'assets/images/prod.jpg',
                        ),
                      ),
                    ),
                    ResponsiveGridCol(
                      lg: 3,
                      md: 6,
                      xs: 12,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: paddingCard, vertical: 15),
                        child: OurProductItem(
                          title: "PRODUCT",
                          image: 'assets/images/prod.jpg',
                        ),
                      ),
                    ),
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
                                padding:
                                    const EdgeInsets.only(top: 60, right: 90),
                                child: ResponsiveGridRow(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      for (int i = 0;
                                          i < grid2Title.length;
                                          i++) ...{
                                        ResponsiveGridCol(
                                          lg: 6,
                                          md: 12,
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
                                                          color: Colors.blue,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100)),
                                                      child: Icon(grid2Icon[i],
                                                          size: iconSize2[i],
                                                          color: Colors.white)),
                                                  Container(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 20),
                                                      child: Text(grid2Title[i],
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 20))),
                                                  Container(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 20),
                                                      child: Text(
                                                          grid2Content[i],
                                                          style: TextStyle(
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
              if (dataAvailable == false) ...{
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
                            for (int i = 0; i < datas.length; i++) ...{
                              ResponsiveGridCol(
                              lg: 4,
                              md: 6,
                              xs: 12,
                              child: BlogData(context, i)),
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
            ]))));
  }
}
