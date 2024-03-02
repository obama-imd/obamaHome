import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latlong2/latlong.dart';
import 'package:obamahome/components/cores_personalizadas.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/launchSocialMedia.dart';
import '../utils/app_theme.dart';
import 'topbar.dart';

// ignore: must_be_immutable
class Footer extends StatefulWidget {
  double swidth;

  Footer(this.swidth, {super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  List<String> serviceCategories = [
    "> Formações",
    "> Objetos de Aprendizagem",
    "> Planos de Aula",
    "> Publicações",
    "> Trilhas",
  ];
  List<String> servicePaths = [
    '/formacoes',
    '/servicos',
    '/loja',
    '/blog',
    "/"
  ];

  List<String> additionalCategories = [
    "> Sobre Nós",
    "> Terms and conditions",
    "> Privacy policy",
    "> News",
    "> Contact us",
  ];
  List<String> additionalPaths = ['/aboutus', '', '', '', ''];

  @override
  Widget footerList(BuildContext context, List<String> categories,
      List<String> links, int index) {
    return Container(
        height: 7.5 * (categories.length).toDouble(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, links[index]);
              },
              child: Text(
                categories[index],
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
            Container(height: 5),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    String emailText = "";
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'obama@imd.ufrn.br',
      query: encodeQueryParameters(<String, String>{
        'subject': emailText,
      }),
    );

    return Column(children: [
      if (widget.swidth > 700) ...[
        Container(
            child: Row(children: [
          Container(
              height: 700,
              width: widget.swidth * 0.3,
              child: flutterMapArea(context)),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
                height: 650,
                width: widget.swidth * 0.7,
                color: Colors.black,
                child: Row(children: [
                  Container(
                      height: 600,
                      width: widget.swidth * 0.33,
                      padding: const EdgeInsets.only(left: 90, top: 70),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('OBAMA',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold)),
                            Container(height: 15),
                            Container(height: 4, width: 35, color: Colors.blue),
                            Container(height: 20),
                            const SizedBox(
                                height: 100,
                                child: Text('Texto',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 14))),
                            Container(height: 20),
                            SocialMedia(Colors.grey),
                            Container(height: 35),
                            const Text('NOSSOS SERVIÇOS',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold)),
                            Container(height: 15),
                            Container(height: 4, width: 35, color: Colors.blue),
                            Container(height: 20),
                            for (int i = 0;
                                i < serviceCategories.length;
                                i++) ...{
                              footerList(
                                  context, serviceCategories, servicePaths, i),
                            }
                          ])),
                  Container(
                      height: 600,
                      width: widget.swidth * 0.35,
                      padding: const EdgeInsets.only(left: 70, top: 70),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('LINKS ADICIONAIS',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold)),
                            Container(height: 15),
                            Container(height: 4, width: 35, color: Colors.blue),
                            Container(height: 20),
                            for (int i = 0;
                                i < additionalCategories.length;
                                i++) ...{
                              footerList(context, additionalCategories,
                                  additionalPaths, i),
                            },
                            Container(height: 35),
                            const Text('FALE CONOSCO',
                                style: TextStyle(
                                    color: background,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold)),
                            Container(height: 15),
                            Container(height: 4, width: 35, color: Colors.blue),
                            Container(height: 20),
                            const SizedBox(
                                height: 60,
                                width: 300,
                                child: Text(
                                    'Av. Cap. Mor Gouveia, 3000 - Lagoa Nova, Natal - RN, 59078-970',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 14))),
                            Container(height: 20),
                            SizedBox(
                                height: 40,
                                width: 300,
                                child: TextField(
                                    onChanged: (value) {
                                      setState(() {
                                        emailText = value;
                                      });
                                    },
                                    onSubmitted: (value) {
                                      launchUrl(emailLaunchUri);
                                    },
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none),
                                        hintText: 'E-mail',
                                        hintStyle: textTheme.displaySmall,
                                        contentPadding: EdgeInsets.all(10.0),
                                        filled: true,
                                        fillColor: Colors.white))),
                            Container(
                                height: 40,
                                width: 40,
                                color: CoresPersonalizadas.azulObama,
                                child: TextButton(
                                    onPressed: () {
                                      launchUrl(emailLaunchUri);
                                    },
                                    child: const Icon(Icons.mail,
                                        color: Colors.white, size: 16.0)))
                          ]))
                ])),
            Container(
                height: 50,
                width: widget.swidth * 0.7,
                color: CoresPersonalizadas.azulObama,
                child: const Center(
                    child: Text('Obama © Copyright 2022',
                        style: TextStyle(color: Colors.white))))
          ])
        ]))
      ] else ...[
        Column(children: [
          Container(
              height: 200,
              width: widget.swidth,
              child: flutterMapArea(context)),
          Container(
            height: 1350,
            width: widget.swidth,
            color: Colors.black,
            padding: const EdgeInsets.only(left: 40, top: 60),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('OBAMA THEME',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
              Container(height: 15),
              Container(height: 4, width: 35, color: Colors.blue),
              Container(height: 20),
              const SizedBox(
                  height: 100,
                  child: Text('Texto',
                      style: TextStyle(color: Colors.grey, fontSize: 14))),
              Container(height: 20),
              SocialMedia(Colors.grey),
              Container(height: 45),
              const Text('NOSSOS SERVIÇOS',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
              Container(height: 15),
              Container(height: 4, width: 35, color: Colors.blue),
              Container(height: 20),
              for (int i = 0; i < serviceCategories.length; i++) ...{
                footerList(context, serviceCategories, servicePaths, i),
              },
              Container(height: 35),
              const Text('LINKS ADICIONAIS',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
              Container(height: 15),
              Container(height: 4, width: 35, color: Colors.blue),
              Container(height: 20),
              for (int i = 0; i < additionalCategories.length; i++) ...{
                footerList(context, additionalCategories, additionalPaths, i),
              },
              Container(height: 35),
              const Text('FALE CONOSCO',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
              Container(height: 15),
              Container(height: 4, width: 35, color: Colors.blue),
              Container(height: 20),
              const SizedBox(
                  height: 60,
                  width: 300,
                  child: Text(
                      'Av. Cap. Mor Gouveia, 3000 - Lagoa Nova, Natal - RN, 59078-970',
                      style: TextStyle(color: Colors.grey, fontSize: 14))),
              Container(height: 20),
              Row(
                children: [
                  SizedBox(
                      height: 40,
                      width: widget.swidth - 120,
                      child: TextField(
                          onChanged: (value) {
                            setState(() {
                              emailText = value;
                            });
                          },
                          onSubmitted: (value) {
                            launchUrl(emailLaunchUri);
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              hintText: 'E-mail',
                              hintStyle: textTheme.displaySmall,
                              contentPadding: EdgeInsets.all(10.0),
                              filled: true,
                              fillColor: Colors.white))),
                  Container(
                      height: 40,
                      width: 40,
                      color: CoresPersonalizadas.azulObama,
                      child: TextButton(
                          onPressed: () {
                            launchUrl(emailLaunchUri);
                          },
                          child: const Icon(Icons.mail,
                              color: Colors.white, size: 16.0))),
                ],
              ),
            ]),
          ),
          Container(
              height: 50,
              width: widget.swidth,
              color: CoresPersonalizadas.azulObama,
              child: const Center(
                  child: Text('Obama © Copyright 2024',
                      style: TextStyle(color: Colors.white))))
        ])
      ]
    ]);
  }
}

@override
Widget flutterMapArea(BuildContext context) {
  return FlutterMap(
    mapController: MapController(),
    options: MapOptions(
      initialCenter: LatLng(-5.832006, -35.205471),
      initialZoom: 17,
      maxZoom: 18,
    ),
    children: [
      TileLayer(
        urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
        userAgentPackageName: 'com.example.app',
      ),
      MarkerLayer(
        markers: [
          Marker(
            point: LatLng(-5.832006, -35.205471),
            width: 50,
            height: 50,
            child: const Icon(FontAwesomeIcons.locationDot,
                size: 30, color: Colors.black),
          ),
        ],
      ),
    ],
  );
}
