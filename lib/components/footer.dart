import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latlong2/latlong.dart';
import 'package:obamahome/utils/cores_personalizadas.dart';
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
                style: textTheme.displayMedium,
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
                color: onPrimary,
                child: Row(children: [
                  Container(
                      height: 600,
                      width: widget.swidth * 0.33,
                      padding: const EdgeInsets.only(left: 90, top: 70),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('OBAMA', style: textTheme.bodySmall),
                            Container(height: 15),
                            Container(height: 4, width: 35, color: Colors.blue),
                            Container(height: 20),
                            SizedBox(
                                height: 100,
                                child: Text('Texto',
                                    style: textTheme.displayMedium)),
                            Container(height: 20),
                            SocialMedia(Colors.grey),
                            Container(height: 35),
                            Text('NOSSOS SERVIÇOS', style: textTheme.bodySmall),
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
                            Text('LINKS ADICIONAIS',
                                style: textTheme.bodySmall),
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
                            Text('FALE CONOSCO', style: textTheme.bodySmall),
                            Container(height: 15),
                            Container(height: 4, width: 35, color: Colors.blue),
                            Container(height: 20),
                            SizedBox(
                                height: 60,
                                width: 300,
                                child: Text(
                                    'Av. Cap. Mor Gouveia, 3000 - Lagoa Nova, Natal - RN, 59078-970',
                                    style: textTheme.displayMedium)),
                            Container(height: 20),
                            SizedBox(
                                height: 40,
                                width: 300,
                                child: TextField(
                                    style: textTheme.displaySmall,
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
                                        contentPadding: EdgeInsets.all(5.0),
                                        filled: true,
                                        fillColor: background))),
                            Container(
                                height: 40,
                                width: 40,
                                color: CoresPersonalizadas.azulObama,
                                child: TextButton(
                                    onPressed: () {
                                      launchUrl(emailLaunchUri);
                                    },
                                    child: const Icon(Icons.mail,
                                        color: background, size: 16.0)))
                          ]))
                ])),
            Container(
                height: 50,
                width: widget.swidth * 0.7,
                color: CoresPersonalizadas.azulObama,
                child: Center(
                    child: Text('Obama © Copyright 2022',
                        style: textTheme.bodySmall)))
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
            color: onPrimary,
            padding: const EdgeInsets.only(left: 40, top: 60),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('OBAMA THEME', style: textTheme.bodySmall),
              Container(height: 15),
              Container(height: 4, width: 35, color: Colors.blue),
              Container(height: 20),
              SizedBox(
                  height: 100,
                  child: Text('Texto', style: textTheme.displayMedium)),
              Container(height: 20),
              SocialMedia(Colors.grey),
              Container(height: 45),
              Text('NOSSOS SERVIÇOS', style: textTheme.bodySmall),
              Container(height: 15),
              Container(height: 4, width: 35, color: Colors.blue),
              Container(height: 20),
              for (int i = 0; i < serviceCategories.length; i++) ...{
                footerList(context, serviceCategories, servicePaths, i),
              },
              Container(height: 35),
              Text('LINKS ADICIONAIS', style: textTheme.bodySmall),
              Container(height: 15),
              Container(height: 4, width: 35, color: Colors.blue),
              Container(height: 20),
              for (int i = 0; i < additionalCategories.length; i++) ...{
                footerList(context, additionalCategories, additionalPaths, i),
              },
              Container(height: 35),
              Text('FALE CONOSCO', style: textTheme.bodySmall),
              Container(height: 15),
              Container(height: 4, width: 35, color: Colors.blue),
              Container(height: 20),
              SizedBox(
                  height: 60,
                  width: 300,
                  child: Text(
                      'Av. Cap. Mor Gouveia, 3000 - Lagoa Nova, Natal - RN, 59078-970',
                      style: textTheme.displayMedium)),
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
                              fillColor: background))),
                  Container(
                      height: 40,
                      width: 40,
                      color: CoresPersonalizadas.azulObama,
                      child: TextButton(
                          onPressed: () {
                            launchUrl(emailLaunchUri);
                          },
                          child: const Icon(Icons.mail,
                              color: background, size: 16.0))),
                ],
              ),
            ]),
          ),
          Container(
              height: 50,
              width: widget.swidth,
              color: CoresPersonalizadas.azulObama,
              child: Center(
                  child: Text('Obama © Copyright 2024',
                      style: textTheme.bodySmall)))
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
                size: 30, color: onPrimary),
          ),
        ],
      ),
    ],
  );
}
