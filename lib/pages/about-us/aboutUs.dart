import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
    return Scaffold(body: MyStatefulWidget());
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);
  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  // List<String> staffNames = [
  //   "Dean Michael",
  //   "Dean Michael",
  //   "Dean Michael",
  //   "Dean Michael",
  //   "Dean Michael",
  //   "Dean Michael",
  //   "Dean Michael",
  //   "Dean Michael",
  // ];

  // List<String> staffImgs = [
  //   "assets/images/img3.jpg",
  //   "assets/images/img3.jpg",
  //   "assets/images/img3.jpg",
  //   "assets/images/img3.jpg",
  //   "assets/images/img3.jpg",
  //   "assets/images/img3.jpg",
  //   "assets/images/img3.jpg",
  //   "assets/images/img3.jpg",
  // ];

  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    return Scaffold(
        key: scaffoldKey,
        drawer: drawermenu(),
        body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
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
                          Container(
                              width: 250,
                              child: Image.asset('assets/images/logo.png',
                                  fit: BoxFit.fitHeight)),
                          navBarMenu(context, swidth),
                        ])),
              ] else ...[
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 125,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              child: Icon(Icons.menu, color: Colors.black),
                              onPressed: () =>
                                  scaffoldKey.currentState?.openDrawer()),
                          Container(
                              width: 280,
                              padding: EdgeInsets.only(right: 30, left: 30),
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
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/img.jpg'),
                          fit: BoxFit.cover),
                    )),
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    padding: EdgeInsets.only(top: 85.0, left: 92.0),
                    child: ListView(children: [
                      Text(
                        'Sobre Nós',
                        textScaleFactor: 3.1,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Container(
                          child: Row(children: [
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              'Home',
                              textScaleFactor: 1.11,
                              style: TextStyle(color: Colors.blue),
                            )),
                        Text(
                          '>  ',
                          textScaleFactor: 1.11,
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
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
              if (MediaQuery.of(context).size.width > 1200) ...[
                Container(
                    height: 343,
                    width: MediaQuery.of(context).size.width * 0.9,
                    color: Color.fromARGB(255, 224, 220, 220),
                    child: Row(children: [
                      Container(
                          height: 343,
                          width: MediaQuery.of(context).size.width * 0.45,
                          padding: EdgeInsets.only(left: 40.0, top: 30.0),
                          child: ListView(children: [
                            Text('What we do',
                                textScaleFactor: 2.0,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Container(height: 15),
                            Text('Texto',
                                textScaleFactor: 1.1,
                                style: TextStyle(color: Colors.grey))
                          ])),
                      Container(
                          height: 343,
                          width: MediaQuery.of(context).size.width * 0.45,
                          child: CustomVideo())
                    ])),
              ] else ...[
                Container(
                    height: 640,
                    width: MediaQuery.of(context).size.width - 20,
                    color: Color.fromARGB(255, 224, 220, 220),
                    child: Column(children: [
                      Container(
                          height: 340,
                          width: MediaQuery.of(context).size.width - 20,
                          padding: EdgeInsets.only(top: 30.0, left: 30),
                          child: ListView(children: [
                            Text('What we do',
                                textScaleFactor: 2.0,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Container(height: 15),
                            Text('Texto',
                                textScaleFactor: 1.1,
                                style: TextStyle(color: Colors.grey))
                          ])),
                      Container(
                          width: MediaQuery.of(context).size.width - 20,
                          child: Container(height: 300, child: CustomVideo()))
                    ])),
              ],
              if (MediaQuery.of(context).size.width > 1200) ...[
                Container(
                    height: 440,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(
                        top: 60,
                        left: MediaQuery.of(context).size.width * 0.07),
                    child: Row(children: [
                      Dropdowns(),
                      Container(
                          padding: EdgeInsets.only(left: 30, top: 17.5),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    height: 50,
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    child: Text('Need file recovery?',
                                        style: TextStyle(
                                            fontSize: 28,
                                            fontWeight: FontWeight.w500))),
                                Container(
                                    height: 120,
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: Text('Texto',
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
                                          child: Text('READ MORE',
                                              style: TextStyle(
                                                  shadows: [
                                                    Shadow(
                                                        offset:
                                                            Offset(1.1, 1.1))
                                                  ],
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white)))),
                                  Container(
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
                    padding: EdgeInsets.only(top: 60),
                    child: Column(children: [
                      Dropdowns(),
                      Container(
                          padding: EdgeInsets.only(left: 40, top: 50),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    height: 50,
                                    width: MediaQuery.of(context).size.width,
                                    child: Text('Need file recovery?',
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w500))),
                                Container(
                                    height: 120,
                                    width: MediaQuery.of(context).size.width,
                                    child: Text('Texto',
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
                                          child: Text('READ MORE',
                                              style: TextStyle(
                                                  shadows: [
                                                    Shadow(
                                                        offset:
                                                            Offset(1.1, 1.1))
                                                  ],
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white)))),
                                  Container(
                                      height: 30,
                                      width: MediaQuery.of(context).size.width *
                                          0.15)
                                ])),
                              ]))
                    ]))
              ],
              if (swidth > 1200) ...[
                Row(children: [
                  Container(
                      color: Color.fromARGB(255, 241, 238, 238),
                      height: 900,
                      width: MediaQuery.of(context).size.width * 0.67,
                      padding: EdgeInsets.only(top: 110, left: 90),
                      child: ListView(children: [
                        SectionTitle(
                            'ABOUT SERVICE',
                            'Easy and effective way to get your device repaired.',
                            CrossAxisAlignment.start),
                        Container(
                            height: 300,
                            padding: EdgeInsets.only(top: 65),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                color: Colors.blue,
                                                borderRadius:
                                                    BorderRadius.circular(100)),
                                            child: Icon(FontAwesomeIcons.wrench,
                                                size: 38.0,
                                                color: Colors.white)),
                                        Container(
                                            padding: EdgeInsets.only(top: 20),
                                            child: Text('Honest Services',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20))),
                                        Container(
                                            padding: EdgeInsets.only(top: 20),
                                            child: Text('Texto',
                                                style: TextStyle(
                                                    color: Colors.grey)))
                                      ]),
                                  Container(height: 250, width: 270),
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                color: Colors.blue,
                                                borderRadius:
                                                    BorderRadius.circular(100)),
                                            child: Icon(Icons.settings,
                                                size: 44.0,
                                                color: Colors.white)),
                                        Container(
                                            padding: EdgeInsets.only(top: 20),
                                            child: Text('Secure Payments',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20))),
                                        Container(
                                            padding: EdgeInsets.only(top: 20),
                                            child: Text('Texto',
                                                style: TextStyle(
                                                    color: Colors.grey)))
                                      ]),
                                ])),
                        Container(
                            height: 250,
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                color: Colors.blue,
                                                borderRadius:
                                                    BorderRadius.circular(100)),
                                            child: Icon(
                                                Icons
                                                    .settings_backup_restore_rounded,
                                                size: 46.0,
                                                color: Colors.white)),
                                        Container(
                                            padding: EdgeInsets.only(top: 20),
                                            child: Text('Expert Team',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20))),
                                        Container(
                                            padding: EdgeInsets.only(top: 20),
                                            child: Text('Texto',
                                                style: TextStyle(
                                                    color: Colors.grey)))
                                      ]),
                                  Container(height: 250, width: 300),
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                color: Colors.blue,
                                                borderRadius:
                                                    BorderRadius.circular(100)),
                                            child: Icon(FontAwesomeIcons.heart,
                                                size: 39.0,
                                                color: Colors.white)),
                                        Container(
                                            padding: EdgeInsets.only(top: 20),
                                            child: Text('Affordable Services',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20))),
                                        Container(
                                            padding: EdgeInsets.only(top: 20),
                                            child: Text('Texto',
                                                style: TextStyle(
                                                    color: Colors.grey)))
                                      ])
                                ]))
                      ])),
                  Container(
                      height: 900,
                      width: MediaQuery.of(context).size.width * 0.33,
                      child: Image.asset('assets/images/img2.jpg',
                          fit: BoxFit.cover))
                ])
              ] else ...[
                Container(
                    color: Color.fromARGB(255, 241, 238, 238),
                    height: 1300,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(top: 100, left: 50),
                    child: ListView(children: [
                      Container(
                          child: Text('ABOUT SERVICE',
                              style: TextStyle(
                                  fontSize: 36, fontWeight: FontWeight.bold))),
                      Container(
                          padding: EdgeInsets.only(top: 15),
                          child: Text(
                              'Easy and effective way to get your device repaired.',
                              style:
                                  TextStyle(fontSize: 22, color: Colors.grey))),
                      Container(height: 20),
                      Row(children: [
                        SizedBox(
                            height: 5.0,
                            width: 82.0,
                            child: Image.asset('assets/images/img2.jpg',
                                fit: BoxFit.cover)),
                      ]),
                      Container(
                          height: 1200,
                          width: 500,
                          padding: EdgeInsets.only(top: 50),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: Icon(FontAwesomeIcons.wrench,
                                        size: 38.0, color: Colors.white)),
                                Container(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Text('Honest Services',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20))),
                                Container(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Text('Texto',
                                        style: TextStyle(color: Colors.grey))),
                                Container(height: 60, width: 100),
                                Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: Icon(Icons.settings,
                                        size: 44.0, color: Colors.white)),
                                Container(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Text('Secure Payments',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20))),
                                Container(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Text('Texto',
                                        style: TextStyle(color: Colors.grey))),
                                Container(height: 60, width: 100),
                                Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: Icon(
                                        Icons.settings_backup_restore_rounded,
                                        size: 46.0,
                                        color: Colors.white)),
                                Container(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Text('Expert Team',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20))),
                                Container(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Text('Texto',
                                        style: TextStyle(color: Colors.grey))),
                                Container(height: 60, width: 100),
                                Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: Icon(FontAwesomeIcons.heart,
                                        size: 39.0, color: Colors.white)),
                                Container(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Text('Affordable Services',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20))),
                                Container(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Text('Texto',
                                        style: TextStyle(color: Colors.grey))),
                                Container(height: 60, width: 100),
                              ]))
                    ]))
              ],
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
                if (MediaQuery.of(context).size.width > 1300) ...[
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: swidth * 0.07),
                      child: Row(children: [
                        StaffCard("Dean Michael", "assets/images/img3.jpg", swidth),
                        Container(width: swidth*0.02),
                        StaffCard("Dean Michael", "assets/images/img3.jpg", swidth),
                        Container(width: swidth*0.02),
                        StaffCard("Dean Michael", "assets/images/img3.jpg", swidth),
                        Container(width: swidth*0.02),
                        StaffCard("Dean Michael", "assets/images/img3.jpg", swidth),
                      ]))
                ],
                /*Segunda condição*/
                if (MediaQuery.of(context).size.width < 1300) ...[
                  if (MediaQuery.of(context).size.width > 995) ...[
                    Column(children: [
                      Row(children: [
                        Container(width: swidth*0.045),
                        StaffCard("Dean Michael", "assets/images/img3.jpg", swidth),
                        Container(width: swidth*0.02),
                        StaffCard("Dean Michael", "assets/images/img3.jpg", swidth),
                        Container(width: swidth*0.02),
                        StaffCard("Dean Michael", "assets/images/img3.jpg", swidth),
                      ]),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(left: swidth*0.045),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                StaffCard(
                                    "Dean Michael", "assets/images/img3.jpg", swidth),
                              ]))
                    ])
                  ]
                ],
                if (MediaQuery.of(context).size.width < 995) ...[
                  if (MediaQuery.of(context).size.width > 670) ...[
                    Column(children: [
                      Row(children: [
                        Container(width: swidth*0.045),
                        StaffCard("Dean Michael", "assets/images/img3.jpg", swidth),
                        Container(width: swidth*0.02),
                        StaffCard("Dean Michael", "assets/images/img3.jpg", swidth),
                      ]),
                      Row(children: [
                        Container(width: swidth*0.045),
                        StaffCard("Dean Michael", "assets/images/img3.jpg",swidth),
                        Container(width: swidth*0.045),
                        StaffCard("Dean Michael", "assets/images/img3.jpg", swidth),
                      ])
                    ])
                  ]
                ],
                if (MediaQuery.of(context).size.width < 670) ...[
                  Center(
                      child: Column(children: [
                    StaffCard("Dean Michael", "assets/images/img3.jpg", swidth),
                    StaffCard("Dean Michael", "assets/images/img3.jpg", swidth),
                    StaffCard("Dean Michael", "assets/images/img3.jpg", swidth),
                    StaffCard("Dean Michael", "assets/images/img3.jpg", swidth),
                  ]))
                ]
              ]),
              Carousel(swidth),
              Footer(swidth),
            ]))));
  }
}

