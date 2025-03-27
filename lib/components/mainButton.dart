import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Widget mainButton(
    context, String content, String? urlValue , void Function()? onPressed) {
  _launchURL(link) async {
    Uri url = Uri.parse(link);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $link';
    }
  }

  return Expanded(
    child: Container(
      constraints: BoxConstraints(minWidth: 155),
        height: 50,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
        child: TextButton(
            onPressed: () {
              if (urlValue != null) {
                _launchURL(urlValue);
              } else if (onPressed != null) {
                onPressed();
              } else {
              }
            },
            child: Text(content, style: TextStyle(
      color: Colors.white,
      fontSize: 14,
      shadows: [
        Shadow(
          offset: Offset(1, 1),
          color: Color.fromRGBO(0, 0, 0, 0.5),
        )
      ],
    ),))),
  );
}
