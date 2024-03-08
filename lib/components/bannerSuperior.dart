import 'package:flutter/material.dart';

import '../utils/app_theme.dart';

Widget BannerSuperior(context, String pageName) {
  return Container(
      child: Stack(children: <Widget>[
    Container(
        width: MediaQuery.of(context).size.width,
        height: 250,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/img.jpg'), fit: BoxFit.cover),
        )),
    Container(
        width: MediaQuery.of(context).size.width,
        height: 250,
        padding: const EdgeInsets.only(top: 85.0, left: 92.0),
        child: ListView(children: [
          Text(
            pageName,
            style: textTheme.labelLarge,
          ),
          Container(
              child: Row(children: [
            TextButton(
                onPressed: () {},
                child: Text(
                  'Home',
                  style: textTheme.labelSmall,
                )),
            Text(
              '>  ',
               style: textTheme.bodyMedium,
            ),
            Text(
              pageName,
               style: textTheme.displaySmall,
            ),
          ]))
        ]))
  ]));
}
