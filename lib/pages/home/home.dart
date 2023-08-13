import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'package:image_network/image_network.dart';
import 'package:intl/intl.dart';
import 'package:obamahome/components/drawer.dart';

import '../../components/carousel.dart';
import '../../components/dropdowns.dart';
import '../../components/firstSectionHome.dart';
import '../../components/footer.dart';
import '../../components/menu.dart';
import '../../components/sectionTitle.dart';
import '../../components/topbar.dart';

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

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('http://192.168.1.72:3000/dados'));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      setState(() {
        dataAvailable = false;
        datas = jsonData
            .map((item) => {
                  'title': item['title'],
                  'text': item['text'],
                  'summary': item['summary'],
                  'content': item['content'],
                  'published_date': item['published_date'],
                })
            .toList()
            .reversed
            .toList()
            .sublist(0, 3);
      });
    } else {
      setState(() {
        dataAvailable = true;
        // datas = [''];
        // print(datas);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Widget BlogData(BuildContext context) {
    double swid = MediaQuery.of(context).size.width;
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 500,
          childAspectRatio: 10 / 9,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0),
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
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
                  fitAndroidIos: BoxFit.contain,
                  fitWeb: BoxFitWeb.contain),
              // Text(imagePath),
              Row(
                children: [
                  Icon(Icons.access_time, size: 16),
                  Text(formattedDate, style: TextStyle(fontSize: 14)),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text(item['title'],
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              ),
              Text(item['text'], style: TextStyle(fontSize: 15), maxLines: 4),
              // Text(sumValue),
            ],
          ),
        );
      },
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

  _ajustarAltura(double larguraTela) {
    int altura = 0;
    if (larguraTela <= 600) {
      altura = 400;
    } else {
      altura = 275;
    }
    return altura;
  }

  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    return Scaffold(
        key: scaffoldKey,
        drawer: drawermenu(),
        body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
                child: Column(children: <Widget>[
              TopBar(swidth),
              if (MediaQuery.of(context).size.width > 1360) ...[
                Container(
                    width: swidth,
                    height: 125,
                    margin: EdgeInsets.only(left: swidth * 0.068, right: swidth * 0.06),
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
                  width: swidth,
                  height: 500,
                  color: Colors.grey,
                  child: const Text('Blank')),
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
                  height: _ajustarAltura(swidth),
                  margin: EdgeInsets.symmetric(horizontal: 74),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Expanded(
                    child: GridView.count(
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: _ajustarVisualizacao(
                          swidth), //chama metodo para captar quantidade de colunas de acordo com tamanho da tela
                      crossAxisSpacing: 8, // espaçamento entre itens
                      children: [
                        ItemProduto("Data Recovery", "nononon nono nonon non !",
                            "i1.png"),
                        ItemProduto("Computer repair",
                            "nono nononon nononon no !", "i2.png"),
                        ItemProduto("Mobile service", "nonon nonono nononon !",
                            "i3.png"),
                        ItemProduto("Data Recovery", "nonononon nonon onon !",
                            "i4.png"),
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
                      Dropdowns(),
                      Container(
                          padding: const EdgeInsets.only(left: 30, top: 17.5),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    height: 50,
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    child: const Text('Need file recovery?',
                                        style: TextStyle(
                                            fontSize: 28,
                                            fontWeight: FontWeight.w500))),
                                Container(
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
                    padding: const EdgeInsets.only(top: 60),
                    child: Column(children: [
                      Dropdowns(),
                      Container(
                          padding: const EdgeInsets.only(left: 40, top: 50),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    height: 50,
                                    width: MediaQuery.of(context).size.width,
                                    child: const Text('Need file recovery?',
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w500))),
                                Container(
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
                      color: const Color.fromARGB(255, 241, 238, 238),
                      height: 900,
                      width: MediaQuery.of(context).size.width * 0.67,
                      padding: const EdgeInsets.only(top: 110, left: 90),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SectionTitle(
                                'ABOUT SERVICE',
                                'Easy and effective way to get your device repaired.',
                                CrossAxisAlignment.start),
                            Container(
                                height: 300,
                                padding: const EdgeInsets.only(top: 60),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                        BorderRadius.circular(
                                                            100)),
                                                child: const Icon(
                                                    FontAwesomeIcons.wrench,
                                                    size: 38.0,
                                                    color: Colors.white)),
                                            Container(
                                                padding: const EdgeInsets.only(
                                                    top: 20),
                                                child: const Text(
                                                    'Honest Services',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20))),
                                            Container(
                                                padding: const EdgeInsets.only(
                                                    top: 20),
                                                child: const Text('Texto',
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
                                                        BorderRadius.circular(
                                                            100)),
                                                child: const Icon(
                                                    Icons.settings,
                                                    size: 44.0,
                                                    color: Colors.white)),
                                            Container(
                                                padding: const EdgeInsets.only(
                                                    top: 20),
                                                child: const Text(
                                                    'Secure Payments',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20))),
                                            Container(
                                                padding: const EdgeInsets.only(
                                                    top: 20),
                                                child: const Text('Texto',
                                                    style: TextStyle(
                                                        color: Colors.grey)))
                                          ]),
                                    ])),
                            Container(
                                height: 250,
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                        BorderRadius.circular(
                                                            100)),
                                                child: const Icon(
                                                    Icons
                                                        .settings_backup_restore_rounded,
                                                    size: 46.0,
                                                    color: Colors.white)),
                                            Container(
                                                padding: const EdgeInsets.only(
                                                    top: 20),
                                                child: const Text('Expert Team',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20))),
                                            Container(
                                                padding: const EdgeInsets.only(
                                                    top: 20),
                                                child: const Text('Texto',
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
                                                        BorderRadius.circular(
                                                            100)),
                                                child: const Icon(
                                                    FontAwesomeIcons.heart,
                                                    size: 39.0,
                                                    color: Colors.white)),
                                            Container(
                                                padding: const EdgeInsets.only(
                                                    top: 20),
                                                child: const Text(
                                                    'Affordable Services',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20))),
                                            Container(
                                                padding: const EdgeInsets.only(
                                                    top: 20),
                                                child: const Text('Texto',
                                                    style: TextStyle(
                                                        color: Colors.grey)))
                                          ])
                                    ]))
                          ])),
                  Container(
                      height: 900,
                      width: MediaQuery.of(context).size.width * 0.33,
                      child: Image.asset('assets/images/img2.jpg',
                          fit: BoxFit.cover)),
                ])
              ] else ...[
                Container(
                    color: const Color.fromARGB(255, 241, 238, 238),
                    height: 1310,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(top: 100, left: 40),
                    child: Column(children: [
                      SectionTitle(
                          'ABOUT SERVICE',
                          'Easy and effective way to get your device repaired.',
                          CrossAxisAlignment.start),
                      Container(
                          height: 1006,
                          width: 500,
                          padding: const EdgeInsets.only(top: 50),
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
                                    child: const Icon(FontAwesomeIcons.wrench,
                                        size: 38.0, color: Colors.white)),
                                Container(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: const Text('Honest Services',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20))),
                                Container(
                                    padding: const EdgeInsets.only(
                                        top: 20, bottom: 50),
                                    child: const Text('Texto',
                                        style: TextStyle(color: Colors.grey))),
                                Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: const Icon(Icons.settings,
                                        size: 44.0, color: Colors.white)),
                                Container(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: const Text('Secure Payments',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20))),
                                Container(
                                    padding: const EdgeInsets.only(
                                        top: 20, bottom: 50),
                                    child: const Text('Texto',
                                        style: TextStyle(color: Colors.grey))),
                                Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: const Icon(
                                        Icons.settings_backup_restore_rounded,
                                        size: 46.0,
                                        color: Colors.white)),
                                Container(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: const Text('Expert Team',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20))),
                                Container(
                                    padding: const EdgeInsets.only(
                                        top: 20, bottom: 50),
                                    child: const Text('Texto',
                                        style: TextStyle(color: Colors.grey))),
                                Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: const Icon(FontAwesomeIcons.heart,
                                        size: 39.0, color: Colors.white)),
                                Container(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: const Text('Affordable Services',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20))),
                                Container(
                                    padding: const EdgeInsets.only(
                                        top: 20, bottom: 50),
                                    child: const Text('Texto',
                                        style: TextStyle(color: Colors.grey))),
                              ]))
                    ]))
              ],
              Container(
                margin: EdgeInsets.only(top: 120, bottom: 65.0),
                child: SectionTitle(
                    'OUR PRODUCTS',
                    'We package the products with best services to make you a happy customer.',
                    CrossAxisAlignment.center),
              ),
              if (MediaQuery.of(context).size.width > 1000) ...[
                Padding(
                  padding: const EdgeInsets.only(bottom: 115),
                  child: Row(children: [
                    Spacer(flex: 3),
                    Container(
                        width: 237.5,
                        height: 327.5,
                        child: Column(children: [
                          Container(
                              color: Color(0xf3f3f3ff),
                              padding: EdgeInsets.all(22),
                              child: Image.asset('assets/images/prod.jpg',
                                  width: 207.5, height: 207.5)),
                          Text('Title',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                        ])),
                    Spacer(flex: 1),
                    Container(
                        width: 237.5,
                        height: 327.5,
                        child: Column(children: [
                          Container(
                              color: Color(0xf3f3f3ff),
                              padding: EdgeInsets.all(22),
                              child: Image.asset('assets/images/prod.jpg',
                                  width: 207.5, height: 207.5)),
                          Text('Title',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                        ])),
                    Spacer(flex: 1),
                    Container(
                        width: 237.5,
                        height: 327.5,
                        child: Column(children: [
                          Container(
                              color: Color(0xf3f3f3ff),
                              padding: EdgeInsets.all(22),
                              child: Image.asset('assets/images/prod.jpg',
                                  width: 207.5, height: 207.5)),
                          Text('Title',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                        ])),
                    Spacer(flex: 1),
                    Container(
                        width: 237.5,
                        height: 327.5,
                        child: Column(children: [
                          Container(
                              color: Color(0xf3f3f3ff),
                              padding: EdgeInsets.all(22),
                              child: Image.asset('assets/images/prod.jpg',
                                  width: 207.5, height: 207.5)),
                          Text('Title',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                        ])),
                    Spacer(flex: 3),
                  ]),
                ),
              ],
              if (MediaQuery.of(context).size.width < 1000) ...[
                if (MediaQuery.of(context).size.width > 550) ...[
                  Column(children: [
                    Row(children: [
                      Spacer(flex: 3),
                      Container(
                          height: 327.5,
                          child: Column(children: [
                            Container(
                                color: Color(0xf3f3f3ff),
                                padding: EdgeInsets.all(22),
                                child: Image.asset('assets/images/prod.jpg',
                                    width: 207.5, height: 207.5)),
                            Text('Title',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                          ])),
                      Spacer(flex: 1),
                      Container(
                          height: 327.5,
                          child: Column(children: [
                            Container(
                                color: Color(0xf3f3f3ff),
                                padding: EdgeInsets.all(22),
                                child: Image.asset('assets/images/prod.jpg',
                                    width: 207.5, height: 207.5)),
                            Text('Title',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                          ])),
                      Spacer(flex: 3),
                    ]),
                    Row(children: [
                      Spacer(flex: 3),
                      Container(
                          height: 327.5,
                          child: Column(children: [
                            Container(
                                color: Color(0xf3f3f3ff),
                                padding: EdgeInsets.all(22),
                                child: Image.asset('assets/images/prod.jpg',
                                    width: 207.5, height: 207.5)),
                            Text('Title',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                          ])),
                      Spacer(flex: 1),
                      Container(
                          height: 327.5,
                          child: Column(children: [
                            Container(
                                color: Color(0xf3f3f3ff),
                                padding: EdgeInsets.all(22),
                                child: Image.asset('assets/images/prod.jpg',
                                    width: 207.5, height: 207.5)),
                            Text('Title',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                          ])),
                      Spacer(flex: 3),
                    ])
                  ])
                ]
              ],
              if (MediaQuery.of(context).size.width < 550) ...[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        height: 327.5,
                        child: Column(children: [
                          Container(
                              color: Colors.grey,
                              padding: EdgeInsets.all(22),
                              child: Image.asset('assets/images/prod.jpg',
                                  width: 207.5, height: 207.5)),
                          Text('Title',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                        ])),
                    Container(
                        height: 327.5,
                        child: Column(children: [
                          Container(
                              color: Colors.grey,
                              padding: EdgeInsets.all(22),
                              child: Image.asset('assets/images/prod.jpg',
                                  width: 207.5, height: 207.5)),
                          Text('Title',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                        ])),
                    Container(
                        height: 327.5,
                        child: Column(children: [
                          Container(
                              color: Colors.grey,
                              padding: EdgeInsets.all(22),
                              child: Image.asset('assets/images/prod.jpg',
                                  width: 207.5, height: 207.5)),
                          Text('Title',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                        ])),
                    Container(
                        height: 327.5,
                        child: Column(children: [
                          Container(
                              color: Colors.grey,
                              padding: EdgeInsets.all(22),
                              child: Image.asset('assets/images/prod.jpg',
                                  width: 207.5, height: 207.5)),
                          Text('Title',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                        ])),
                  ],
                )
              ],
              if (swidth > 1200) ...[
                Row(children: [
                  Container(
                      height: 900,
                      width: swidth * 0.33,
                      child: Image.asset('assets/images/img2.jpg',
                          fit: BoxFit.cover)),
                  Container(
                      color: const Color.fromARGB(255, 241, 238, 238),
                      height: 900,
                      width: MediaQuery.of(context).size.width * 0.67,
                      padding: EdgeInsets.only(
                          top: 110, left: 90, right: swidth * 0.1),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SectionTitle(
                                'OUR FEEDBACK',
                                'Easy and effective way to get your device repaired.',
                                CrossAxisAlignment.end),
                            ScrollConfiguration(
                                behavior: ScrollConfiguration.of(context)
                                    .copyWith(scrollbars: false),
                                child: Expanded(
                                    child: GridView.count(
                                        crossAxisCount: 2,
                                        padding: const EdgeInsets.only(top: 60),
                                        physics: NeverScrollableScrollPhysics(),
                                        children: [
                                      Container(
                                          width: 200,
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Container(
                                                  child: const Icon(
                                                      FontAwesomeIcons
                                                          .faceSmile,
                                                      size: 60.0,
                                                      color: Colors.blue),
                                                ),
                                                Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 20),
                                                    child: const Text('OAs',
                                                        textAlign:
                                                            TextAlign.end,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20))),
                                                Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 20),
                                                    child: const Text('Número',
                                                        textAlign:
                                                            TextAlign.end,
                                                        style: TextStyle(
                                                            color:
                                                                Colors.grey)))
                                              ])),
                                      Container(
                                        width: 200,
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Container(
                                                padding: const EdgeInsets.only(
                                                    right: 16),
                                                child: const Icon(
                                                    FontAwesomeIcons.laptop,
                                                    size: 60.0,
                                                    color: Colors.blue),
                                              ),
                                              Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 20),
                                                  child: const Text(
                                                      'OAs autorais',
                                                      textAlign: TextAlign.end,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 20))),
                                              Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 20),
                                                  child: const Text('Número',
                                                      textAlign: TextAlign.end,
                                                      style: TextStyle(
                                                          color: Colors.grey)))
                                            ]),
                                      ),
                                      Container(
                                          width: 200,
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 10),
                                                  child: const Icon(
                                                      FontAwesomeIcons.desktop,
                                                      size: 65.0,
                                                      color: Colors.blue),
                                                ),
                                                Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 20),
                                                    child: const Text(
                                                        'Planos de Aula',
                                                        textAlign:
                                                            TextAlign.end,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20))),
                                                Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 20),
                                                    child: const Text('Número',
                                                        textAlign:
                                                            TextAlign.end,
                                                        style: TextStyle(
                                                            color:
                                                                Colors.grey)))
                                              ])),
                                      Container(
                                        width: 200,
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              const Icon(
                                                  FontAwesomeIcons.windows,
                                                  size: 65.0,
                                                  color: Colors.blue),
                                              Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 20),
                                                  child: const Text('Trilhas',
                                                      textAlign: TextAlign.end,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 20))),
                                              Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 20),
                                                  child: const Text('Número',
                                                      textAlign: TextAlign.end,
                                                      style: TextStyle(
                                                          color: Colors.grey)))
                                            ]),
                                      ),
                                      const Spacer(flex: 1),
                                    ])))
                          ]))
                ])
              ] else ...[
                Container(
                    color: const Color.fromARGB(255, 241, 238, 238),
                    height: 1310,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(top: 100, left: 40),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              child: const Text('OUR FEEDBACK',
                                  style: TextStyle(
                                      fontSize: 36,
                                      fontWeight: FontWeight.bold))),
                          Container(
                              padding: const EdgeInsets.only(top: 15),
                              child: const Text(
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
                              height: 1006,
                              width: 500,
                              padding: const EdgeInsets.only(top: 50),
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
                                        child: const Icon(
                                            FontAwesomeIcons.faceSmile,
                                            size: 60.0,
                                            color: Colors.white)),
                                    Container(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: const Text('OAs',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20))),
                                    Container(
                                        padding: const EdgeInsets.only(
                                            top: 20, bottom: 50),
                                        child: const Text('Texto',
                                            style:
                                                TextStyle(color: Colors.grey))),
                                    Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                        child: const Icon(
                                            FontAwesomeIcons.laptop,
                                            size: 60.0,
                                            color: Colors.white)),
                                    Container(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: const Text('OAs autorais',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20))),
                                    Container(
                                        padding: const EdgeInsets.only(
                                            top: 20, bottom: 50),
                                        child: const Text('Texto',
                                            style:
                                                TextStyle(color: Colors.grey))),
                                    Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                        child: const Icon(
                                            FontAwesomeIcons.desktop,
                                            size: 65.0,
                                            color: Colors.white)),
                                    Container(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: const Text('Planos de Aula',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20))),
                                    Container(
                                        padding: const EdgeInsets.only(
                                            top: 20, bottom: 50),
                                        child: const Text('Texto',
                                            style:
                                                TextStyle(color: Colors.grey))),
                                    Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                        child: const Icon(
                                            FontAwesomeIcons.windows,
                                            size: 65.0,
                                            color: Colors.white)),
                                    Container(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: const Text('Trilhas',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20))),
                                    Container(
                                        padding: const EdgeInsets.only(
                                            top: 20, bottom: 50),
                                        child: const Text('Texto',
                                            style:
                                                TextStyle(color: Colors.grey))),
                                  ]))
                        ]))
              ],
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
                        child: BlogData(context),
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
