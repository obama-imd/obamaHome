import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:obamahome/app/views/about-us/constants.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/app_padding.dart';
import '../utils/app_theme.dart';
import '../utils/cores_personalizadas.dart';

class CarouselElements extends StatelessWidget {
  final double swidth;
  final String nameList;
  final String imgList;
  final String jobList;
  final String summaryList;
  final double imgWidth;
  final double imgHeight;

  CarouselElements(
      {super.key,
      required double this.swidth,
      required String this.nameList,
      required String this.imgList,
      required String this.jobList,
      required String this.summaryList,
      required double this.imgWidth,
      required double this.imgHeight});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
          margin: const EdgeInsets.only(left: 40),
          height: imgHeight,
          width: imgWidth,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              image: DecorationImage(
                  alignment: Alignment.topCenter,
                  filterQuality: FilterQuality.low,
                  image: AssetImage(imgList),
                  fit: BoxFit.cover))),
      Container(
          padding: const EdgeInsets.only(left: 20),
          height: 120,
          width: swidth > 760 ? 760 : swidth - 160,
          child: ListView(children: [
            Text(nameList, style: textTheme.displayMedium),
            Container(height: 10),
            Text(jobList, style: textTheme.displaySmall),
            Container(height: 10),
            Text(summaryList, style: textTheme.displaySmall)
          ])),
    ]);
  }
}

class ClipTrapezoid extends CustomClipper<Path> {
  final double multiplyFactor1;
  final double multiplyFactor2;

  ClipTrapezoid(
      {super.reclip,
      required this.multiplyFactor1,
      required this.multiplyFactor2});

  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = 760;

    Path path = Path();

