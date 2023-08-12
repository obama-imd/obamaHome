import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

_launchURL() async {
  //   <-- link 1 cabeçalho
  const url = 'https://www.instagram.com/obamaimd/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL1() async {
  //   <-- link 2 cabeçalho
  const url = 'https://www.youtube.com/channel/UCLsGoIRTGyiUrNW5JdVi9wg';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class SocialMedia extends StatelessWidget {
  Color colorValue;

  SocialMedia(this.colorValue);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      SizedBox(
          child: IconButton(
              //  Ícones redes sociais <-- link
              onPressed: _launchURL,
              icon: Icon(FontAwesomeIcons.instagram,
                  color: colorValue, size: 16.0))),
      Container(width: 5),
      SizedBox(
          child: IconButton(
            onPressed: _launchURL1,
            icon:
                Icon(FontAwesomeIcons.youtube, color: colorValue, size: 16.0),
          )),
    ]);
  }
}
