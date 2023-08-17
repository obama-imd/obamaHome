import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:obamahome/components/launchSocialMedia.dart';
import 'package:url_launcher/url_launcher.dart';

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
                            child: TextButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.blue),
                              ),
                              onPressed: () {
                                launchUrl(emailLaunchUri);
                              },
                              child: Row(children: [
                                Container(
                                    padding: EdgeInsets.only(right: 10),
                                    child: Icon(FontAwesomeIcons.envelope,
                                        color: Colors.white, size: 16)),
                                const Text('obama@imd.ufrn.br',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 13.0)),
                              ]),
                            ))
                      ])),
                  const Spacer(),
                  Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                        SocialMedia(Colors.white),
                        Container(
                            margin: EdgeInsets.only(
                                left: 15.0, right: swidth * 0.068),
                            height: 45,
                            width: 160,
                            child: TextButton(
                                onPressed: () {},
                                child: Container(
                                  width: swidth * 0.154,
                                  color: Colors.white,
                                  height: 45,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text('Acesse',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0)),
                                    ],
                                  ),
                                )))
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
                    Padding(
                      padding: EdgeInsets.only(
                          left: swidth * 0.04, right: swidth * 0.04),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                padding: const EdgeInsets.only(top: 10),
                                child: SocialMedia(Colors.white)),
                            Container(
                                height: 55,
                                width: 160,
                                padding: const EdgeInsets.only(top: 10),
                                child: TextButton(
                                    onPressed: () {},
                                    child: Container(
                                      color: Colors.white,
                                      height: 55,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text('Acesse',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16.0)),
                                        ],
                                      ),
                                    ))),
                          ]),
                    )
                  ])),
        ],
      ],
      if (swidth < 900) ...[
        Container(
          color: Colors.blue,
          width: swidth,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            // Container(
            //   child: const Text('HOME',
            //       style: TextStyle(color: Colors.white, fontSize: 20.0)),
            // ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialMedia(Colors.white),
              ],
            ),
            Container(
                height: 45,
                width: 210,
                padding: const EdgeInsets.only(bottom: 10),
                child: TextButton(
                    onPressed: () {},
                    child: Container(
                      color: Colors.white,
                      height: 45,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Acesse',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 16.0)),
                        ],
                      ),
                    )))
          ]),
        )
      ],
    ]);
  }
}

String? encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((MapEntry<String, String> e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}

final Uri emailLaunchUri = Uri(
  scheme: 'mailto',
  path: 'smith@example.com',
  query: encodeQueryParameters(<String, String>{
    'subject': 'Example Subject & Symbols are allowed!',
  }),
);
