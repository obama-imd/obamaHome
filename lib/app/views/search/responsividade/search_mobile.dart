// ignore_for_file: must_be_immutable, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:obamahome/templates/template_basic_col.dart';
import 'package:obamahome/utils/app_padding.dart';

import '../searchOA_view.dart';

class SearchMobile extends StatefulWidget {
  String termSearched;
  int selectedPageIndex;
  Function(void) updateData;
  void Function(int) selectedPage;
  TextStyle titleStyle;

  SearchMobile(
      {Key? key,
      required this.termSearched,
      required this.selectedPageIndex,
      required this.updateData,
      required this.selectedPage,
      required this.titleStyle})
      : super(key: key);
  @override
  State<SearchMobile> createState() => _SearchMobileState();
}

class _SearchMobileState extends State<SearchMobile> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    return TemplateColumn(children: [
      Container(
        margin: paddingValues("sectionPadding", context),
        padding: paddingValues("sideMainPadding", context),
        child: ExpansionTile(title: Text("Busca Avançada"), children: [
          // Padding(
          //   padding: paddingValues("fullGrid", context),
          //   child: OAFilters(
          //       swidth: swidth,
          //       data: widget.termSearched,
          //       updateData: widget.updateData,
          //       titleStyle: widget.titleStyle),
          // ),
        ]),
      ),
      SearchPageView(widget.termSearched, swidth, widget.selectedPageIndex,
          widget.updateData, widget.selectedPage),
    ]);
  }
}
