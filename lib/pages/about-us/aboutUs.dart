import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../components/carousel.dart';
import '../../components/drawer.dart';
import '../../components/dropdowns.dart';
import '../../components/footer.dart';
import '../../components/menu.dart';
import '../../components/sectionTitle.dart';
import '../../components/staff.dart';
import '../../components/topbar.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);
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
  var scaffoldKey = GlobalKey<ScaffoldState>();

  List<String> staffNames = [
    "Dean Michael",
    "Dean Michael",
    "Dean Michael",
    "Dean Michael",
    "Dean Michael",
    "Dean Michael",
    "Dean Michael",
    "Dean Michael",
  ];

  List<String> staffImgs = [
    "assets/images/img3.jpg",
    "assets/images/img3.jpg",
    "assets/images/img3.jpg",
    "assets/images/img3.jpg",
    "assets/images/img3.jpg",
    "assets/images/img3.jpg",
    "assets/images/img3.jpg",
    "assets/images/img3.jpg",
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
              Container(
                  child: Stack(children: <Widget>[
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/img.jpg'),
                          fit: BoxFit.cover),
                    )),
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    padding: const EdgeInsets.only(top: 85.0, left: 92.0),
                    child: ListView(children: [
                      const Text(
                        'Sobre Nós',
                        textScaleFactor: 3.1,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Container(
                          child: Row(children: [
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Home',
                              textScaleFactor: 1.11,
                              style: TextStyle(color: Colors.blue),
                            )),
                        const Text(
                          '>  ',
                          textScaleFactor: 1.11,
                          style: TextStyle(color: Colors.grey),
                        ),
                        const Text(
                          'Sobre Nós',
                          textScaleFactor: 1.11,
                          style: TextStyle(color: Colors.white),
                        ),
                      ]))
                    ]))
              ])),
              Container(
                height: 320,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(top: 120.0, bottom: 65.0),
                child: SectionTitle(
                    'Plataforma OBAMA',
                    'Objetos de Aprendizagem para Matemática',
                    CrossAxisAlignment.center),
              ),
              // if (MediaQuery.of(context).size.width > 1200) ...[
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 72),
                child: ResponsiveGridRow(children: [
                  ResponsiveGridCol(
                    lg: 6,
                    sm: 12,
                    child: Container(
                        height: 343,
                        color: const Color.fromARGB(255, 224, 220, 220),
                        padding: const EdgeInsets.only(left: 40.0, top: 30.0),
                        child: ListView(children: [
                          const Text('What we do',
                              textScaleFactor: 2.0,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Container(height: 15),
                          const Text('Texto',
                              textScaleFactor: 1.1,
                              style: TextStyle(color: Colors.grey))
                        ])),
                  ),
                  ResponsiveGridCol(
                    lg: 6,
                    sm: 12,
                    child: Container(
                        color: const Color.fromARGB(255, 224, 220, 220),
                        height: 343,
                        child: CustomVideo()),
                  )
                ]),
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(top: 100, left: 70, right: 70),
                  child: ResponsiveGridRow(children: [
                    ResponsiveGridCol(lg: 8, sm: 12, child: const Padding(
                      padding: EdgeInsets.only(bottom: 35),
                      child: Dropdowns(),
                    )),
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
                                Container(
                                    child: Row(children: [
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
                                                    Colors.blue),
                                            overlayColor:
                                                MaterialStatePropertyAll(
                                                    Colors.lightBlue),
                                          ),
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
                                ])),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                          color: Colors.blue,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100)),
                                                      child: Icon(grid1Icon[i],
                                                          size: iconSize[i],
                                                          color: Colors.white)),
                                                  Container(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 20),
                                                      child: Text(grid1Title[i],
                                                          style: const TextStyle(
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
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(
                      left: swidth * 0.07, top: 120.0, bottom: 65.0),
                  child: SectionTitle(
                      'EXPERIENCED STAFF',
                      'Our experts have been featured in press numerous times.',
                      CrossAxisAlignment.start),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: swidth * 0.06),
                  child: ResponsiveGridRow(children: [
                    for (int i = 0; i < 4; i++) ...{
                      ResponsiveGridCol(
                          lg: 3,
                          md: 6,
                          xs: 12,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 30, left: 10, right: 10),
                            child: StaffCard(staffNames[i], staffImgs[i], swidth),
                          ))
                    }
                  ]),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: swidth * 0.06),
                  child: ResponsiveGridRow(children: [
                    for (int i = 0; i < 4; i++) ...{
                      ResponsiveGridCol(
                          lg: 3,
                          md: 6,
                          xs: 12,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 30, left: 10, right: 10),
                            child: StaffCard(staffNames[i], staffImgs[i], swidth),
                          ))
                    }
                  ]),
                ),
              ]),
              Carousel(swidth),
              Footer(swidth),
            ]))));
  }
}