class CustomVideo extends StatelessWidget {
  YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: 'oH3omNV9UUU',
      params: YoutubePlayerParams(
        autoPlay: true,
        mute: false,
      ));

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
          border: Border.all(color: Color.fromARGB(255, 231, 228, 228))),
      child: Column(children: [
        SizedBox(
            height: 280,
            width: 280,
            child: Image.asset('assets/images/img3.jpg', fit: BoxFit.cover)),
        Container(
            height: 99,
            color: Color.fromARGB(255, 231, 228, 228),
            child: Column(children: [
              Container(height: 28),
              Text('Dean Michael',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                    child: Row(children: [
                  SizedBox(
                      height: 35,
                      width: 30,
                      child: TextButton(
                          onPressed: () {},
                          child: Icon(FontAwesomeIcons.facebook,
                              size: 16.0, color: Colors.black))),
                  SizedBox(
                      height: 35,
                      width: 30,
                      child: TextButton(
                          onPressed: () {},
                          child: Icon(FontAwesomeIcons.googlePlus,
                              size: 16.0, color: Colors.black))),
                  SizedBox(
                      height: 35,
                      width: 30,
                      child: TextButton(
                          onPressed: () {},
                          child: Icon(FontAwesomeIcons.twitter,
                              size: 16.0, color: Colors.black))),
                  SizedBox(
                      height: 35,
                      width: 30,
                      child: TextButton(
                          onPressed: () {},
                          child: Icon(FontAwesomeIcons.linkedin,
                              size: 16.0, color: Colors.black))),
                  SizedBox(
                      height: 35,
                      width: 30,
                      child: TextButton(
                          onPressed: () {},
                          child: Icon(FontAwesomeIcons.instagram,
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
          border: Border.all(color: Color.fromARGB(255, 231, 228, 228))),
      child: Column(children: [
        SizedBox(
            height: 280,
            width: 280,
            child: Image.asset('assets/images/img3.jpg', fit: BoxFit.cover)),
        Container(
            height: 99,
            color: Color.fromARGB(255, 231, 228, 228),
            child: Column(children: [
              Container(height: 28),
              Text('Dean Michael',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                    child: Row(children: [
                  SizedBox(
                      height: 35,
                      width: 30,
                      child: TextButton(
                          onPressed: () {},
                          child: Icon(FontAwesomeIcons.facebook,
                              size: 16.0, color: Colors.black))),
                  SizedBox(
                      height: 35,
                      width: 30,
                      child: TextButton(
                          onPressed: () {},
                          child: Icon(FontAwesomeIcons.googlePlus,
                              size: 16.0, color: Colors.black))),
                  SizedBox(
                      height: 35,
                      width: 30,
                      child: TextButton(
                          onPressed: () {},
                          child: Icon(FontAwesomeIcons.twitter,
                              size: 16.0, color: Colors.black))),
                  SizedBox(
                      height: 35,
                      width: 30,
                      child: TextButton(
                          onPressed: () {},
                          child: Icon(FontAwesomeIcons.linkedin,
                              size: 16.0, color: Colors.black))),
                  SizedBox(
                      height: 35,
                      width: 30,
                      child: TextButton(
                          onPressed: () {},
                          child: Icon(FontAwesomeIcons.instagram,
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
          border: Border.all(color: Color.fromARGB(255, 231, 228, 228))),
      child: Column(children: [
        SizedBox(
            height: 280,
            width: 280,
            child: Image.asset('assets/images/img3.jpg', fit: BoxFit.cover)),
        Container(
            height: 99,
            color: Color.fromARGB(255, 231, 228, 228),
            child: Column(children: [
              Container(height: 28),
              Text('Dean Michael',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                    child: Row(children: [
                  SizedBox(
                      height: 35,
                      width: 30,
                      child: TextButton(
                          onPressed: () {},
                          child: Icon(FontAwesomeIcons.facebook,
                              size: 16.0, color: Colors.black))),
                  SizedBox(
                      height: 35,
                      width: 30,
                      child: TextButton(
                          onPressed: () {},
                          child: Icon(FontAwesomeIcons.googlePlus,
                              size: 16.0, color: Colors.black))),
                  SizedBox(
                      height: 35,
                      width: 30,
                      child: TextButton(
                          onPressed: () {},
                          child: Icon(FontAwesomeIcons.twitter,
                              size: 16.0, color: Colors.black))),
                  SizedBox(
                      height: 35,
                      width: 30,
                      child: TextButton(
                          onPressed: () {},
                          child: Icon(FontAwesomeIcons.linkedin,
                              size: 16.0, color: Colors.black))),
                  SizedBox(
                      height: 35,
                      width: 30,
                      child: TextButton(
                          onPressed: () {},
                          child: Icon(FontAwesomeIcons.instagram,
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
          border: Border.all(color: Color.fromARGB(255, 231, 228, 228))),
      child: Column(children: [
        SizedBox(
            height: 280,
            width: 280,
            child: Image.asset('assets/images/img3.jpg', fit: BoxFit.cover)),
        Container(
            height: 99,
            color: Color.fromARGB(255, 231, 228, 228),
            child: Column(children: [
              Container(height: 28),
              Text('Dean Michael',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                    child: Row(children: [
                  SizedBox(
                      height: 35,
                      width: 30,
                      child: TextButton(
                          onPressed: () {},
                          child: Icon(FontAwesomeIcons.facebook,
                              size: 16.0, color: Colors.black))),
                  SizedBox(
                      height: 35,
                      width: 30,
                      child: TextButton(
                          onPressed: () {},
                          child: Icon(FontAwesomeIcons.googlePlus,
                              size: 16.0, color: Colors.black))),
                  SizedBox(
                      height: 35,
                      width: 30,
                      child: TextButton(
                          onPressed: () {},
                          child: Icon(FontAwesomeIcons.twitter,
                              size: 16.0, color: Colors.black))),
                  SizedBox(
                      height: 35,
                      width: 30,
                      child: TextButton(
                          onPressed: () {},
                          child: Icon(FontAwesomeIcons.linkedin,
                              size: 16.0, color: Colors.black))),
                  SizedBox(
                      height: 35,
                      width: 30,
                      child: TextButton(
                          onPressed: () {},
                          child: Icon(FontAwesomeIcons.instagram,
                              size: 16.0, color: Colors.black)))
                ]))
              ])
            ]))
      ]));
}
