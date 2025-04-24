import 'package:flutter/material.dart';
import 'package:obamahome/components/librasTooltip.dart';
import 'package:obamahome/components/menuClass.dart';
import 'package:obamahome/components/modalSearch.dart';

import '../app/views/search/components/resultsSearch.dart';
import '../utils/app_theme.dart';

class NavMenu extends StatefulWidget {
  final double swidth;
  final double heightBtn;
  final List<ItemValue> itemValues;
  final bool searchAvailable;

  const NavMenu({
    required this.swidth,
    required this.heightBtn,
    required this.itemValues,
    required this.searchAvailable,
  });

  @override
  State<NavMenu> createState() => _NavMenuState();
}

Future searchObject(context, String value) async {
  if (value.isEmpty) {
    showMessage(context);
  } else {
    // Navigator.pushNamed(context, '/objetos-aprendizagem', arguments: value);
    Navigator.popAndPushNamed(context, '/objetos-aprendizagem-nav',
        arguments: value);
  }
}

class _NavMenuState extends State<NavMenu> {
  bool isHovered = false;
  String searchText = '';

  Future registerSearch(context, String value) async {
    setState(() {
      searchText = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    String? currentRoute = ModalRoute.of(context)?.settings.name;
    double swidth = MediaQuery.of(context).size.width;

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: 960,
      ),
      child: MenuBar(children: [
        for (int i = 0; i < widget.itemValues.length; i++) ...{
          if (widget.itemValues[i].subItems.isEmpty) ...{
            Center(
                child: Container(
                    height: 20,
                    padding: EdgeInsets.only(left: 18),
                    child: Material(
                      color: background,
                      child: InkWell(
                        onHover: (value) {
                          setState(() {
                            widget.itemValues.forEach((element) {
                              element.itemHover = false;
                            });
                            widget.itemValues[i].itemHover = value;
                          });
                        },
                        hoverColor: background,
                        highlightColor: background,
                        onTap: () {
                          if (widget.itemValues[i].action != null) {
                            widget.itemValues[i].action!();
                          } else {
                            Navigator.popAndPushNamed(
                              context,
                              widget.itemValues[i].path[0],
                              arguments: "",
                            );
                          }
                        },
                        // teste tooltip
                        child: LibrasTooltip(
                          imageGif: widget.itemValues[i].gifPath!,
                          subItemsImageGif: null,
                          isHover: widget.itemValues[i].itemHover,
                          isHoverSubItems: null,
                          content: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(widget.itemValues[i].name.toUpperCase(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: widget.itemValues[i].path[0] ==
                                            currentRoute
                                        ? primary
                                        : widget.itemValues[i].itemHover
                                            ? primary
                                            : onPrimary)),
                          ),
                        ),
                      ),
                    ))),
          } else ...{
            LibrasTooltip(
              imageGif: widget.itemValues[i].gifPath!,
              subItemsImageGif: widget.itemValues[i].subGifPath!,
              isHover: widget.itemValues[i].itemHover,
              isHoverSubItems: widget.itemValues[i].subItemHover,
              content: Padding(
                  padding: EdgeInsets.only(left: 18),
                  child: SubmenuButton(
                    onHover: (value) {
                      setState(() {
                        widget.itemValues.forEach((element) {
                          element.itemHover = false;
                        });
                        widget.itemValues[i].itemHover = value;
                      });
                    },
                    menuStyle: MenuStyle(
                      backgroundColor: WidgetStateProperty.all(background),
                    ),
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(background),
                      foregroundColor: WidgetStateProperty.all(
                          widget.itemValues[i].path.contains(currentRoute)
                              ? primary
                              : widget.itemValues[i].itemHover
                                  ? primary
                                  : onPrimary),
                      textStyle:
                          WidgetStateProperty.all(textTheme.headlineSmall),
                    ),
                    menuChildren: <Widget>[
                      if (i >= 0 && i < widget.itemValues.length) ...{
                        for (var j = 0;
                            j < widget.itemValues[i].subItems.length;
                            j++) ...{
                          Container(
                            decoration: BoxDecoration(
                                border: j == 0
                                    ? Border(
                                        top: BorderSide(
                                            color: surface, width: 3))
                                    : Border(top: BorderSide.none)),
                            child: MenuItemButton(
                              onHover: (value) {
                                setState(() {
                                  widget.itemValues.forEach((element) {
                                    element.itemHover = false;
                                    element.subItemHover.forEach((subItem) {
                                      subItem = false;
                                    });
                                  });
                                  widget.itemValues[i].itemHover = value;
                                  widget.itemValues[i].subItemHover[j] = value;
                                });
                              },
                              style: ButtonStyle(
                                padding: WidgetStatePropertyAll(
                                    EdgeInsets.symmetric(horizontal: 20)),
                                minimumSize:
                                    WidgetStatePropertyAll(Size(250, 44)),
                                backgroundColor:
                                    WidgetStateProperty.all(background),
                                overlayColor: WidgetStateProperty.all(primary),
                                foregroundColor: WidgetStateProperty.all(
                                    widget.itemValues[i].subItemHover[j]
                                        ? background
                                        : onPrimary),
                                textStyle: WidgetStateProperty.all(
                                    textTheme.displaySmall),
                              ),
                              onPressed: () {
                                widget.itemValues[i].subItemHover[j] = false;
                                Navigator.pushNamed(
                                  context, widget.itemValues[i].path[j],
                                );
                              },
                              child: MenuAcceleratorLabel(
                                  widget.itemValues[i].subItems[j]!),
                            ),
                          )
                        }
                      }
                    ],
                    child: MenuAcceleratorLabel(
                        widget.itemValues[i].name.toUpperCase()),
                  )),
            ),
          }
        },
        widget.searchAvailable
            ? Padding(
                padding: const EdgeInsets.only(left: 18),
                child: SizedBox(
                  width: 36,
                  height: 40,
                  child: SearchDialog(
                      swidth: swidth,
                      searchText: searchText,
                      isHovered: isHovered),
                ),
              )
            : SizedBox(),
      ]),
    );
  }
}
