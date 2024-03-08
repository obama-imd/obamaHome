import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/app_theme.dart';

Widget mainButton(
    context, String content, String? urlValue, void Function()? onPressed) {
  _launchURL(link) async {
    Uri url = Uri.parse(link);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
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
            if (urlValue != null) {
              _launchURL(urlValue);
            } else if (onPressed != null) {
              onPressed();
            } else {
              print('No action defined for the button');
            }
          },
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(primary),
            overlayColor: MaterialStatePropertyAll(Colors.lightBlue),
          ),
          child: Text(content, style: textTheme.labelMedium)));
}
