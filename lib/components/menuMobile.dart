import 'package:flutter/material.dart';

import '../utils/app_theme.dart';

Widget menuMobile(context, scaffoldKey) {
  return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 125,
      child: MenuBar(children: [
        MenuItemButton(
            child: const Icon(Icons.menu, color: onPrimary),
            onPressed: () => scaffoldKey.currentState?.openDrawer()),
        Container(
            width: 280,
            margin: const EdgeInsets.only(right: 15, left: 15),
            child:
                Image.asset('assets/images/logo.png', fit: BoxFit.fitHeight)),
        MenuItemButton(
            onPressed: () {},
            child: const Icon(Icons.search, color: onPrimary, size: 25))
      ]));
}
