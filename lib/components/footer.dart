import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latlong2/latlong.dart';
import 'package:obamahome/utils/cores_personalizadas.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/launchSocialMedia.dart';
import '../utils/app_padding.dart';
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
    '/planos-aulas/lista',
    '/blog',
    "/trilhas"
  ];

  List<String> additionalCategories = [
    "> Sobre Nós",
    "> Manuais",
    // "> Terms and conditions",
    // "> Privacy policy",
    // "> News",
    // "> Contact us",
  ];
  List<String> additionalPaths = [
    '/sobre',
    '/manuais',
    //  '',
    //  '',
    //   ''
  ];

  Widget footerList(BuildContext context, List<String> categories,
      List<String> links, int index) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, links[index]);
      },
      child: Text(
        categories[index],
        style: textTheme.bodySmall,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String emailText = "";
    final Uri emailLaunchUri = Uri.parse('https://forms.gle/9bZ8sGSiSERTZXeU9');

    return Column(children: [
      if (widget.swidth > 800) ...[
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
                padding: paddingValues("footer", context),
                child: ResponsiveGridRow(children: [
                  ResponsiveGridCol(
                    sm: 6,
                    child: Container(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          Text('OBAMA', style: textTheme.displaySmall),
                          Container(height: 15),
                          Container(height: 4, width: 35, color: Colors.blue),
                          Container(height: 20),
                          SocialMedia(Colors.grey),
                          Container(height: 35),
                          Text('NOSSOS SERVIÇOS',
                              style: textTheme.displaySmall),
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
                  ),
                  ResponsiveGridCol(
                    sm: 6,
                    child: Container(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          Text('FALE CONOSCO', style: textTheme.displaySmall),
                          Container(height: 15),
                          Container(height: 4, width: 35, color: Colors.blue),
                          Container(height: 20),
                          SizedBox(
                              height: 60,
                              width: 300,
                              child: Text(
                                  'Av. Cap. Mor Gouveia, 3000 - Lagoa Nova, Natal - RN, 59078-970',
                                  style: textTheme.bodySmall)),
                          Container(height: 20),
                          Container(
                              height: 40,
                              width: 40,
                              color: CoresPersonalizadas.azulObama,
                              child: IconButton(
                                  onPressed: () {
                                    launchUrl(emailLaunchUri);
                                  },
                                  icon: const Icon(Icons.mail,
                                      color: background, size: 16.0)))
                        ])),
                  )
                ])),
            Container(
                height: 50,
                width: widget.swidth * 0.7,
                color: CoresPersonalizadas.azulObama,
                child: Center(
                    child: Text('Obama/IMD - UFRN 2024',
                        style: textTheme.displaySmall)))
          ])
        ]))
      ] else ...[
        Column(children: [
          Container(
              height: 200,
              width: widget.swidth,
              child: flutterMapArea(context)),
          Container(
            height: 750,
            width: widget.swidth,
            color: onPrimary,
            padding: const EdgeInsets.only(left: 40, top: 60),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('OBAMA', style: textTheme.displaySmall),
              Container(height: 15),
              Container(height: 4, width: 35, color: Colors.blue),
              Container(height: 20),
              SocialMedia(Colors.grey),
              Container(height: 45),
              Text('NOSSOS SERVIÇOS', style: textTheme.displaySmall),
              Container(height: 15),
              Container(height: 4, width: 35, color: Colors.blue),
              Container(height: 20),
              for (int i = 0; i < serviceCategories.length; i++) ...{
                footerList(context, serviceCategories, servicePaths, i),
              },
              Container(height: 35),
              Text('FALE CONOSCO', style: textTheme.displaySmall),
              Container(height: 15),
              Container(height: 4, width: 35, color: Colors.blue),
              Container(height: 20),
              for (int i = 0; i < additionalCategories.length; i++) ...{
                footerList(context, additionalCategories, additionalPaths, i),
              },
              Container(height: 35),
              SizedBox(
                  height: 60,
                  width: 300,
                  child: Text(
                      'Av. Cap. Mor Gouveia, 3000 - Lagoa Nova, Natal - RN, 59078-970',
                      style: textTheme.bodySmall)),
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
                              hintStyle: textTheme.bodySmall,
                              contentPadding: EdgeInsets.all(10.0),
                              filled: true,
                              fillColor: background))),
                  Container(
                      height: 40,
                      width: 40,
                      color: CoresPersonalizadas.azulObama,
                      child: IconButton(
                          onPressed: () {
                            launchUrl(emailLaunchUri);
                          },
                          icon: const Icon(Icons.mail,
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
                  child: Text('Obama/IMD - UFRN 2024',
                      style: textTheme.displaySmall)))
        ])
      ],
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
