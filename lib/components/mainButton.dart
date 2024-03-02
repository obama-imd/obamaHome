import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/app_theme.dart';

Widget mainButton(context, content, link) {
  _launchURL(link) async {
    Uri url = Uri.parse(link); 
    if (await canLaunch(url.toString())) {
      await launch(url.toString());
    } else {
      throw 'Could not launch $link';
    }
  }

  return Container(
      height: 50,
      width: 170,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
      child: TextButton(
          onPressed: () {
            if (link != "") {
              _launchURL(link);
            }
          },
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(primary),
            overlayColor: MaterialStatePropertyAll(Colors.lightBlue),
          ),
          child: Text(content,
              style: TextStyle(
                  shadows: [Shadow(offset: Offset(1.1, 1.1))],
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.white))));
}
