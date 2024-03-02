import 'package:flutter/material.dart';

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
                style: Theme.of(context).textTheme.titleLarge!)),
        if (subtitle != '') ...{
          Padding(
            padding: EdgeInsets.only(bottom: 22.0),
            child: Text(subtitle,
              style: Theme.of(context).textTheme.titleMedium!)),
        },
        Container(
            height: 5.0,
            width: 82.0,
            child: Image.asset('assets/images/img2.jpg', fit: BoxFit.cover)),
      ],
    );
  }
}
