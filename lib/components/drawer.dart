import 'package:flutter/material.dart';

import '../utils/app_theme.dart';
import 'navMenu.dart';

class drawermenu extends StatelessWidget {
  const drawermenu({super.key});

  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;

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
                  if (item.subItems.isNotEmpty) ...{
                    ExpansionTile(
                        title: Text(item.name, style: textTheme.headlineSmall),
                        children: [
                          for (var i = 0; i < item.subItems.length; i++) ...{
                            ListTile(
                                title: InkWell(
                                    child: Text(
                                      item.subItems[i]!, style: textTheme.bodyMedium,
                                    ),
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, item.path[i]);
                                    }))
                          }
                        ]),
                  } else ...{
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, item.path[0]);
                              },
                              child: Text(item.name, style: textTheme.headlineSmall)),
                        ),
                      ],
                    )
                  }
                }
              ],
            )));
  }
}
