import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class SectionTitle extends StatelessWidget {
  String title;
  String subtitle;
  CrossAxisAlignment crossAlignment;

  SectionTitle(this.title, this.subtitle, this.crossAlignment, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAlignment,
      children: [
        Container(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Text(title.toUpperCase(),
                style: GoogleFonts.raleway(
                    textStyle: const TextStyle(
                        fontSize: 35, fontWeight: FontWeight.bold)))),
        if (subtitle != '') ...{
          Text(subtitle,
              style: GoogleFonts.raleway(
                  textStyle:
                      const TextStyle(color: Colors.grey, fontSize: 20))),
        },
        Container(
            height: 27.0,
            width: 82.0,
            padding: const EdgeInsets.only(top: 22.0),
            child: Image.asset('assets/images/img2.jpg', fit: BoxFit.cover)),
      ],
    );
  }
}
