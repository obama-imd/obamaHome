import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/app_padding.dart';
import '../utils/app_theme.dart';
import '../utils/cores_personalizadas.dart';

class Carousel extends StatelessWidget {
  final double swidth;

  Carousel(this.swidth, {super.key});

  final List<String> imageCarousel = [
    'assets/images/AmandaMaria.jpg',
    'assets/images/DennysLeite.jpg',
    'assets/images/DenisSilva.jpg',
    'assets/images/LucasToshio.jpg',
    'assets/images/GabrielBarreto.png',
    'assets/images/FláviaViana.jpg',
  ];

  final List<String> titleCarousel = [
    'Amanda Maria',
    'Dennys Maia',
    'Denis Rocha',
    'Lucas Toshio',
    'Gabriel Barreto',
    'Flávia Roldan',
  ];

  final List<String> nameCarousel = [
    'Estudante de Doutorado',
    'Professor',
    'Técnico em Informática para Internet',
    'Estudante de Graduação em TI',
    'Pedagogo',
    'Professora',
  ];

  final List<String> summaryCarousel = [
    'UFRN',
    'IMD/UFRN',
    '',
    'IMD/UFRN',
    'Estudante de Mestrado (PPGITE/UFRN)',
    'CENTRO DE EDUCAÇÃO/UFRN',
  ];

  final List<String> partnersLogo = [
    'assets/images/ufrn.png',
    'assets/images/imd.png',
    'assets/images/remne.jpg',
    'assets/images/gilfe.png',
    'assets/images/ppgite.png'
  ];

