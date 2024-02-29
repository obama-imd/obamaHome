import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latlong2/latlong.dart';
import 'package:obamahome/components/cores_personalizadas.dart';

import '../components/launchSocialMedia.dart';

// ignore: must_be_immutable
class Footer extends StatelessWidget {
  double swidth;

  Footer(this.swidth, {super.key});

  List<String> serviceCategories = [
    "> Data recovery",
    "> Computer repair",
    "> Mobile service",
    "> Network solutions",
    "> Technical support",
  ];

  List<String> additionalCategories = [
    "> About us",
    "> Terms and conditions",
    "> Privacy policy",
    "> News",
    "> Contact us",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      if (swidth > 700) ...[
        Container(
            child: Row(children: [
          Container(
              height: 700, width: swidth * 0.3, child: flutterMapArea(context)),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
                height: 650,
                width: swidth * 0.7,
                color: Colors.black,
                child: Row(children: [
                  Container(
                      height: 600,
                      width: swidth * 0.33,
                      padding: const EdgeInsets.only(left: 90, top: 70),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 14))),
                            Container(height: 20),
                            SocialMedia(Colors.grey),
                            Container(height: 35),
                            const Text('SERVICES',
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
                              Container(
                                  height: 7.5 *
                                      (serviceCategories.length).toDouble(),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: Text(
                                          serviceCategories[i],
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 14),
                                        ),
                                      ),
                                      Container(height: 5),
                                    ],
                                  )),
                            }
                          ])),
                  Container(
                      height: 600,
                      width: swidth * 0.35,
                      padding: const EdgeInsets.only(left: 70, top: 70),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('ADDITIONAL LINKS',
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
                              Container(
                                  height: 7.5 *
                                      (serviceCategories.length).toDouble(),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: Text(
                                          additionalCategories[i],
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 14),
                                        ),
                                      ),
                                      Container(height: 5),
                                    ],
                                  )),
                            },
                            Container(height: 35),
                            const Text('CONTACT US',
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
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 14))),
                            Container(height: 20),
                            const SizedBox(
                                height: 40,
                                width: 300,
                                child: TextField(
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none),
                                        hintText: 'E-mail',
                                        contentPadding: EdgeInsets.all(10.0),
                                        filled: true,
                                        fillColor: Colors.white))),
                            Container(
                                height: 40,
                                width: 40,
                                color: CoresPersonalizadas.azulObama,
                                child: TextButton(
                                    onPressed: () {},
                                    child: const Icon(Icons.mail,
                                        color: Colors.white, size: 16.0)))
                          ]))
                ])),
            Container(
                height: 50,
                width: swidth * 0.7,
                color: CoresPersonalizadas.azulObama,
                child: const Center(
                    child: Text('Obama © Copyright 2022',
                        style: TextStyle(color: Colors.white))))
          ])
        ]))
      ] else ...[
        Column(children: [
          Container(height: 200, width: swidth, child: flutterMapArea(context)),
          Container(
            height: 1350,
            width: swidth,
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
              const Text('SERVICES',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
              Container(height: 15),
              Container(height: 4, width: 35, color: Colors.blue),
              Container(height: 20),
              for (int i = 0; i < serviceCategories.length; i++) ...{
                Container(
                    height: 7.5 * (serviceCategories.length).toDouble(),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Text(
                            serviceCategories[i],
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                        ),
                        Container(height: 5),
                      ],
                    )),
              },
              Container(height: 35),
              const Text('ADDITIONAL LINKS',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
              Container(height: 15),
              Container(height: 4, width: 35, color: Colors.blue),
              Container(height: 20),
              for (int i = 0; i < additionalCategories.length; i++) ...{
                Container(
                    height: 7.5 * (serviceCategories.length).toDouble(),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Text(
                            additionalCategories[i],
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                        ),
                        Container(height: 5),
                      ],
                    )),
              },
              Container(height: 35),
              const Text('CONTACT US',
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
                      width: swidth - 120,
                      child: const TextField(
                          // onChanged: () {
                          //   setState(
                          //     String emailContent = ""
                          //   )
                          // },
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
                      color: CoresPersonalizadas.azulObama,
                      child: TextButton(
                          onPressed: () {},
                          child: const Icon(Icons.mail,
                              color: Colors.white, size: 16.0))),
                ],
              ),
            ]),
          ),
          Container(
              height: 50,
              width: swidth,
              color: CoresPersonalizadas.azulObama,
              child: const Center(
                  child: Text('Obama © Copyright 2022',
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
  // return FlutterMap(
  //   options: MapOptions(
  //     initialCenter: LatLng(-5.832006, -35.205471),
  //     initialZoom: 17,
  //     maxZoom: 18,
  //   ),
  //   layers: [
  //     TileLayerOptions(
  //       urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
  //       userAgentPackageName: 'com.example.app',
  //     ),
  //     MarkerLayerOptions(
  //       markers: [
  //         Marker(
  //           point: LatLng(-5.832006, -35.205471),
  //           width: 50,
  //           height: 50,
  //           builder: (context) => const Icon(FontAwesomeIcons.locationDot,
  //               size: 30, color: Colors.black),
  //         ),
  //       ],
  //     ),
  //   ],
  //   nonRotatedChildren: [
  //     AttributionWidget.defaultWidget(
  //       source: 'OpenStreetMap contributors',
  //       onSourceTapped: null,
  //     ),
  //   ],
  // );
}