class CustomVideo extends StatelessWidget {
  final YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: 'oH3omNV9UUU',
      params: const YoutubePlayerParams(
        autoPlay: true,
        mute: false,
      ));

  CustomVideo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: YoutubePlayerIFrame(
      controller: _controller,
      aspectRatio: 16 / 9,
    )));
  }
}

Widget Mediabox(BuildContext context) {
  return Container(
      height: 381,
      width: 280,
      decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 231, 228, 228))),
      child: Column(children: [
        SizedBox(
            height: 280,
            width: 280,
            child: Image.asset('assets/images/img3.jpg', fit: BoxFit.cover)),
        Container(
            height: 99,
            color: const Color.fromARGB(255, 231, 228, 228),
            child: Column(children: [
              Container(height: 28),
              const Text('Dean Michael',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                    child: Row(children: [
                  SizedBox(
                      height: 35,
                      width: 30,
                      child: TextButton(
                          onPressed: () {},
                          child: const Icon(FontAwesomeIcons.facebook,
                              size: 16.0, color: Colors.black))),
                  SizedBox(
                      height: 35,
                      width: 30,
                      child: TextButton(
                          onPressed: () {},
                          child: const Icon(FontAwesomeIcons.googlePlus,
                              size: 16.0, color: Colors.black))),
                  SizedBox(
                      height: 35,
                      width: 30,
                      child: TextButton(
                          onPressed: () {},
                          child: const Icon(FontAwesomeIcons.twitter,
                              size: 16.0, color: Colors.black))),
                  SizedBox(
                      height: 35,
                      width: 30,
                      child: TextButton(
                          onPressed: () {},
                          child: const Icon(FontAwesomeIcons.linkedin,
                              size: 16.0, color: Colors.black))),
                  SizedBox(
                      height: 35,
                      width: 30,
                      child: TextButton(
                          onPressed: () {},
                          child: const Icon(FontAwesomeIcons.instagram,
                              size: 16.0, color: Colors.black)))
                ]))
              ])
            ]))
      ]));
}

Widget Mediabox1(BuildContext context) {
  return Container(
      height: 381,
      width: 280,
      decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 231, 228, 228))),
      child: Column(children: [
        SizedBox(
            height: 280,
            width: 280,
            child: Image.asset('assets/images/img3.jpg', fit: BoxFit.cover)),
        Container(
            height: 99,
            color: const Color.fromARGB(255, 231, 228, 228),
            child: Column(children: [
              Container(height: 28),
              const Text('Dean Michael',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                    child: Row(children: [
                  SizedBox(
                      height: 35,
                      width: 30,
                      child: TextButton(
                          onPressed: () {},
                          child: const Icon(FontAwesomeIcons.facebook,
                              size: 16.0, color: Colors.black))),
                  SizedBox(
                      height: 35,
                      width: 30,
                      child: TextButton(
                          onPressed: () {},
                          child: const Icon(FontAwesomeIcons.googlePlus,
                              size: 16.0, color: Colors.black))),
                  SizedBox(
                      height: 35,
                      width: 30,
                      child: TextButton(
                          onPressed: () {},
                          child: const Icon(FontAwesomeIcons.twitter,
                              size: 16.0, color: Colors.black))),
                  SizedBox(
                      height: 35,
                      width: 30,
                      child: TextButton(
                          onPressed: () {},
                          child: const Icon(FontAwesomeIcons.linkedin,
                              size: 16.0, color: Colors.black))),
                  SizedBox(
                      height: 35,
                      width: 30,
                      child: TextButton(
                          onPressed: () {},
                          child: const Icon(FontAwesomeIcons.instagram,
                              size: 16.0, color: Colors.black)))
                ]))
              ])
            ]))
      ]));
}

