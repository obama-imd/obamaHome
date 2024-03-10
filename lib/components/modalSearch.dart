import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/app_theme.dart';
import 'navMenu.dart';

class SearchDialog extends StatefulWidget {
  final double swidth;
  final String searchText;
  bool isHovered;

  SearchDialog(
      {required this.swidth,
      required this.searchText,
      required this.isHovered});

  @override
  State<SearchDialog> createState() => _SearchDialogState();
}

class _SearchDialogState extends State<SearchDialog> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double modalFont = 60;
    double iconSize = 80;
    double searchBarWidth = widget.swidth * .6;

    if (widget.swidth < 1300 && widget.swidth >= 700) {
      modalFont = 40;
      iconSize = 60;
      searchBarWidth = widget.swidth * .85;
    } else if (widget.swidth < 700) {
      modalFont = 20;
      iconSize = 25;
      searchBarWidth = widget.swidth * .95;
    }

    return MenuItemButton(
        onHover: (value) {
          setState(() {
            widget.isHovered = value;
          });
        },
        style: ButtonStyle(
          fixedSize: MaterialStatePropertyAll(Size(36, 40)),
        ),
        child: Icon(CupertinoIcons.search,
            size: 20, color: widget.isHovered ? primary : onPrimary),
        onPressed: () => showDialog(
            barrierColor: modalBackground,
            barrierDismissible: true,
            context: context,
            builder: (BuildContext context) {
              return Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                      color: background,
                      width: 60,
                      height: 60,
                      child: Material(
                        child: InkWell(child: Icon(FontAwesomeIcons.xmark, size: 18),
                        onTap: () => Navigator.pop(context)),
                      )),
                  AlertDialog(
                      backgroundColor: onSecondary,
                      content: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25)),
                            padding: EdgeInsets.only(left: 6),
                            width: widget.swidth,
                            height: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  constraints: BoxConstraints(minWidth: 300),
                                  width: searchBarWidth,
                                  child: TextField(
                                      style: TextStyle(
                                          fontSize: modalFont,
                                          fontWeight: FontWeight.bold,
                                          color: background),
                                      decoration: InputDecoration(
                                          contentPadding:
                                              EdgeInsets.only(bottom: 20),
                                          hintText: "Busca de OA",
                                          hintStyle: TextStyle(
                                            fontSize: modalFont,
                                            fontWeight: FontWeight.bold,
                                            color: background,
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: secondary))),
                                      onChanged: (value) => setState(() {
                                            searchText = value;
                                          }),
                                      onSubmitted: (value) {
                                        searchObject(context, value);
                                      }),
                                ),
                                Container(
                                  width: 100,
                                  height: 100,
                                  child: IconButton(
                                    hoverColor: null,
                                    highlightColor: null,
                                    icon: Icon(CupertinoIcons.search,
                                        color: background, size: iconSize),
                                    onPressed: () {
                                      searchObject(context, searchText);
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, top: 25),
                                child: Text(
                                    "Consulte os OA disponíveis no nosso catálogo",
                                    style: textTheme.displaySmall),
                              ),
                            ],
                          ),
                        ],
                      )),
                ],
              );
            }));
  }
}
