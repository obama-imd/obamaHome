import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'package:image_network/image_network.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

import 'components/firstSectionHome.dart';
import 'components/menu.dart';

class UserModel {
  String title;
  String text;
  String? content;
  String? summary;
  String publishedDate;

  UserModel({
    required this.title,
    required this.text,
    this.content,
    this.summary,
    required this.publishedDate,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      title: json['text'] as String,
      text: json['text'] as String,
      content: json['content'] as String,
      summary: json['summary'] as String,
      publishedDate: json['published_date'] as String,
    );
  }
}

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
  bool _customTileExpanded = true;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  List<dynamic> datas = [];

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('http://192.168.1.72:3000/dados'));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      setState(() {
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

        String sumValue = extractSummaryPath(item['summary']);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageNetwork(
                image: imagePath,
                width: swid * .3,
                height: 190,
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ),
            Text(item['text'], style: TextStyle(fontSize: 15), maxLines: 4),
            // Text(sumValue),
          ],
        );
      },
    );
  }

  _ajustarVisualizacao(double larguraTela) {

    int colunas = 2;
    if (larguraTela <= 600 ){
      colunas = 2;
    }else if (larguraTela <= 960){
      colunas = 4;
    }else {
      colunas = 4;
    }
    return colunas;
  }

  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    return Scaffold(
        key: scaffoldKey,
        drawer: Drawer(
            width: swidth * 0.3,
            child: ListView(
              children: [
                ExpansionTile(
                    trailing: const Icon(FontAwesomeIcons.plus, size: 13),
                    title: ListView(shrinkWrap: true, children: [
                      Container(
                          padding: const EdgeInsets.only(left: 8),
                          child: const Text("Home"))
                    ]),
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                              onPressed: () {},
                              child: Container(
                                  width: swidth * 0.3,
                                  padding: const EdgeInsets.only(left: 16),
                                  child: const Text("Item 1",
                                      style: TextStyle(color: Colors.black))))),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                              onPressed: () {},
                              child: Container(
                                  width: swidth * 0.3,
                                  padding: const EdgeInsets.only(left: 16),
                                  child: const Text("Item 2",
                                      style: TextStyle(color: Colors.black)))))
                    ]),
                ExpansionTile(
                    trailing: const SizedBox.shrink(),
                    title: ListView(shrinkWrap: true, children: [
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/aboutus');
                          },
                          child: const Align(
                              alignment: Alignment.centerLeft,
                              child: Text("SOBRE NÓS")))
                    ])),
                ExpansionTile(
                    trailing: const Icon(FontAwesomeIcons.plus, size: 13),
                    title: ListView(shrinkWrap: true, children: [
                      Container(
                          padding: const EdgeInsets.only(left: 8),
                          child: const Text("SERVICES"))
                    ]),
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                              onPressed: () {},
                              child: Container(
                                  width: swidth * 0.3,
                                  padding: const EdgeInsets.only(left: 16),
                                  child: const Text("Item 1",
                                      style: TextStyle(color: Colors.black))))),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                              onPressed: () {},
                              child: Container(
                                  width: swidth * 0.3,
                                  padding: const EdgeInsets.only(left: 16),
                                  child: const Text("Item 2",
                                      style: TextStyle(color: Colors.black)))))
                    ]),
                ExpansionTile(
                    trailing: const Icon(FontAwesomeIcons.plus, size: 13),
                    title: ListView(shrinkWrap: true, children: [
                      Container(
                          padding: const EdgeInsets.only(left: 8),
                          child: const Text("PUBLICAÇÕES"))
                    ]),
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/blog');
                              },
                              child: Container(
                                  width: swidth * 0.3,
                                  padding: const EdgeInsets.only(left: 16),
                                  child: const Text("Item 1",
                                      style: TextStyle(color: Colors.black))))),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/blog');
                              },
                              child: Container(
                                  width: swidth * 0.3,
                                  padding: const EdgeInsets.only(left: 16),
                                  child: const Text("Item 2",
                                      style: TextStyle(color: Colors.black)))))
                    ]),
                ExpansionTile(
                    trailing: const Icon(FontAwesomeIcons.plus, size: 13),
                    title: ListView(shrinkWrap: true, children: [
                      Container(
                          padding: const EdgeInsets.only(left: 8),
                          child: const Text("PAGES"))
                    ]),
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                              onPressed: () {},
                              child: Container(
                                  width: swidth * 0.3,
                                  padding: const EdgeInsets.only(left: 16),
                                  child: const Text("Item 1",
                                      style: TextStyle(color: Colors.black))))),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                              onPressed: () {},
                              child: Container(
                                  width: swidth * 0.3,
                                  padding: const EdgeInsets.only(left: 16),
                                  child: const Text("Item 2",
                                      style: TextStyle(color: Colors.black)))))
                    ]),
                ExpansionTile(
                    trailing: const Icon(FontAwesomeIcons.plus, size: 13),
                    title: ListView(shrinkWrap: true, children: [
                      Container(
                          padding: const EdgeInsets.only(left: 8),
                          child: const Text("SHOP"))
                    ]),
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                              onPressed: () {},
                              child: Container(
                                  width: swidth * 0.3,
                                  padding: const EdgeInsets.only(left: 16),
                                  child: const Text("Item 1",
                                      style: TextStyle(color: Colors.black))))),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                              onPressed: () {},
                              child: Container(
                                  width: swidth * 0.3,
                                  padding: const EdgeInsets.only(left: 16),
                                  child: const Text("Item 2",
                                      style: TextStyle(color: Colors.black)))))
                    ]),
                ExpansionTile(
                    trailing: const Icon(FontAwesomeIcons.plus, size: 13),
                    title: ListView(shrinkWrap: true, children: [
                      Container(
                          padding: const EdgeInsets.only(left: 8),
                          child: const Text("CONTACT"))
                    ]),
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                              onPressed: () {},
                              child: Container(
                                  width: swidth * 0.3,
                                  padding: const EdgeInsets.only(left: 16),
                                  child: const Text("Item 1",
                                      style: TextStyle(color: Colors.black))))),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                              onPressed: () {},
                              child: Container(
                                  width: swidth * 0.3,
                                  padding: const EdgeInsets.only(left: 16),
                                  child: const Text("Item 2",
                                      style: TextStyle(color: Colors.black)))))
                    ])
              ],
            )),
        body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
                child: Column(children: <Widget>[
              if (swidth > 1150) ...[
                Container(
                    color: Colors.blue,
                    height: 45.0,
                    width: swidth,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              width: 500,
                              margin: EdgeInsets.only(left: swidth * 0.068),
                              child: Row(children: [
                                Container(
                                    child: Row(children: [
                                  Container(
                                      padding: EdgeInsets.only(right: 10),
                                      child: Icon(FontAwesomeIcons.house,
                                          color: Colors.white, size: 13)),
                                  const Text(
                                      'Av. Cap. Mor Gouveia, 3000 - Lagoa Nova, Natal - RN',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 13.0)),
                                ])),
                                Container(
                                    margin: EdgeInsets.only(left: 20),
                                    child: Row(children: [
                                      Container(
                                          padding: EdgeInsets.only(right: 10),
                                          child: Icon(FontAwesomeIcons.envelope,
                                              color: Colors.white, size: 16)),
                                      const Text('obama@imd.ufrn.br',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13.0)),
                                    ]))
                              ])),
                          Spacer(),
                          Container(
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                SizedBox(
                                    height: 20,
                                    width: swidth * 0.02,
                                    child: const TextButton(
                                        //  Ícones redes sociais <-- link
                                        onPressed: _launchURL,
                                        child: Icon(FontAwesomeIcons.instagram,
                                            color: Colors.white, size: 15.0))),
                                SizedBox(
                                    height: 20,
                                    width: swidth * 0.02,
                                    child: const TextButton(
                                      onPressed: _launchURL1,
                                      child: Icon(FontAwesomeIcons.youtube,
                                          color: Colors.white, size: 15.0),
                                    )),
                                Container(
                                    margin: EdgeInsets.only(
                                        left: 50.0, right: swidth * 0.068),
                                    height: 45,
                                    width: 160,
                                    child: Container(
                                        width: swidth * 0.154,
                                        color: Colors.white,
                                        height: 45,
                                        child: TextButton(
                                            onPressed: () {},
                                            child: const Text('Acesse',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16.0)))))
                              ]))
                        ]))
              ],
              if (swidth < 1150) ...[
                if (swidth > 900) ...[
                  Container(
                      color: Colors.blue,
                      height: 90.0,
                      width: swidth,
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: const Text('HOME',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.0)),
                            ),
                            Row(children: [
                              Container(width: swidth * 0.07),
                              Container(
                                  width: 40,
                                  padding: const EdgeInsets.only(top: 10),
                                  child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                            height: 17,
                                            width: 20,
                                            child: TextButton(
                                                //  Ícones redes sociais <-- link
                                                onPressed: _launchURL,
                                                child: Icon(
                                                    FontAwesomeIcons.instagram,
                                                    color: Colors.white,
                                                    size: 15.0))),
                                        SizedBox(
                                            height: 17,
                                            width: 20,
                                            child: TextButton(
                                              onPressed: _launchURL1,
                                              child: Icon(
                                                  FontAwesomeIcons.youtube,
                                                  color: Colors.white,
                                                  size: 15.0),
                                            )),
                                      ])),
                              Container(width: swidth * 0.65),
                              Container(
                                  height: 55,
                                  width: 160,
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Container(
                                      color: Colors.white,
                                      height: 55,
                                      child: TextButton(
                                          onPressed: () {},
                                          child: const Text('Acesse',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16.0))))),
                              Container(width: swidth * 0.04),
                            ])
                          ])),
                ],
              ],
              if (swidth < 900) ...[
                Container(
                  color: Colors.blue,
                  height: 120.0,
                  width: swidth,
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: const Text('HOME',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0)),
                        ),
                        Container(
                            width: 90,
                            padding: const EdgeInsets.only(top: 15),
                            child: const Column(children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        height: 17,
                                        width: 20,
                                        child: TextButton(
                                            //  Ícones redes sociais <-- link
                                            onPressed: _launchURL,
                                            child: Icon(
                                                FontAwesomeIcons.instagram,
                                                color: Colors.white,
                                                size: 15.0))),
                                    SizedBox(
                                        height: 17,
                                        width: 35,
                                        child: TextButton(
                                          onPressed: _launchURL1,
                                          child: Icon(FontAwesomeIcons.youtube,
                                              color: Colors.white, size: 15.0),
                                        )),
                                  ])
                            ])),
                        Container(
                            height: 45,
                            width: 210,
                            padding: const EdgeInsets.only(top: 15),
                            child: Container(
                                color: Colors.white,
                                height: 45,
                                child: TextButton(
                                    onPressed: () {},
                                    child: const Text('Acesse',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.0)))))
                      ]),
                )
              ],
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
                          Container(
                              padding: const EdgeInsets.all(9.2),
                              child: MenuBar0(context)),
                          Container(
                              padding: const EdgeInsets.all(9.2),
                              child: MenuBar1(context)),
                          Container(
                              padding: const EdgeInsets.all(9.2),
                              child: MenuBar2(context)),
                          Container(
                              padding: const EdgeInsets.all(9.2),
                              child: MenuBar3(context)),
                          Container(
                              padding: const EdgeInsets.all(9.2),
                              child: MenuBar4(context)),
                          Container(
                              padding: const EdgeInsets.all(9.2),
                              child: MenuBar5(context)),
                          Container(
                              padding: const EdgeInsets.all(9.2),
                              child: MenuBar6(context)),
                          Container(
                              padding: const EdgeInsets.all(9.5),
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
                height: 300,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(top: 120.0, bottom: 60.0),
                child: Column(children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Text('Plataforma OBAMA',
                              textScaleFactor: 3.0,
                              style: GoogleFonts.raleway(
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.bold)))),
                      Text('Objetos de Aprendizagem para Matemática',
                          textScaleFactor: 1.7,
                          style: GoogleFonts.raleway(
                              textStyle: const TextStyle(color: Colors.grey))),
                      Container(
                          height: 27.0,
                          width: 82.0,
                          padding: const EdgeInsets.only(top: 22.0),
                          child: Image.asset('assets/images/img2.jpg',
                              fit: BoxFit.cover)),
                    ],
                  ),
                ]),
              ),
              Padding(
          padding: EdgeInsets.all(16.00),
          child: GridView.count(
            crossAxisCount: _ajustarVisualizacao(swidth),    //chama metodo para captar quantidade de colunas de acordo com tamanho da tela
            crossAxisSpacing: 8,  // espaçamento entre itens
            children: [
              ItemProduto("Data Recovery",  "nononon nono nonon non !", "i1.png"),
              ItemProduto("Computer repair","nono nononon nononon no !", "i2.png"),
              ItemProduto("Mobile service", "nonon nonono nononon !", "i3.png"),
              ItemProduto("Data Recovery",  "nonononon nonon onon !", "i4.png"),
            ],
          ),
        ),
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
                            Container(
                                child: const Text('ABOUT SERVICE',
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
                    height: 1300,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(top: 100, left: 50),
                    child: Column(children: [
                      Container(
                          child: const Text('ABOUT SERVICE',
                              style: TextStyle(
                                  fontSize: 36, fontWeight: FontWeight.bold))),
                      Container(
                          padding: const EdgeInsets.only(top: 15),
                          child: const Text(
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
                                    padding: const EdgeInsets.only(top: 20),
                                    child: const Text('Texto',
                                        style: TextStyle(color: Colors.grey))),
                                Container(height: 60, width: 100),
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
                                    padding: const EdgeInsets.only(top: 20),
                                    child: const Text('Texto',
                                        style: TextStyle(color: Colors.grey))),
                                Container(height: 60, width: 100),
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
                                    padding: const EdgeInsets.only(top: 20),
                                    child: const Text('Texto',
                                        style: TextStyle(color: Colors.grey))),
                                Container(height: 60, width: 100),
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
                                    padding: const EdgeInsets.only(top: 20),
                                    child: const Text('Texto',
                                        style: TextStyle(color: Colors.grey))),
                                Container(height: 60, width: 100),
                              ]))
                    ]))
              ],
              if (MediaQuery.of(context).size.width > 1200) ...[
                Container(
                    height: 440,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(
                        top: 60,
                        left: MediaQuery.of(context).size.width * 0.07),
                    child: Row(children: [
                      buildText(context),
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
                      buildText1(context),
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
              Container(
                margin: EdgeInsets.only(bottom: 50.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: Text('OUR PRODUCTS',
                            textScaleFactor: 2.5,
                            style: GoogleFonts.raleway(
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.bold)))),
                    Text(
                        'We package the products with best services to make you a happy customer.',
                        textScaleFactor: 1.7,
                        style: GoogleFonts.raleway(
                            textStyle: const TextStyle(color: Colors.grey))),
                    Container(
                        height: 27.0,
                        width: 82.0,
                        padding: const EdgeInsets.only(top: 22.0),
                        child: Image.asset('assets/images/img2.jpg',
                            fit: BoxFit.cover)),
                  ],
                ),
              ),
              if (MediaQuery.of(context).size.width > 1000) ...[
                Row(children: [
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
                            Container(
                                child: const Text('OUR FEEDBACK',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        fontSize: 36,
                                        fontWeight: FontWeight.bold))),
                            Container(
                                padding: const EdgeInsets.only(top: 15),
                                child: const Text(
                                    'Easy and effective way to get your device repaired.',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        fontSize: 22, color: Colors.grey))),
                            Container(height: 20),
                            Container(
                              child: Row(children: [
                                const Spacer(),
                                SizedBox(
                                    height: 5.0,
                                    width: 82.0,
                                    child: Image.asset('assets/images/img2.jpg',
                                        fit: BoxFit.cover)),
                              ]),
                            ),
                            ScrollConfiguration(
                                behavior: ScrollConfiguration.of(context)
                                    .copyWith(scrollbars: false),
                                child: Expanded(
                                    child: GridView.count(
                                        crossAxisCount: 2,
                                        padding: const EdgeInsets.only(top: 60),
                                        physics:
                                            const NeverScrollableScrollPhysics(),
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
                    height: 1300,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(top: 100, left: 50),
                    child: Column(children: [
                      Container(
                          child: const Text('OUR FEEDBACK',
                              style: TextStyle(
                                  fontSize: 36, fontWeight: FontWeight.bold))),
                      Container(
                          padding: const EdgeInsets.only(top: 15),
                          child: const Text(
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
                                    padding: const EdgeInsets.only(top: 20),
                                    child: const Text('Texto',
                                        style: TextStyle(color: Colors.grey))),
                                Container(height: 60, width: 100),
                                Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: const Icon(FontAwesomeIcons.laptop,
                                        size: 60.0, color: Colors.white)),
                                Container(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: const Text('OAs autorais',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20))),
                                Container(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: const Text('Texto',
                                        style: TextStyle(color: Colors.grey))),
                                Container(height: 60, width: 100),
                                Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: const Icon(FontAwesomeIcons.desktop,
                                        size: 65.0, color: Colors.white)),
                                Container(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: const Text('Planos de Aula',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20))),
                                Container(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: const Text('Texto',
                                        style: TextStyle(color: Colors.grey))),
                                Container(height: 60, width: 100),
                                Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: const Icon(FontAwesomeIcons.windows,
                                        size: 65.0, color: Colors.white)),
                                Container(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: const Text('Trilhas',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20))),
                                Container(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: const Text('Texto',
                                        style: TextStyle(color: Colors.grey))),
                                Container(height: 60, width: 100),
                              ]))
                    ]))
              ],
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 60, left: 45),
                      child: const Text('ÚLTIMOS POSTS DO BLOG',
                          style: TextStyle(
                              fontSize: 36, fontWeight: FontWeight.bold))),
                ],
              ),
              Row(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 45),
                  child: SizedBox(
                      height: 5.0,
                      width: 82.0,
                      child: Image.asset('assets/images/img2.jpg',
                          fit: BoxFit.cover)),
                ),
              ]),
              Container(
                  margin: EdgeInsets.only(top: 50, left: 45, right: 45),
                  child: BlogData(context)),
              if (swidth > 1300) ...[
                Container(
                    height: 875,
                    width: swidth,
                    child: Stack(children: <Widget>[
                      Column(children: [
                        Container(height: 100, width: swidth),
                        Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.only(top: 50),
                            height: 700,
                            decoration: const BoxDecoration(
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
                                padding:
                                    const EdgeInsets.only(left: 90, top: 100),
                                child: const Text('What Clients Say?',
                                    style: TextStyle(
                                        fontSize: 36,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white))),
                            Container(
                                padding:
                                    const EdgeInsets.only(top: 15, left: 90),
                                child: const Text(
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
                                          image: const DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/client.jpg'),
                                              fit: BoxFit.cover))),
                                  Container(width: 20),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10),
                                      height: 150,
                                      width: 500,
                                      child: ListView(children: [
                                        const Text('Texto',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18)),
                                        Container(height: 65),
                                        const Text('Maria Anderson',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold)),
                                        Container(height: 20),
                                        const Text('CFO, Tech NY',
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
                                          image: const DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/client.jpg'),
                                              fit: BoxFit.cover))),
                                  Container(width: 20),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10),
                                      height: 150,
                                      width: 500,
                                      child: ListView(children: [
                                        const Text('Texto',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18)),
                                        Container(height: 65),
                                        const Text('Maria Anderson',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold)),
                                        Container(height: 20),
                                        const Text('CFO, Tech NY',
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
                                          image: const DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/client.jpg'),
                                              fit: BoxFit.cover))),
                                  Container(width: 20),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10),
                                      height: 150,
                                      width: 500,
                                      child: ListView(children: [
                                        const Text('Texto',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18)),
                                        Container(height: 65),
                                        const Text('Maria Anderson',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold)),
                                        Container(height: 20),
                                        const Text('CFO, Tech NY',
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
                                          child: const Icon(
                                            Icons.phone,
                                            size: 70,
                                            color: Colors.white,
                                          )),
                                      Container(
                                          width: 500,
                                          height: 100,
                                          child: const Column(
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
                                              child: const Text('CONTACT US',
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
                          height: 120,
                          width: swidth * 0.161,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 6,
                                  color: const Color.fromARGB(
                                      255, 231, 228, 228))),
                          child: const Image(
                              image: AssetImage('assets/images/ufrn.jpg'),
                              fit: BoxFit.scaleDown)),
                      Container(width: 12, height: 100),
                      Container(
                          height: 120,
                          width: swidth * 0.161,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 6,
                                  color: const Color.fromARGB(
                                      255, 231, 228, 228))),
                          child: const Image(
                              image: AssetImage('assets/images/imd.png'),
                              fit: BoxFit.scaleDown)),
                      Container(width: 12, height: 100),
                      Container(
                          height: 120,
                          width: swidth * 0.161,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 6,
                                  color: const Color.fromARGB(
                                      255, 231, 228, 228))),
                          child: const Image(
                              image: AssetImage('assets/images/remne.jpeg'),
                              fit: BoxFit.scaleDown)),
                      Container(width: 12, height: 100),
                      Container(
                          height: 120,
                          width: swidth * 0.161,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 6,
                                  color: const Color.fromARGB(
                                      255, 231, 228, 228))),
                          child: const Image(
                              image: AssetImage('assets/images/gilfe.jpg'),
                              fit: BoxFit.contain)),
                      Container(width: 12, height: 100),
                      Container(
                        height: 120,
                        width: swidth * 0.161,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 6,
                                color:
                                    const Color.fromARGB(255, 231, 228, 228))),
                      ),
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
                            padding: const EdgeInsets.only(top: 50),
                            height: 550,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/test.png'),
                                  fit: BoxFit.cover),
                            ))
                      ]),
                      ListView(children: [
                        Container(height: 40),
                        Container(
                            padding: const EdgeInsets.only(left: 40, top: 50),
                            child: const Text('What Clients Say?',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white))),
                        Container(
                            padding: const EdgeInsets.only(top: 15, left: 40),
                            child: const Text(
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
                                      image: const DecorationImage(
                                          image: AssetImage(
                                              'assets/images/client.jpg'),
                                          fit: BoxFit.cover))),
                              Container(
                                  padding: const EdgeInsets.only(left: 30),
                                  height: 150,
                                  width: swidth - 140,
                                  child: ListView(children: [
                                    const Text('Texto',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16)),
                                    Container(height: 65),
                                    const Text('Maria Anderson',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                    Container(height: 20),
                                    const Text('CFO, Tech NY',
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
                                      image: const DecorationImage(
                                          image: AssetImage(
                                              'assets/images/client.jpg'),
                                          fit: BoxFit.cover))),
                              Container(
                                  padding: const EdgeInsets.only(left: 30),
                                  height: 150,
                                  width: swidth - 140,
                                  child: ListView(children: [
                                    const Text('Texto',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16)),
                                    Container(height: 65),
                                    const Text('Maria Anderson',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                    Container(height: 20),
                                    const Text('CFO, Tech NY',
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
                                      image: const DecorationImage(
                                          image: AssetImage(
                                              'assets/images/client.jpg'),
                                          fit: BoxFit.cover))),
                              Container(
                                  padding: const EdgeInsets.only(left: 30),
                                  height: 150,
                                  width: swidth - 140,
                                  child: ListView(children: [
                                    const Text('Texto',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16)),
                                    Container(height: 65),
                                    const Text('Maria Anderson',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                    Container(height: 20),
                                    const Text('CFO, Tech NY',
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
                                child: const Icon(
                                  Icons.phone,
                                  size: 40,
                                  color: Colors.white,
                                )),
                            Container(
                                width: swidth * 0.7,
                                height: 100,
                                child: const Column(
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
                                  child: const Text('CONTACT US',
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
                                  color: const Color.fromARGB(
                                      255, 231, 228, 228))),
                          child: const Image(
                              image: AssetImage('assets/images/ufrn.jpg'),
                              fit: BoxFit.cover)),
                      Container(width: 12, height: 12),
                      Container(
                          height: 100,
                          width: swidth * 0.9,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 6,
                                  color: const Color.fromARGB(
                                      255, 231, 228, 228))),
                          child: const Image(
                              image: AssetImage('assets/images/imd.png'),
                              fit: BoxFit.cover)),
                      Container(width: 12, height: 12),
                      Container(
                          height: 100,
                          width: swidth * 0.9,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 6,
                                  color: const Color.fromARGB(
                                      255, 231, 228, 228))),
                          child: const Image(
                              image: AssetImage('assets/images/remne.jpeg'),
                              fit: BoxFit.cover)),
                      Container(width: 12, height: 12),
                      Container(
                          height: 100,
                          width: swidth * 0.9,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 6,
                                  color: const Color.fromARGB(
                                      255, 231, 228, 228))),
                          child: const Image(
                              image: AssetImage('assets/images/gilfe.jpg'),
                              fit: BoxFit.cover)),
                      Container(width: 12, height: 12),
                      Container(
                        height: 100,
                        width: swidth * 0.9,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 6,
                                color:
                                    const Color.fromARGB(255, 231, 228, 228))),
                      ),
                    ])))
              ],
              Container(height: 60),
              if (swidth > 700) ...[
                Container(
                    child: Row(children: [
                  Container(
                      height: 700,
                      width: swidth * 0.3,
                      color: Colors.grey,
                      padding: const EdgeInsets.all(5),
                      child: FlutterMap(
                        options: MapOptions(
                          center: LatLng(-5.832006, -35.205471),
                          zoom: 17,
                          maxZoom: 18,
                          enableScrollWheel: false,
                          pinchZoomThreshold: 0.5,
                        ),
                        layers: [
                          TileLayerOptions(
                            urlTemplate:
                                "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                            userAgentPackageName: 'com.example.app',
                          ),
                          MarkerLayerOptions(
                            markers: [
                              Marker(
                                point: LatLng(-5.832006, -35.205471),
                                width: 50,
                                height: 50,
                                builder: (context) => const Icon(
                                    FontAwesomeIcons.locationDot,
                                    size: 30,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ],
                        nonRotatedChildren: [
                          AttributionWidget.defaultWidget(
                            source: 'OpenStreetMap contributors',
                            onSourceTapped: null,
                          ),
                        ],
                      )),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            height: 650,
                            width: swidth * 0.7,
                            color: Colors.black,
                            child: Row(children: [
                              Container(
                                  height: 600,
                                  width: swidth * 0.33,
                                  padding:
                                      const EdgeInsets.only(left: 90, top: 70),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text('OBAMA THEME',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold)),
                                        Container(height: 15),
                                        const SizedBox(
                                            height: 4,
                                            width: 35,
                                            child: DecoratedBox(
                                                decoration: BoxDecoration(
                                                    color: Colors.blue))),
                                        Container(height: 20),
                                        Container(
                                            height: 100,
                                            child: const Text('Texto',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 14))),
                                        Container(height: 20),
                                        Row(children: [
                                          const SizedBox(
                                              height: 20,
                                              width: 20,
                                              child: TextButton(
                                                  //  Ícones redes sociais <-- link
                                                  onPressed: _launchURL,
                                                  child: Icon(
                                                      FontAwesomeIcons
                                                          .instagram,
                                                      color: Colors.grey,
                                                      size: 18.0))),
                                          Container(width: 5),
                                          const SizedBox(
                                              height: 20,
                                              width: 20,
                                              child: TextButton(
                                                onPressed: _launchURL1,
                                                child: Icon(
                                                    FontAwesomeIcons.youtube,
                                                    color: Colors.grey,
                                                    size: 18.0),
                                              )),
                                        ]),
                                        Container(height: 65),
                                        const Text('SERVICES',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold)),
                                        Container(height: 15),
                                        const SizedBox(
                                            height: 4,
                                            width: 35,
                                            child: DecoratedBox(
                                                decoration: BoxDecoration(
                                                    color: Colors.blue))),
                                        Container(height: 20),
                                        TextButton(
                                            onPressed: () {},
                                            child: const Text('> Data revovery',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 14))),
                                        Container(height: 5),
                                        TextButton(
                                            onPressed: () {},
                                            child: const Text(
                                                '> Computer repair',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 14))),
                                        Container(height: 5),
                                        TextButton(
                                            onPressed: () {},
                                            child: const Text(
                                                '> Mobile service',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 14))),
                                        Container(height: 5),
                                        TextButton(
                                            onPressed: () {},
                                            child: const Text(
                                                '> Network solutions',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 14))),
                                        Container(height: 5),
                                        TextButton(
                                            onPressed: () {},
                                            child: const Text(
                                                '> Technical support',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 14))),
                                      ])),
                              Container(
                                  height: 600,
                                  width: swidth * 0.35,
                                  padding:
                                      const EdgeInsets.only(left: 70, top: 70),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text('ADDITIONAL LINKS',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold)),
                                        Container(height: 15),
                                        const SizedBox(
                                            height: 4,
                                            width: 35,
                                            child: DecoratedBox(
                                                decoration: BoxDecoration(
                                                    color: Colors.blue))),
                                        Container(height: 20),
                                        TextButton(
                                            onPressed: () {},
                                            child: const Text('> About us',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 14))),
                                        Container(height: 5),
                                        TextButton(
                                            onPressed: () {},
                                            child: const Text(
                                                '> Terms and conditions',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 14))),
                                        Container(height: 5),
                                        TextButton(
                                            onPressed: () {},
                                            child: const Text(
                                                '> Privacy policy',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 14))),
                                        Container(height: 5),
                                        TextButton(
                                            onPressed: () {},
                                            child: const Text('> News',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 14))),
                                        Container(height: 5),
                                        TextButton(
                                            onPressed: () {},
                                            child: const Text('> Contact us',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 14))),
                                        Container(height: 40),
                                        const Text('CONTACT US',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold)),
                                        Container(height: 15),
                                        const SizedBox(
                                            height: 4,
                                            width: 35,
                                            child: DecoratedBox(
                                                decoration: BoxDecoration(
                                                    color: Colors.blue))),
                                        Container(height: 20),
                                        Container(
                                            height: 60,
                                            width: 300,
                                            child: const Text(
                                                'Av. Cap. Mor Gouveia, 3000 - Lagoa Nova, Natal - RN, 59078-970',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 14))),
                                        Container(height: 20),
                                        Container(
                                            height: 40,
                                            width: 300,
                                            child: const TextField(
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                        borderSide:
                                                            BorderSide.none),
                                                    hintText: 'E-mail',
                                                    contentPadding:
                                                        EdgeInsets.all(10.0),
                                                    filled: true,
                                                    fillColor: Colors.white))),
                                        Container(
                                            height: 40,
                                            width: 40,
                                            color: Colors.blue,
                                            child: TextButton(
                                                onPressed: () {},
                                                child: const Icon(Icons.mail,
                                                    color: Colors.white,
                                                    size: 16.0)))
                                      ]))
                            ])),
                        Container(
                            height: 50,
                            width: swidth * 0.7,
                            color: Colors.blue,
                            child: const Center(
                                child: Text('Obama © Copyright 2022',
                                    style: TextStyle(color: Colors.white))))
                      ])
                ]))
              ] else ...[
                Column(children: [
                  Container(
                      height: 200,
                      width: swidth,
                      color: Colors.grey,
                      padding: const EdgeInsets.all(5),
                      child: FlutterMap(
                        options: MapOptions(
                          center: LatLng(-5.832006, -35.205471),
                          zoom: 17,
                          maxZoom: 18,
                          enableScrollWheel: false,
                          pinchZoomThreshold: 0.5,
                        ),
                        layers: [
                          TileLayerOptions(
                            urlTemplate:
                                "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                            userAgentPackageName: 'com.example.app',
                          ),
                          MarkerLayerOptions(
                            markers: [
                              Marker(
                                point: LatLng(-5.832006, -35.205471),
                                width: 50,
                                height: 50,
                                builder: (context) => const Icon(
                                    FontAwesomeIcons.locationDot,
                                    size: 30,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ],
                        nonRotatedChildren: [
                          AttributionWidget.defaultWidget(
                            source: 'OpenStreetMap contributors',
                            onSourceTapped: null,
                          ),
                        ],
                      )),
                  Container(
                    height: 1100,
                    width: swidth,
                    color: Colors.black,
                    child: Container(
                        height: 1100,
                        width: swidth * 0.9,
                        padding: const EdgeInsets.only(left: 90, top: 90),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('OBAMA THEME',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                              Container(height: 15),
                              const SizedBox(
                                  height: 4,
                                  width: 35,
                                  child: DecoratedBox(
                                      decoration:
                                          BoxDecoration(color: Colors.blue))),
                              Container(height: 20),
                              Container(
                                  height: 100,
                                  child: const Text('Texto',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 14))),
                              Container(height: 20),
                              Row(children: [
                                const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: TextButton(
                                        //  Ícones redes sociais <-- link
                                        onPressed: _launchURL,
                                        child: Icon(FontAwesomeIcons.instagram,
                                            color: Colors.grey, size: 18.0))),
                                Container(width: 5),
                                const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: TextButton(
                                      onPressed: _launchURL1,
                                      child: Icon(FontAwesomeIcons.youtube,
                                          color: Colors.grey, size: 18.0),
                                    )),
                              ]),
                              Container(height: 45),
                              const Text('SERVICES',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                              Container(height: 15),
                              const SizedBox(
                                  height: 4,
                                  width: 35,
                                  child: DecoratedBox(
                                      decoration:
                                          BoxDecoration(color: Colors.blue))),
                              Container(height: 20),
                              TextButton(
                                  onPressed: () {},
                                  child: const Text('> Data revovery',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 14))),
                              Container(height: 5),
                              TextButton(
                                  onPressed: () {},
                                  child: const Text('> Computer repair',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 14))),
                              Container(height: 5),
                              TextButton(
                                  onPressed: () {},
                                  child: const Text('> Mobile service',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 14))),
                              Container(height: 5),
                              TextButton(
                                  onPressed: () {},
                                  child: const Text('> Network solutions',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 14))),
                              Container(height: 5),
                              TextButton(
                                  onPressed: () {},
                                  child: const Text('> Technical support',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 14))),
                              Container(height: 40),
                              const Text('ADDITIONAL LINKS',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                              Container(height: 15),
                              const SizedBox(
                                  height: 4,
                                  width: 35,
                                  child: DecoratedBox(
                                      decoration:
                                          BoxDecoration(color: Colors.blue))),
                              Container(height: 20),
                              TextButton(
                                  onPressed: () {},
                                  child: const Text('> About us',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 14))),
                              Container(height: 5),
                              TextButton(
                                  onPressed: () {},
                                  child: const Text('> Terms and conditions',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 14))),
                              Container(height: 5),
                              TextButton(
                                  onPressed: () {},
                                  child: const Text('> Privacy policy',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 14))),
                              Container(height: 5),
                              TextButton(
                                  onPressed: () {},
                                  child: const Text('> News',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 14))),
                              Container(height: 5),
                              TextButton(
                                  onPressed: () {},
                                  child: const Text('> Contact us',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 14))),
                              Container(height: 40),
                              const Text('CONTACT US',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                              Container(height: 15),
                              const SizedBox(
                                  height: 4,
                                  width: 35,
                                  child: DecoratedBox(
                                      decoration:
                                          BoxDecoration(color: Colors.blue))),
                              Container(height: 20),
                              Container(
                                  height: 60,
                                  width: 300,
                                  child: const Text(
                                      'Av. Cap. Mor Gouveia, 3000 - Lagoa Nova, Natal - RN, 59078-970',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 14))),
                              Container(height: 20),
                              Container(
                                  height: 40,
                                  width: swidth * 0.7,
                                  child: const TextField(
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide.none),
                                          hintText: 'Search',
                                          contentPadding: EdgeInsets.all(10.0),
                                          filled: true,
                                          fillColor: Colors.white))),
                              Container(
                                  height: 40,
                                  width: 40,
                                  color: Colors.blue,
                                  child: TextButton(
                                      onPressed: () {},
                                      child: const Icon(Icons.mail,
                                          color: Colors.white, size: 16.0))),
                            ])),
                  ),
                  Container(
                      height: 50,
                      width: swidth,
                      color: Colors.blue,
                      child: const Center(
                          child: Text('Obama © Copyright 2022',
                              style: TextStyle(color: Colors.white))))
                ])
              ]
            ]))));
  }
}