  final List<double> partnersPadding = [24, 30, 0, 25, 0];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (swidth > 1300) ...[
          Container(
              height: 875,
              width: swidth,
              child: Stack(children: <Widget>[
                Column(children: [
                  Container(
                      width: swidth,
                      height: 740,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/footer.png'),
                            fit: BoxFit.cover),
                      ))
                ]),
                Center(
                  child: Container(
                      constraints: BoxConstraints(maxWidth: 1200),
                      padding: paddingValues("sideMainPadding", context),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(height: 140),
                            Container(
                                child: Text(
                                    'Quem faz a Plataforma OBAMA acontecer?',
                                    style: textTheme.labelMedium)),
                            Container(
                                padding: const EdgeInsets.only(top: 15),
                                child: Text(
                                  'Conheça os membros da nossa equipe',
                                  style: textTheme.displaySmall,
                                )),
                            Container(height: 20),
                            SizedBox(
                                height: 5.0,
                                width: 82.0,
                                child: Image.asset('assets/images/img2.jpg',
                                    fit: BoxFit.cover)),
                            SizedBox(height: 40, width: swidth),
                            ImageSlideshow(
                              width: 760,
                              height: 240,
                              initialPage: 0,
                              indicatorColor: CoresPersonalizadas.azulObama,
                              indicatorBackgroundColor: Colors.grey,
                              onPageChanged: (value) {},
                              autoPlayInterval: 3500,
                              isLoop: true,
                              children: [
                                for (int i = 0;
                                    i < titleCarousel.length;
                                    i++) ...{
                                  Row(children: [
                                    Container(
                                        height: 150,
                                        width: 150,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    imageCarousel[i]),
                                                fit: BoxFit.cover))),
                                    Container(width: 20),
                                    Container(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        height: 150,
                                        width: 500,
                                        child: ListView(children: [
                                          Text(titleCarousel[i],
                                              style: textTheme.displayMedium),
                                          Container(height: 35),
                                          Text(nameCarousel[i],
                                              style: textTheme.displaySmall),
                                          Container(height: 20),
                                          Text(summaryCarousel[i],
                                              style: textTheme.displaySmall)
                                        ])),
                                  ]),
                                },
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 135.0),
                              child: Center(
                                  child: Container(
                                      color: CoresPersonalizadas.azulObama,
                                      height: 150,
                                      width: swidth * 0.9 + 40,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 30),
                                      child: Row(children: [
                                        const SizedBox(
                                            width: 100,
                                            height: 100,
                                            child: Icon(
                                              Icons.phone,
                                              size: 70,
                                              color: background,
                                            )),
                                        SizedBox(
                                            height: 100,
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                      'QUER LEVAR A OBAMA PARA SUA ESCOLA?',
                                                      style: textTheme
                                                          .labelMedium),
                                                  Text(
                                                      'Entre em contato para solicitar formações ou sugerir material para a Plataforma OBAMA.',
                                                      style: textTheme
                                                          .displayMedium)
                                                ])),
                                        Spacer(),
                                        TextButton(
                                            style: ButtonStyle(
                                              fixedSize:
                                                  MaterialStatePropertyAll(
                                                      Size(150, 50)),
                                              backgroundColor:
                                                  MaterialStatePropertyAll(
                                                      onPrimary),
                                              overlayColor:
                                                  MaterialStatePropertyAll(
                                                      onPrimary),
                                            ),
                                            onPressed: openContactUsForm,
                                            child: Text(
                                              'FALE CONOSCO',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                shadows: [
                                                  Shadow(
                                                    offset: Offset(1, 1),
                                                    color: Color.fromRGBO(
                                                        0, 0, 0, 0.5),
                                                  )
                                                ],
                                              ),
                                            )),
                                      ]))),
                            ),
                          ])),
                ),
              ])),
          Container(
            constraints: BoxConstraints(maxWidth: 1200),
            padding: paddingValues("sideMainPadding", context),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (int i = 0; i < partnersLogo.length; i++) ...{
                    Container(
                        height: 120,
                        width: 230,
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
          SizedBox(
              height: 740,
              width: swidth,
              child:
                  Stack(alignment: Alignment.bottomCenter, children: <Widget>[
                Column(children: [
                  Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.only(top: 50),
                      height: 650,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/footer.png'),
                            fit: BoxFit.cover),
                      ))
                ]),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Container(height: 40),
                  Container(
                      padding: const EdgeInsets.only(left: 40, top: 50),
                      child: Text('Quem faz a Plataforma OBAMA acontecer?',
                          style: textTheme.displayLarge)),
                  Container(
                      padding: const EdgeInsets.only(top: 15, left: 40),
                      child: Text(
                        'Conheça os membros da nossa equipe',
                        style: textTheme.displaySmall,
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
                  // SizedBox(height: 20, width: swidth),
                  ImageSlideshow(
                    width: swidth,
                    height: 210,
                    initialPage: 0,
                    indicatorColor: CoresPersonalizadas.azulObama,
                    indicatorBackgroundColor: Colors.grey,
                    onPageChanged: (value) {},
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
                              padding: const EdgeInsets.only(left: 20),
                              height: 120,
                              width: swidth - 160,
                              child: ListView(children: [
                                Text(titleCarousel[i],
                                    style: textTheme.displayMedium),
                                Container(height: 10),
                                Text(nameCarousel[i],
                                    style: textTheme.displaySmall),
                                Container(height: 10),
                                Text(summaryCarousel[i],
                                    style: textTheme.displaySmall)
                              ])),
                        ]),
                      },
                    ],
                  )
                ]),
                Container(
                    color: CoresPersonalizadas.azulObama,
                    height: 210,
                    width: swidth * 0.95,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Row(children: [
                        // Container(width: 15),
                        SizedBox(
                            width:  swidth * 0.15,
                            height: 100,
                            child: Icon(
                              Icons.phone,
                              size: 40,
                              color: background,
                            )),
                        SizedBox(
                            width: swidth * 0.75,
                            // height: 100,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('QUER LEVAR A OBAMA PARA SUA ESCOLA?',
                                      style: textTheme.displayMedium),
                                  Text(
                                      'Entre em contato para solicitar formações ou sugerir material para a Plataforma OBAMA.',
                                      style: textTheme.displaySmall)
                                ]))
                      ]),
                      Container(width: swidth * 0.25, height: 10),
                      TextButton(
                          style: ButtonStyle(
                            fixedSize: MaterialStatePropertyAll(Size(150, 50)),
                            backgroundColor:
                                MaterialStatePropertyAll(onPrimary),
                            overlayColor: MaterialStatePropertyAll(onPrimary),
                          ),
                          onPressed: openContactUsForm,
                          child: Text(
                            'FALE CONOSCO',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              shadows: [
                                Shadow(
                                  offset: Offset(1, 1),
                                  color: Color.fromRGBO(0, 0, 0, 0.5),
                                )
                              ],
                            ),
                          )),
                    ])),
              ])),
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

  void openContactUsForm() async {
    Uri _url = Uri.parse('https://forms.gle/9bZ8sGSiSERTZXeU9');

    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
