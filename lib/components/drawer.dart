import 'package:flutter/material.dart';

import '../utils/app_theme.dart';
import 'navMenu.dart';

class drawermenu extends StatelessWidget {
  const drawermenu({super.key});

  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height - 81;

    late double drawerWidth;

    if (swidth < 600) {
      drawerWidth = swidth * .8;
    } else if (swidth >= 600 && swidth < 900) {
      drawerWidth = swidth * .5;
    } else {
      drawerWidth = swidth * .3;
    }

    return Drawer(
        width: drawerWidth,
        child: Container(
            width: drawerWidth,
            color: background,
            padding: EdgeInsets.only(top: 25),
            child: Column(
              children: [
                for (var item in itemValues) ...{
                  ExpansionTile(title: Text(item.name, style: textTheme.headlineSmall), children: [
                    for (var i = 0; i < item.subItems.length; i++) ...{
                      ListTile(
                          title: InkWell(
                              child: Text(item.subItems[i], style: textTheme.displaySmall),
                              onTap: () {
                                Navigator.pushNamed(context, item.path[i]);
                              }))
                    }
                  ]),
                }
              ],
            )));
  }
}
