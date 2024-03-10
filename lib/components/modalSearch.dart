import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_theme.dart';

Widget searchDialog(
    context, double swidth, String searchText, searchObject, registerSearch) {
  return AlertDialog(
    backgroundColor: onSecondary,
    content: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
          padding: EdgeInsets.only(left: 20),
          width: swidth * .7,
          height: 100,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: swidth * .6,
                child: TextField(
                    style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: background),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: 20),
                        hintText: "Busca de OA",
                        hintStyle: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          color: background,
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: secondary))),
                    onChanged: (value) => registerSearch(value),
                    onSubmitted: (value) {
                      searchObject;
                    }),
              ),
              Container(
                width: 100,
                height: 100,
                child: IconButton(
                  hoverColor: null,
                  highlightColor: null,
                  icon: Icon(CupertinoIcons.search, color: secondary, size: 80),
                  onPressed: () {
                    searchObject;
                  },
                ),
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 25),
              child: Text("Consulte os OA disponíveis no nosso catálogo",
                  style: textTheme.displaySmall),
            ),
          ],
        ),
      ],
    ),
  );
}
