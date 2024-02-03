import 'package:flutter/material.dart';

import 'navMenu.dart';

class drawermenu extends StatelessWidget {
  const drawermenu({super.key});

  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    double sheight = MediaQuery.of(context).size.height - 81;
    return Drawer(
        width: swidth * 0.3,
        child: Container(
          padding: EdgeInsets.only(top: 25),
            child: Column(
              children: [
                NavMenu(swidth: swidth, eixoLista: Axis.vertical, heightBtn: sheight),
              ],
            )));
  }
}
