import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<IconData> SocialMediaLinks = [
  (FontAwesomeIcons.facebook),
  (FontAwesomeIcons.googlePlus),
  (FontAwesomeIcons.twitter),
  (FontAwesomeIcons.linkedin),
  (FontAwesomeIcons.instagram),
];

class StaffCard extends StatelessWidget {
  String staffName;
  String staffImg;
  double swidth;

  StaffCard(this.staffName, this.staffImg, this.swidth);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          width: 270,
          height: 270,
          decoration: BoxDecoration(
              border: Border.all(color: Color.fromARGB(255, 231, 228, 228))),
          child: Image.asset(staffImg, fit: BoxFit.cover)),
      Container(
          width: 272,
          padding: EdgeInsets.only(top: 30, bottom: 25),
          color: Color.fromARGB(255, 231, 228, 228),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(staffName,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  for (int i = 0; i < SocialMediaLinks.length; i++) ...{
                    Container(
                        width: 40,
                        child: TextButton(
                            onPressed: () {},
                            child: Icon(SocialMediaLinks[i],
                                size: 16.0, color: Colors.black))),
                  }
                ])
          ]))
    ]);
  }
}
