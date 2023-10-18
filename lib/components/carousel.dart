import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import 'cores_personalizadas.dart';

class Carousel extends StatelessWidget {
  final double swidth;

  Carousel(this.swidth, {super.key});

  final List<String> imageCarousel = [
    'assets/images/client.jpg',
    'assets/images/client.jpg',
    'assets/images/client.jpg',
  ];

  final List<String> titleCarousel = [
    'Example Title',
    'Example Title',
    'Example Title',
  ];

  final List<String> nameCarousel = [
    'Example Name',
    'Example Name',
    'Example Name',
  ];

  final  List<String> summaryCarousel = [
    'Example Summary',
    'Example Summary',
    'Example Summary',
  ];

  final List<String> partnersLogo = [
    'assets/images/ufrn.png',
    'assets/images/imd.png',
    'assets/images/remne.jpg',
    'assets/images/gilfe.png',
    'assets/images/ppgite.png',
  ];

  final List<double> partnersPadding = [24, 25, 0, 25, 0];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (swidth > 1300) ...[
          SizedBox(
              height: 875,
              width: swidth,
              child: Stack(children: <Widget>[
                Column(children: [
                  SizedBox(height: 100, width: swidth),
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
                          padding: const EdgeInsets.only(left: 90, top: 100),
                          child: const Text('What Clients Say?',
                              style: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white))),
                      Container(
                          padding: const EdgeInsets.only(top: 15, left: 90),
                          child: const Text(
                            'Here are testimonials from clients..',
                            style: TextStyle(fontSize: 20, color: Colors.white),
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
                      SizedBox(height: 40, width: swidth),
                      ImageSlideshow(
                        width: 760,
                        height: 240,
                        initialPage: 0,
                        indicatorColor: CoresPersonalizadas.azulObama,
                        indicatorBackgroundColor: Colors.grey,
                        onPageChanged: (value) {
                          print('Page changed: $value');
                        },
                        autoPlayInterval: 3500,
                        isLoop: true,
                        children: [
                          for (int i = 0; i < titleCarousel.length; i++) ...{
                            Row(children: [
                              Container(width: 90),
                              Container(
                                  height: 150,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      image: DecorationImage(
                                          image: AssetImage(imageCarousel[i]),
                                          fit: BoxFit.cover))),
                              Container(width: 20),
                              Container(
                                  padding: const EdgeInsets.only(left: 10),
                                  height: 150,
                                  width: 500,
                                  child: ListView(children: [
                                    Text(titleCarousel[i],
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 18)),
                                    Container(height: 35),
                                    Text(nameCarousel[i],
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                    Container(height: 20),
                                    Text(summaryCarousel[i],
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 18))
                                  ])),
                            ]),
                          },
                        ],
                      ),
                      SizedBox(width: swidth * 0.8, height: 80),
                      Center(
                          child: Container(
                              color: CoresPersonalizadas.azulObama,
                              height: 150,
                              width: swidth * 0.9 + 40,
                              child: Row(children: [
                                Container(width: 30),
                                const SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: Icon(
                                      Icons.phone,
                                      size: 70,
                                      color: Colors.white,
                                    )),
                                const SizedBox(
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
                                                  fontWeight: FontWeight.bold)),
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
                                                      offset: Offset(1.1, 1.1))
                                                ],
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white)))),
                              ]))),
                    ])),
              ])),
          // Container(
          //   margin: EdgeInsets.symmetric(vertical: 50),
          //   width: swidth - 74,
          //   height: 200,
          //   child: GridView.count(
          //     physics: NeverScrollableScrollPhysics(),
          //     crossAxisCount: _LogosResponsivity(
          //         swidth),
          //     crossAxisSpacing: 10, // espaçamento entre itens
          //     children: [
          //       PartnersLogos( 'assets/images/ufrn.png'),
          //       PartnersLogos( 'assets/images/imd.png'),
          //       PartnersLogos( 'assets/images/remne.jpg'),
          //       PartnersLogos( 'assets/images/gilfe.png'),
          //       PartnersLogos( 'assets/images/ufrn.png'),
          //     ],
          //   ),
          Padding(
            padding: EdgeInsets.only(
                top: 50, left: swidth * .05 - 25, right: swidth * .05 - 25),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int i = 0; i < partnersLogo.length; i++) ...{
                    Container(
                        height: 120,
                        width: swidth * 0.18,
                        padding:
                            EdgeInsets.symmetric(vertical: partnersPadding[i]),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 6,
                                color:
                                    const Color.fromARGB(255, 231, 228, 228))),
                        child: Image(
                            image: AssetImage(partnersLogo[i]),
                            fit: BoxFit.contain)),
                  },
                ]),
          )
        ] else ...[
          SizedBox(height: 100, width: swidth),
          SizedBox(
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
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                        style: TextStyle(fontSize: 16, color: Colors.white),
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
                  SizedBox(height: 40, width: swidth),
                  ImageSlideshow(
                    width: swidth,
                    height: 240,
                    initialPage: 0,
                    indicatorColor: CoresPersonalizadas.azulObama,
                    indicatorBackgroundColor: Colors.grey,
                    onPageChanged: (value) {
                      print('Page changed: $value');
                    },
                    autoPlayInterval: 3500,
                    isLoop: true,
                    children: [
                      for (int i = 0; i < titleCarousel.length; i++) ...{
                        Row(children: [
                          Container(
                              margin: const EdgeInsets.only(left: 40),
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  image: DecorationImage(
                                      image: AssetImage(imageCarousel[i]),
                                      fit: BoxFit.cover))),
                          Container(
                              padding: const EdgeInsets.only(left: 30),
                              height: 100,
                              width: swidth - 160,
                              child: ListView(children: [
                                Text(titleCarousel[i],
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 16)),
                                Container(height: 35),
                                Text(nameCarousel[i],
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                Container(height: 20),
                                Text(summaryCarousel[i],
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 16))
                              ])),
                        ]),
                      },
                    ],
                  )
                ])
              ])),
          SizedBox(width: swidth * 0.8, height: 20),
          Center(
              child: Container(
                  color: CoresPersonalizadas.azulObama,
                  height: 180,
                  width: swidth * 0.95,
                  child: Column(children: [
                    Container(width: 30),
                    Row(children: [
                      Container(width: 15),
                      const SizedBox(
                          width: 50,
                          height: 100,
                          child: Icon(
                            Icons.phone,
                            size: 40,
                            color: Colors.white,
                          )),
                      SizedBox(
                          width: swidth * 0.7,
                          height: 100,
                          child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                        color: Colors.white, fontSize: 12))
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
                                    shadows: [Shadow(offset: Offset(1.1, 1.1))],
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white)))),
                  ]))),
          SizedBox(width: swidth * 0.9, height: 40),
          SizedBox(
              width: swidth * 0.8,
              child: Center(
                  child: Column(children: [
                for (int i = 0; i < partnersLogo.length; i++) ...{
                  Container(
                      height: 150,
                      width: 350,
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: EdgeInsets.all(partnersPadding[i]),
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 6,
                              color: const Color.fromARGB(255, 231, 228, 228))),
                      child: Image(
                          image: AssetImage(partnersLogo[i]),
                          fit: BoxFit.contain)),
                }
              ])))
        ],
        Container(height: 60),
      ],
    );
  }
}
