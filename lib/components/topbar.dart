import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:obamahome/components/launchSocialMedia.dart';

// ignore: must_be_immutable
class TopBar extends StatelessWidget {
  double swidth;

  TopBar(this.swidth);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      if (swidth > 1150) ...[
        Container(
            color: Colors.blue,
            height: 45.0,
            width: swidth,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: 550,
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
                                      color: Colors.white, fontSize: 13.0)),
                            ]))
                      ])),
                  const Spacer(),
                  Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                        SocialMedia(Colors.white),
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
                    // Container(
                    //   child: const Text('HOME',
                    //       style:
                    //           TextStyle(color: Colors.white, fontSize: 20.0)),
                    // ),
                    Row(children: [
                      Container(width: swidth * 0.07),
                      Container(
                          width: 40,
                          padding: const EdgeInsets.only(top: 10),
                          child: SocialMedia(Colors.white)),
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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            // Container(
            //   child: const Text('HOME',
            //       style: TextStyle(color: Colors.white, fontSize: 20.0)),
            // ),
            Container(
                width: 90,
                padding: const EdgeInsets.only(top: 15),
                child: Column(children: [
                  SocialMedia(Colors.white),
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
                                color: Colors.black, fontSize: 16.0)))))
          ]),
        )
      ],
    ]);
  }
}
