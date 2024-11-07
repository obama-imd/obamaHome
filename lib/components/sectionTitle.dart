import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SectionTitle extends StatelessWidget {
  String title;
  String subtitle;
  CrossAxisAlignment crossAlignment;

  SectionTitle(this.title, this.subtitle, this.crossAlignment, {super.key});

  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment:
          swidth > 1024 ? crossAlignment : CrossAxisAlignment.center,
      children: [
        Container(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Text(
              title.toUpperCase(),
              style: swidth > 1024
                  ? Theme.of(context).textTheme.titleLarge!
                  : TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
            )),
        if (subtitle != '') ...{
          Padding(
              padding: EdgeInsets.only(bottom: 22.0),
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text(subtitle,
                    textAlign: TextAlign.justify,
                    style: swidth > 1024
                        ? Theme.of(context).textTheme.titleMedium!
                        : TextStyle(color: Colors.grey, fontSize: 16)),
              )),
        },
        Container(
            height: 5.0,
            width: 82.0,
            child: Image.asset('assets/images/img2.jpg', fit: BoxFit.cover)),
      ],
    );
  }
}