_launchURL() async {
  //   <-- link 1 cabeçalho
  const url = 'https://www.instagram.com/obamaimd/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL1() async {
  //   <-- link 2 cabeçalho
  const url = 'https://www.youtube.com/channel/UCLsGoIRTGyiUrNW5JdVi9wg';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

Widget buildText(BuildContext context) {
  return Container(
      width: MediaQuery.of(context).size.width * 0.55,
      child: Column(children: [
        ExpansionTile(
            title: Row(children: [
              Container(height: 30, width: 2),
              const Icon(FontAwesomeIcons.chartColumn, size: 19),
              Container(height: 30, width: 10),
              const Text('Texto', style: TextStyle(color: Colors.black)),
            ]),
            children: [
              const ListTile(
                  title: Text('Texto', style: TextStyle(height: 1.4)))
            ]),
        Container(height: 20, width: 10),
        ExpansionTile(
            title: Row(children: [
              const Icon(Icons.airplanemode_active, size: 21),
              Container(height: 30, width: 10),
              const Text('Texto', style: TextStyle(color: Colors.black)),
            ]),
            children: [
              const ListTile(
                  title: Text('Texto', style: TextStyle(height: 1.4))),
            ]),
        Container(height: 20, width: 10),
        ExpansionTile(
            title: Row(children: [
              const Icon(Icons.star, size: 21),
              Container(height: 30, width: 10),
              const Text('Texto', style: TextStyle(color: Colors.black)),
            ]),
            children: [
              const ListTile(
                  title: Text('Texto', style: TextStyle(height: 1.4))),
            ]),
        Container(height: 20, width: 10),
        ExpansionTile(
            title: Row(children: [
              Container(height: 30, width: 2),
              const Icon(FontAwesomeIcons.chartColumn, size: 19),
              Container(height: 30, width: 10),
              const Text('Texto', style: TextStyle(color: Colors.black)),
            ]),
            children: [
              const ListTile(
                  title: Text('Texto', style: TextStyle(height: 1.4))),
            ])
      ]));
}

Widget buildText1(BuildContext context) {
  return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(children: [
        ExpansionTile(
            title: Row(children: [
              Container(height: 30, width: 2),
              const Icon(FontAwesomeIcons.chartColumn, size: 19),
              Container(height: 30, width: 10),
              const Text('Texto', style: TextStyle(color: Colors.black)),
            ]),
            children: [
              const ListTile(
                  title: Text('Texto', style: TextStyle(height: 1.4)))
            ]),
        Container(height: 20, width: 10),
        ExpansionTile(
            title: Row(children: [
              const Icon(Icons.airplanemode_active, size: 21),
              Container(height: 30, width: 10),
              const Text('Texto', style: TextStyle(color: Colors.black)),
            ]),
            children: [
              const ListTile(
                  title: Text('Texto', style: TextStyle(height: 1.4))),
            ]),
        Container(height: 20, width: 10),
        ExpansionTile(
            title: Row(children: [
              const Icon(Icons.star, size: 21),
              Container(height: 30, width: 10),
              const Text('Texto', style: TextStyle(color: Colors.black)),
            ]),
            children: [
              const ListTile(
                  title: Text('Texto', style: TextStyle(height: 1.4))),
            ]),
        Container(height: 20, width: 10),
        ExpansionTile(
            title: Row(children: [
              Container(height: 30, width: 2),
              const Icon(FontAwesomeIcons.chartColumn, size: 19),
              Container(height: 30, width: 10),
              const Text('Texto', style: TextStyle(color: Colors.black)),
            ]),
            children: [
              const ListTile(
                  title: Text('Texto', style: TextStyle(height: 1.4))),
            ])
      ]));
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
