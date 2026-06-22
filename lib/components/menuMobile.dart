import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/app_theme.dart';
import 'modalSearch.dart';

menuMobile(context, scaffoldKey, swidth) {
  return SizedBox(
      width: swidth,
      height: 125,
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
        MenuItemButton(
            child: FaIcon(FontAwesomeIcons.bars, color: onPrimary),
            onPressed: () => scaffoldKey.currentState?.openDrawer()),
        Container(
            width: 190,
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
