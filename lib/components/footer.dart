import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latlong2/latlong.dart';

import '../components/launchSocialMedia.dart';

// ignore: must_be_immutable
class Footer extends StatelessWidget {
  double swidth;

  Footer(this.swidth, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      if (swidth > 700) ...[
        Container(
            child: Row(children: [
          Container(
              height: 700,
              width: swidth * 0.3,
              color: Colors.grey,
              // padding: const EdgeInsets.all(5),
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
                            const SizedBox(
                                height: 4,
                                width: 35,
                                child: DecoratedBox(
                                    decoration:
                                        BoxDecoration(color: Colors.blue))),
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
                                color: Colors.blue,
                                child: TextButton(
                                    onPressed: () {},
                                    child: const Icon(Icons.mail,
                                        color: Colors.white, size: 16.0)))
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
            padding: const EdgeInsets.only(left: 40, top: 60),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                      decoration: BoxDecoration(color: Colors.blue))),
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
              const SizedBox(
                  height: 4,
                  width: 35,
                  child: DecoratedBox(
                      decoration: BoxDecoration(color: Colors.blue))),
              Container(height: 20),
              TextButton(
                  onPressed: () {},
                  child: const Text('> Data revovery',
                      style: TextStyle(color: Colors.grey, fontSize: 14))),
              Container(height: 5),
              TextButton(
                  onPressed: () {},
                  child: const Text('> Computer repair',
                      style: TextStyle(color: Colors.grey, fontSize: 14))),
              Container(height: 5),
              TextButton(
                  onPressed: () {},
                  child: const Text('> Mobile service',
                      style: TextStyle(color: Colors.grey, fontSize: 14))),
              Container(height: 5),
              TextButton(
                  onPressed: () {},
                  child: const Text('> Network solutions',
                      style: TextStyle(color: Colors.grey, fontSize: 14))),
              Container(height: 5),
              TextButton(
                  onPressed: () {},
                  child: const Text('> Technical support',
                      style: TextStyle(color: Colors.grey, fontSize: 14))),
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
                      decoration: BoxDecoration(color: Colors.blue))),
              Container(height: 20),
              TextButton(
                  onPressed: () {},
                  child: const Text('> About us',
                      style: TextStyle(color: Colors.grey, fontSize: 14))),
              Container(height: 5),
              TextButton(
                  onPressed: () {},
                  child: const Text('> Terms and conditions',
                      style: TextStyle(color: Colors.grey, fontSize: 14))),
              Container(height: 5),
              TextButton(
                  onPressed: () {},
                  child: const Text('> Privacy policy',
                      style: TextStyle(color: Colors.grey, fontSize: 14))),
              Container(height: 5),
              TextButton(
                  onPressed: () {},
                  child: const Text('> News',
                      style: TextStyle(color: Colors.grey, fontSize: 14))),
              Container(height: 5),
              TextButton(
                  onPressed: () {},
                  child: const Text('> Contact us',
                      style: TextStyle(color: Colors.grey, fontSize: 14))),
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
                      decoration: BoxDecoration(color: Colors.blue))),
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
                ],
              ),
            ]),
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
    ]);
  }
}
