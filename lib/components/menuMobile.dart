import 'package:flutter/material.dart';

import '../utils/app_theme.dart';
import 'modalSearch.dart';

menuMobile(context, scaffoldKey, swidth) {
  return SizedBox(
      width: swidth,
      height: 125,
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
        MenuItemButton(
            child: const Icon(Icons.menu, color: onPrimary),
            onPressed: () => scaffoldKey.currentState?.openDrawer()),
        Container(
            width: 240,
            margin: const EdgeInsets.only(right: 15, left: 15),
            child:
                Image.asset('assets/images/logo.png', fit: BoxFit.fitHeight)),
        SizedBox(
          width: 36,
          height: 40,
          child: SearchDialog(swidth: swidth, searchText: '', isHovered: false),
        ),
      ]));
}
