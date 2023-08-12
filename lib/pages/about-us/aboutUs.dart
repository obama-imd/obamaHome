import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../components/drawer.dart';
import '../../components/dropdowns.dart';
import '../../components/footer.dart';
import '../../components/menu.dart';
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
                    width: MediaQuery.of(context).size.width,
                    height: 125,
                    margin: EdgeInsets.only(left: swidth * 0.068),
                    child: Row(children: [
                      Container(
                          width: 250,
                          child: Image.asset('assets/images/logo.png',
                              fit: BoxFit.fitHeight)),
                      Container(width: swidth * 0.177),
                      Container(
                        width: swidth * 0.513,
                        child: Row(children: [
                          // Container(
                          //     padding: EdgeInsets.all(9.2),
                          //     child: MenuBar0(context)),
                          Container(
                              padding: EdgeInsets.all(9.2),
                              child: MenuBar1(context)),
                          Container(
                              padding: EdgeInsets.all(9.2),
                              child: MenuBar2(context)),
                          Container(
                              padding: EdgeInsets.all(9.2),
                              child: MenuBar3(context)),
                          Container(
                              padding: EdgeInsets.all(9.2),
                              child: MenuBar4(context)),
                          Container(
                              padding: EdgeInsets.all(9.2),
                              child: MenuBar5(context)),
                          Container(
                              padding: EdgeInsets.all(9.2),
                              child: MenuBar6(context)),
                          Container(
                              padding: EdgeInsets.all(9.5),
                              child: MenuBar7(context))
                        ]),
                      )
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
                height: 300,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(top: 120.0, bottom: 60.0),
                child: Column(children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                          padding: EdgeInsets.only(bottom: 12.0),
                          child: Text('Plataforma OBAMA',
                              textScaleFactor: 3.0,
                              style: GoogleFonts.raleway(
                                  textStyle:
                                      TextStyle(fontWeight: FontWeight.bold)))),
                      Text('Objetos de Aprendizagem para Matemática',
                          textScaleFactor: 1.7,
                          style: GoogleFonts.raleway(
                              textStyle: TextStyle(color: Colors.grey))),
                      Container(
                          height: 27.0,
                          width: 82.0,
                          padding: EdgeInsets.only(top: 22.0),
                          child: Image.asset('assets/images/img2.jpg',
                              fit: BoxFit.cover)),
                    ],
                  ),
                ]),
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
                        Container(
                            child: Text('ABOUT SERVICE',
                                style: TextStyle(
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold))),
                        Container(
                            padding: EdgeInsets.only(top: 15),
                            child: Text(
                                'Easy and effective way to get your device repaired.',
                                style: TextStyle(
                                    fontSize: 22, color: Colors.grey))),
                        Container(height: 20),
                        Row(children: [
                          SizedBox(
                              height: 5.0,
                              width: 82.0,
                              child: Image.asset('assets/images/img2.jpg',
                                  fit: BoxFit.cover)),
                        ]),
                        Container(
                            height: 300,
                            padding: EdgeInsets.only(top: 60),
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
                Container(height: 140),
                Container(
                    padding: EdgeInsets.only(left: 90),
                    child: Text('EXPERIENCED STAFF',
                        style: TextStyle(
                            fontSize: 36, fontWeight: FontWeight.bold))),
                Container(
                    padding: EdgeInsets.only(top: 15, left: 90),
                    child: Text(
                      'Our experts have been featured in press numerous times.',
                      style: TextStyle(fontSize: 22, color: Colors.grey),
                    )),
                Container(height: 20),
                Row(children: [
                  Container(width: 91),
                  SizedBox(
                      height: 5.0,
                      width: 82.0,
                      child: Image.asset('assets/images/img2.jpg',
                          fit: BoxFit.cover)),
                ]),
                Container(height: 40),
                if (MediaQuery.of(context).size.width > 1300) ...[
                  Container(
                      child: Row(children: [
                    Container(width: 90),
                    Mediabox(context),
                    Container(width: 20),
                    Mediabox1(context),
                    Container(width: 20),
                    Mediabox2(context),
                    Container(width: 20),
                    Mediabox3(context),
                  ]))
                ],
                /*Segunda condição*/
                if (MediaQuery.of(context).size.width < 1300) ...[
                  if (MediaQuery.of(context).size.width > 930) ...[
                    Column(children: [
                      Row(children: [
                        Container(width: 45),
                        Mediabox(context),
                        Container(width: 20),
                        Mediabox1(context),
                        Container(width: 20),
                        Mediabox2(context),
                      ]),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(left: 45),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Mediabox3(context),
                              ]))
                    ])
                  ]
                ],
                if (MediaQuery.of(context).size.width < 930) ...[
                  if (MediaQuery.of(context).size.width > 650) ...[
                    Column(children: [
                      Row(children: [
                        Container(width: 45),
                        Mediabox(context),
                        Container(width: 20),
                        Mediabox1(context),
                      ]),
                      Row(children: [
                        Container(width: 45),
                        Mediabox2(context),
                        Container(width: 20),
                        Mediabox3(context),
                      ])
                    ])
                  ]
                ],
                if (MediaQuery.of(context).size.width < 650) ...[
                  Center(
                      child: Column(children: [
                    Mediabox(context),
                    Mediabox1(context),
                    Mediabox2(context),
                    Mediabox3(context),
                  ]))
                ]
              ]),
              if (swidth > 1300) ...[
                Container(
                    height: 875,
                    width: swidth,
                    child: Stack(children: <Widget>[
                      Column(children: [
                        Container(height: 100, width: swidth),
                        Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.only(top: 50),
                            height: 700,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/test.png'),
                                  fit: BoxFit.cover),
                            ))
                      ]),
                      Container(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Container(height: 140),
                            Container(
                                padding: EdgeInsets.only(left: 90, top: 100),
                                child: Text('What Clients Say?',
                                    style: TextStyle(
                                        fontSize: 36,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white))),
                            Container(
                                padding: EdgeInsets.only(top: 15, left: 90),
                                child: Text(
                                  'Here are testimonials from clients..',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                )),
                            Container(height: 20),
                            Row(children: [
                              Container(width: 91),
                              SizedBox(
                                  height: 5.0,
                                  width: 82.0,
                                  child: Image.asset('assets/images/img2.jpg',
                                      fit: BoxFit.cover)),
                            ]),
                            Container(height: 40, width: swidth),
                            ImageSlideshow(
                              width: 760,

                              /// Width of the [ImageSlideshow].
                              height: 240,

                              /// Height of the [ImageSlideshow].
                              initialPage: 0,

                              /// The page to show when first creating the [ImageSlideshow].
                              indicatorColor: Colors.blue,

                              /// The color to paint the indicator.
                              indicatorBackgroundColor: Colors.grey,

                              /// The color to paint behind th indicator.
                              children: [
                                Row(children: [
                                  Container(width: 90),
                                  Container(
                                      height: 150,
                                      width: 150,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/client.jpg'),
                                              fit: BoxFit.cover))),
                                  Container(width: 20),
                                  Container(
                                      padding: EdgeInsets.only(left: 10),
                                      height: 150,
                                      width: 500,
                                      child: ListView(children: [
                                        Text('Texto',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18)),
                                        Container(height: 65),
                                        Text('Maria Anderson',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold)),
                                        Container(height: 20),
                                        Text('CFO, Tech NY',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18))
                                      ])),
                                ]),
                                Row(children: [
                                  Container(width: 90),
                                  Container(
                                      height: 150,
                                      width: 150,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/client.jpg'),
                                              fit: BoxFit.cover))),
                                  Container(width: 20),
                                  Container(
                                      padding: EdgeInsets.only(left: 10),
                                      height: 150,
                                      width: 500,
                                      child: ListView(children: [
                                        Text('Texto',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18)),
                                        Container(height: 65),
                                        Text('Maria Anderson',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold)),
                                        Container(height: 20),
                                        Text('CFO, Tech NY',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18))
                                      ])),
                                ]),
                                Row(children: [
                                  Container(width: 90),
                                  Container(
                                      height: 150,
                                      width: 150,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/client.jpg'),
                                              fit: BoxFit.cover))),
                                  Container(width: 20),
                                  Container(
                                      padding: EdgeInsets.only(left: 10),
                                      height: 150,
                                      width: 500,
                                      child: ListView(children: [
                                        Text('Texto',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18)),
                                        Container(height: 65),
                                        Text('Maria Anderson',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold)),
                                        Container(height: 20),
                                        Text('CFO, Tech NY',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18))
                                      ]))
                                ])
                              ],

                              /// Called whenever the page in the center of the viewport changes.
                              onPageChanged: (value) {
                                print('Page changed: $value');
                              },

                              /// Auto scroll interval.
                              /// Do not auto scroll with null or 0.
                              autoPlayInterval: 3500,

                              /// Loops back to first slide.
                              isLoop: true,
                            ),
                            Container(width: swidth * 0.8, height: 80),
                            Center(
                                child: Container(
                                    color: Colors.blue,
                                    height: 150,
                                    width: swidth * 0.85,
                                    child: Row(children: [
                                      Container(width: 30),
                                      Container(
                                          width: 100,
                                          height: 100,
                                          child: Icon(
                                            Icons.phone,
                                            size: 70,
                                            color: Colors.white,
                                          )),
                                      Container(
                                          width: 500,
                                          height: 100,
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text('REQUEST A FREE QUOTE',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 34,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                Text(
                                                    'Get answers and advice from people you want ir from.',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18))
                                              ])),
                                      Container(width: swidth * 0.248),
                                      Container(
                                          height: 50,
                                          width: 150,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              color: Colors.black),
                                          child: TextButton(
                                              onPressed: () {},
                                              child: Text('CONTACT US',
                                                  style: TextStyle(
                                                      shadows: [
                                                        Shadow(
                                                            offset: Offset(
                                                                1.1, 1.1))
                                                      ],
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.white)))),
                                    ]))),
                          ])),
                    ])),
                Container(width: swidth * 0.9, height: 40),
                Container(
                    width: swidth * 0.85,
                    child: Center(
                        child: Row(children: [
                      Container(width: 6, height: 100),
                      Container(
                          height: 100,
                          width: swidth * 0.161,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 6,
                                  color: Color.fromARGB(255, 231, 228, 228))),
                          child: Image(
                              image: AssetImage('assets/images/img1.jpg'),
                              fit: BoxFit.cover)),
                      Container(width: 12, height: 100),
                      Container(
                          height: 100,
                          width: swidth * 0.161,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 6,
                                  color: Color.fromARGB(255, 231, 228, 228))),
                          child: Image(
                              image: AssetImage('assets/images/img1.jpg'),
                              fit: BoxFit.cover)),
                      Container(width: 12, height: 100),
                      Container(
                          height: 100,
                          width: swidth * 0.161,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 6,
                                  color: Color.fromARGB(255, 231, 228, 228))),
                          child: Image(
                              image: AssetImage('assets/images/img1.jpg'),
                              fit: BoxFit.cover)),
                      Container(width: 12, height: 100),
                      Container(
                          height: 100,
                          width: swidth * 0.161,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 6,
                                  color: Color.fromARGB(255, 231, 228, 228))),
                          child: Image(
                              image: AssetImage('assets/images/img1.jpg'),
                              fit: BoxFit.cover)),
                      Container(width: 12, height: 100),
                      Container(
                          height: 100,
                          width: swidth * 0.161,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 6,
                                  color: Color.fromARGB(255, 231, 228, 228))),
                          child: Image(
                              image: AssetImage('assets/images/img1.jpg'),
                              fit: BoxFit.cover)),
                    ])))
              ] else ...[
                Container(height: 100, width: swidth),
                Container(
                    height: 550,
                    width: swidth,
                    child: Stack(children: <Widget>[
                      Column(children: [
                        Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.only(top: 50),
                            height: 550,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/test.png'),
                                  fit: BoxFit.cover),
                            ))
                      ]),
                      ListView(children: [
                        Container(height: 40),
                        Container(
                            padding: EdgeInsets.only(left: 40, top: 50),
                            child: Text('What Clients Say?',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white))),
                        Container(
                            padding: EdgeInsets.only(top: 15, left: 40),
                            child: Text(
                              'Here are testimonials from clients..',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            )),
                        Container(height: 20),
                        Row(children: [
                          Container(width: 40),
                          SizedBox(
                              height: 5.0,
                              width: 82.0,
                              child: Image.asset('assets/images/img2.jpg',
                                  fit: BoxFit.cover)),
                        ]),
                        Container(height: 40, width: swidth),
                        ImageSlideshow(
                          width: swidth - 140,

                          /// Width of the [ImageSlideshow].
                          height: 240,

                          /// Height of the [ImageSlideshow].
                          initialPage: 0,

                          /// The page to show when first creating the [ImageSlideshow].
                          indicatorColor: Colors.blue,

                          /// The color to paint the indicator.
                          indicatorBackgroundColor: Colors.grey,

                          /// The color to paint behind th indicator.
                          children: [
                            Row(children: [
                              Container(width: 20),
                              Container(
                                  height: 120,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/client.jpg'),
                                          fit: BoxFit.cover))),
                              Container(
                                  padding: EdgeInsets.only(left: 30),
                                  height: 150,
                                  width: swidth - 140,
                                  child: ListView(children: [
                                    Text('Texto',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16)),
                                    Container(height: 65),
                                    Text('Maria Anderson',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                    Container(height: 20),
                                    Text('CFO, Tech NY',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16))
                                  ])),
                            ]),
                            Row(children: [
                              Container(width: 20),
                              Container(
                                  height: 120,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/client.jpg'),
                                          fit: BoxFit.cover))),
                              Container(
                                  padding: EdgeInsets.only(left: 30),
                                  height: 150,
                                  width: swidth - 140,
                                  child: ListView(children: [
                                    Text('Texto',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16)),
                                    Container(height: 65),
                                    Text('Maria Anderson',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                    Container(height: 20),
                                    Text('CFO, Tech NY',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16))
                                  ])),
                            ]),
                            Row(children: [
                              Container(width: 20),
                              Container(
                                  height: 120,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/client.jpg'),
                                          fit: BoxFit.cover))),
                              Container(
                                  padding: EdgeInsets.only(left: 30),
                                  height: 150,
                                  width: swidth - 140,
                                  child: ListView(children: [
                                    Text('Texto',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16)),
                                    Container(height: 65),
                                    Text('Maria Anderson',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                    Container(height: 20),
                                    Text('CFO, Tech NY',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16))
                                  ]))
                            ])
                          ],

                          /// Called whenever the page in the center of the viewport changes.
                          onPageChanged: (value) {
                            print('Page changed: $value');
                          },
                          autoPlayInterval: 3500,

                          /// Loops back to first slide.
                          isLoop: true,
                        )
                      ])
                    ])),
                Container(width: swidth * 0.8, height: 20),
                Center(
                    child: Container(
                        color: Colors.blue,
                        height: 180,
                        width: swidth * 0.95,
                        child: Column(children: [
                          Container(width: 30),
                          Row(children: [
                            Container(width: 15),
                            Container(
                                width: 50,
                                height: 100,
                                child: Icon(
                                  Icons.phone,
                                  size: 40,
                                  color: Colors.white,
                                )),
                            Container(
                                width: swidth * 0.7,
                                height: 100,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('REQUEST A FREE QUOTE',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold)),
                                      Text(
                                          'Get answers and advice from people you want ir from.',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12))
                                    ]))
                          ]),
                          Container(width: swidth * 0.25),
                          Container(
                              height: 50,
                              width: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.black),
                              child: TextButton(
                                  onPressed: () {},
                                  child: Text('CONTACT US',
                                      style: TextStyle(
                                          shadows: [
                                            Shadow(offset: Offset(1.1, 1.1))
                                          ],
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white)))),
                        ]))),
                Container(width: swidth * 0.9, height: 40),
                Container(
                    width: swidth * 0.9,
                    child: Center(
                        child: Column(children: [
                      Container(
                          height: 100,
                          width: swidth * 0.9,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 6,
                                  color: Color.fromARGB(255, 231, 228, 228))),
                          child: Image(
                              image: AssetImage('assets/images/img1.jpg'),
                              fit: BoxFit.cover)),
                      Container(width: 12, height: 12),
                      Container(
                          height: 100,
                          width: swidth * 0.9,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 6,
                                  color: Color.fromARGB(255, 231, 228, 228))),
                          child: Image(
                              image: AssetImage('assets/images/img1.jpg'),
                              fit: BoxFit.cover)),
                      Container(width: 12, height: 12),
                      Container(
                          height: 100,
                          width: swidth * 0.9,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 6,
                                  color: Color.fromARGB(255, 231, 228, 228))),
                          child: Image(
                              image: AssetImage('assets/images/img1.jpg'),
                              fit: BoxFit.cover)),
                      Container(width: 12, height: 12),
                      Container(
                          height: 100,
                          width: swidth * 0.9,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 6,
                                  color: Color.fromARGB(255, 231, 228, 228))),
                          child: Image(
                              image: AssetImage('assets/images/img1.jpg'),
                              fit: BoxFit.cover)),
                      Container(width: 12, height: 12),
                      Container(
                          height: 100,
                          width: swidth * 0.9,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 6,
                                  color: Color.fromARGB(255, 231, 228, 228))),
                          child: Image(
                              image: AssetImage('assets/images/img1.jpg'),
                              fit: BoxFit.cover)),
                    ])))
              ],
              Container(height: 60),
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
