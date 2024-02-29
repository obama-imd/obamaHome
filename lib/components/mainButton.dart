import 'package:flutter/material.dart';

import '../utils/app_theme.dart';

Widget mainButton(context, content) {
  return Container(
      margin: EdgeInsets.only(top: 50),
      height: 50,
      width: 170,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
      child: TextButton(
          onPressed: () {},
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(primary),
            overlayColor: MaterialStatePropertyAll(Colors.lightBlue),
          ),
          child: Text(content,
              style: TextStyle(
                  shadows: [Shadow(offset: Offset(1.1, 1.1))],
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.white))));
}