    path.moveTo(0, 0);
    path.lineTo(width * multiplyFactor1, 0);
    path.lineTo(width * multiplyFactor2, height);
    path.lineTo(0, height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class Carousel extends StatefulWidget {
  final double swidth;

  Carousel(this.swidth, {Key? key}) : super(key: key);
  @override
  State<Carousel> createState() => CarouselState();
}

class CarouselState extends State<Carousel> {
  late PageController _pageController;

  final List<String> partnersLogo = [
    'assets/images/ufrn.png',
    'assets/images/imd.png',
    'assets/images/remne.jpg',
    'assets/images/gilfe.png',
    'assets/images/ppgite.png'
  ];

  final List<String> texts = [
    'Quem faz a Plataforma OBAMA acontecer?',
    'Conheça os membros da nossa equipe',
    'QUER LEVAR A OBAMA PARA SUA ESCOLA?',
    'Entre em contato para solicitar formações ou sugerir material para a Plataforma OBAMA.',
    'FALE CONOSCO'
  ];

  final List<String> images = [
    'assets/images/slider1.jpg',
    'assets/images/img2.jpg',
  ];

  final List<double> partnersPadding = [24, 30, 0, 25, 0];

  @override
  void initState() {
    // _pageController = PageController(
    //   initialPage: 0,
    // );
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.swidth > 1300) ...[
          Container(
              height: 875,
              width: widget.swidth,
              child: Stack(children: <Widget>[
                Stack(children: [
                  Container(
                      width: widget.swidth,
                      height: 740,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(images[0]), fit: BoxFit.cover),
                      )),
                  ClipPath(
                      clipper: ClipTrapezoid(
                          multiplyFactor1: .7, multiplyFactor2: .4),
                      child: Container(color: Color.fromRGBO(0, 0, 0, .7))),
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
                                child: Text(texts[0],
                                    style: textTheme.labelMedium)),
                            Container(
                                padding: const EdgeInsets.only(top: 15),
                                child: Text(
                                  texts[1],
                                  style: textTheme.displaySmall,
                                )),
                            Container(height: 20),
                            SizedBox(
                                height: 5.0,
                                width: 82.0,
                                child:
                                    Image.asset(images[1], fit: BoxFit.cover)),
                            SizedBox(height: 40, width: widget.swidth),
                            Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                CarouselSlider(
                                  items: (LeadersTeam + StaffTeam)
                                      .map((member) => Container(
                                            child: CarouselElements(
                                                swidth: widget.swidth,
                                                nameList: member.name,
                                                imgList: member.image,
                                                jobList: member.job,
                                                summaryList: member.summary,
                                                imgWidth: 150,
                                                imgHeight: 150),
                                          ))
                                      .toList(),
                                  options: CarouselOptions(
                                      enlargeCenterPage: true,
                                      autoPlay: true,
                                      viewportFraction: 1,
                                      height: 200),
                                  carouselController: _controller,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Flexible(
                                      child: InkWell(
                                        onTap: () => _controller.previousPage(),
                                        child: Icon(Icons.arrow_back_ios,
                                            color: background, size: 30),
                                      ),
                                    ),
                                    Flexible(
                                      child: InkWell(
                                        onTap: () => _controller.nextPage(),
                                        child: Icon(Icons.arrow_forward_ios,
                                            color: background, size: 30),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 135.0),
                              child: Center(
                                  child: Container(
                                      color: CoresPersonalizadas.azulObama,
                                      height: 150,
                                      width: widget.swidth * 0.9 + 40,
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
                                                  Text(texts[2],
                                                      style: textTheme
                                                          .labelMedium),
                                                  Text(texts[3],
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
                                              texts[4],
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
              width: widget.swidth,
              child:
                  Stack(alignment: Alignment.bottomCenter, children: <Widget>[
                Column(
                  children: [
                    Stack(children: [
                      Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.only(top: 50),
                          height: 650,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(images[0]),
                                fit: BoxFit.cover),
                          )),
                      Container(
                          height: 650, color: Color.fromRGBO(0, 0, 0, .7)),
                    ]),
                  ],
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Container(height: 40),
                  Container(
                      padding: const EdgeInsets.only(left: 40, top: 50),
                      child: Text(texts[0], style: textTheme.displayLarge)),
                  Container(
                      padding: const EdgeInsets.only(top: 15, left: 40),
                      child: Text(
                        texts[1],
                        style: textTheme.displaySmall,
                      )),
                  Container(height: 20),
                  Row(children: [
                    Container(width: 40),
                    SizedBox(
                        height: 5.0,
                        width: 82.0,
                        child: Image.asset(images[1], fit: BoxFit.cover)),
                  ]),
                  // SizedBox(height: 20, width: swidth),
                  Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      CarouselSlider(
                        items: (LeadersTeam + StaffTeam)
                            .map((member) => Container(
                                  child: CarouselElements(
                                      swidth: widget.swidth,
                                      nameList: member.name,
                                      imgList: member.image,
                                      jobList: member.job,
                                      summaryList: member.summary,
                                      imgWidth: 120,
                                      imgHeight: 120),
                                ))
                            .toList(),
                        options: CarouselOptions(
                            enlargeCenterPage: true,
                            aspectRatio: 4/3,
                            autoPlay: true,
                            viewportFraction: 1,
                            height: 200),
                        carouselController: _controller,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Flexible(
                              child: InkWell(
                                onTap: () => _controller.previousPage(),
                                child: Icon(Icons.arrow_back_ios,
                                    color: background, size: 35),
                              ),
                            ),
                            Flexible(
                              child: InkWell(
                                onTap: () => _controller.nextPage(),
                                child: Icon(Icons.arrow_forward_ios,
                                    color: background, size: 35),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ]),
                Container(
                    color: CoresPersonalizadas.azulObama,
                    height: 210,
                    width: widget.swidth * 0.95,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(children: [
                            // Container(width: 15),
                            SizedBox(
                                width: widget.swidth * 0.15,
                                height: 100,
                                child: Icon(
                                  Icons.phone,
                                  size: 40,
                                  color: background,
                                )),
                            SizedBox(
                                width: widget.swidth * 0.75,
                                // height: 100,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(texts[2],
                                          style: textTheme.displayMedium),
                                      Text(texts[3],
                                          style: textTheme.displaySmall)
                                    ]))
                          ]),
                          Container(width: widget.swidth * 0.25, height: 10),
                          TextButton(
                              style: ButtonStyle(
                                fixedSize:
                                    MaterialStatePropertyAll(Size(150, 50)),
                                backgroundColor:
                                    MaterialStatePropertyAll(onPrimary),
                                overlayColor:
                                    MaterialStatePropertyAll(onPrimary),
                              ),
                              onPressed: openContactUsForm,
                              child: Text(
                                texts[4],
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
          SizedBox(width: widget.swidth * 0.9, height: 40),
          SizedBox(
              width: widget.swidth * 0.8,
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
