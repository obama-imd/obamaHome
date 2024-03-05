import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

List<String> socialMediaLinks = [
  'https://www.instagram.com/obamaimd/',
  'https://www.youtube.com/channel/UCLsGoIRTGyiUrNW5JdVi9wg'
];
List<IconData> socialMediaIcons = [
  FontAwesomeIcons.instagram,
  FontAwesomeIcons.youtube
];

_launchURL(link) async {
  Uri url = Uri.parse(link); // Parse o link para uma URI
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $link';
  }
}

// ignore: must_be_immutable
class SocialMedia extends StatelessWidget {
  Color colorValue;

  SocialMedia(this.colorValue, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      for (var i = 0; i < socialMediaLinks.length; i++) ...{
        SizedBox(
            child: IconButton(
                //  Ícones redes sociais <-- link
                onPressed: () {
                  _launchURL(socialMediaLinks[i]);
                },
                icon: Icon(socialMediaIcons[i],
                    color: colorValue, size: 16.0))),
        Container(width: 5),
      }
    ]);
  }
}