Widget Mediabox2(BuildContext context) {
  return Container(
      height: 381,
      width: 280,
      decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 231, 228, 228))),
      child: Column(children: [
        SizedBox(
            height: 280,
            width: 280,
            child: Image.asset('assets/images/img3.jpg', fit: BoxFit.cover)),
        Container(
            height: 99,
            color: const Color.fromARGB(255, 231, 228, 228),
            child: Column(children: [
              Container(height: 28),
              const Text('Dean Michael',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                    child: Row(children: [
                  SizedBox(
                      height: 35,
                      width: 30,
                      child: TextButton(
                          onPressed: () {},
                          child: const Icon(FontAwesomeIcons.facebook,
                              size: 16.0, color: Colors.black))),
                  SizedBox(
                      height: 35,
                      width: 30,
                      child: TextButton(
                          onPressed: () {},
                          child: const Icon(FontAwesomeIcons.googlePlus,
                              size: 16.0, color: Colors.black))),
                  SizedBox(
                      height: 35,
                      width: 30,
                      child: TextButton(
                          onPressed: () {},
                          child: const Icon(FontAwesomeIcons.twitter,
                              size: 16.0, color: Colors.black))),
                  SizedBox(
                      height: 35,
                      width: 30,
                      child: TextButton(
                          onPressed: () {},
                          child: const Icon(FontAwesomeIcons.linkedin,
                              size: 16.0, color: Colors.black))),
                  SizedBox(
                      height: 35,
                      width: 30,
                      child: TextButton(
                          onPressed: () {},
                          child: const Icon(FontAwesomeIcons.instagram,
                              size: 16.0, color: Colors.black)))
                ]))
              ])
            ]))
      ]));
}

Widget Mediabox3(BuildContext context) {
  return Container(
      height: 381,
      width: 280,
      decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 231, 228, 228))),
      child: Column(children: [
        SizedBox(
            height: 280,
            width: 280,
            child: Image.asset('assets/images/img3.jpg', fit: BoxFit.cover)),
        Container(
            height: 99,
            color: const Color.fromARGB(255, 231, 228, 228),
            child: Column(children: [
              Container(height: 28),
              const Text('Dean Michael',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                    child: Row(children: [
                  SizedBox(
                      height: 35,
                      width: 30,
                      child: TextButton(
                          onPressed: () {},
                          child: const Icon(FontAwesomeIcons.facebook,
                              size: 16.0, color: Colors.black))),
                  SizedBox(
                      height: 35,
                      width: 30,
                      child: TextButton(
                          onPressed: () {},
                          child: const Icon(FontAwesomeIcons.googlePlus,
                              size: 16.0, color: Colors.black))),
                  SizedBox(
                      height: 35,
                      width: 30,
                      child: TextButton(
                          onPressed: () {},
                          child: const Icon(FontAwesomeIcons.twitter,
                              size: 16.0, color: Colors.black))),
                  SizedBox(
                      height: 35,
                      width: 30,
                      child: TextButton(
                          onPressed: () {},
                          child: const Icon(FontAwesomeIcons.linkedin,
                              size: 16.0, color: Colors.black))),
                  SizedBox(
                      height: 35,
                      width: 30,
                      child: TextButton(
                          onPressed: () {},
                          child: const Icon(FontAwesomeIcons.instagram,
                              size: 16.0, color: Colors.black)))
                ]))
              ])
            ]))
      ]));
}
