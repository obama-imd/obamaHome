import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../utils/app_theme.dart';
import '../../../../utils/cores_personalizadas.dart';

_launchURL(link) async {
  Uri url = Uri.parse(link); // Parse o link para uma URI
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $link';
  }
}

class StaffCard extends StatelessWidget {
  final String staffName;
  final String staffImg;
  final String staffLink;
  final double swidth;

  StaffCard(this.staffName, this.staffImg, this.staffLink, this.swidth,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 10,
      ),
      Material(
        color: terciary,
        child: InkWell(
          onTap: () {},
          mouseCursor: SystemMouseCursors.basic,
          overlayColor:
              const WidgetStatePropertyAll(CoresPersonalizadas.azulObama),
          child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.all(1),
                  width: 271,
                  height: 271,
                  child: Image.asset(staffImg,
                      fit: BoxFit.cover, alignment: Alignment.topCenter)),
              Container(
                width: 271,
                padding: const EdgeInsets.only(top: 30, bottom: 25),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Text(staffName, style: textTheme.bodyLarge),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Tooltip(
                              message: "Currículo Lattes",
                              child: SizedBox(
                                width: 30,
                                height: 30,
                                child: Material(
                                  color: onSecondary,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(100),
                                      onTap: () => _launchURL(staffLink),
                                      child: Image.asset(
                                          "assets/images/icons/lattes.png",
                                          fit: BoxFit.cover,
                                          alignment: Alignment.center,
                                          )),
                                ),
                              ),
                            ),
                          ])
                    ]),
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 22,
      ),
    ]);
  }
}
