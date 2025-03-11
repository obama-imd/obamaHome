// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:obamahome/templates/template_basic_col.dart';

import '../../../../utils/app_padding.dart';
import '../components/resultsSearch.dart';

class SearchTablet extends StatefulWidget {
  String termSearched;
  int selectedPageIndex;
  Function(void) updateData;
  TextStyle titleStyle;

  SearchTablet(
      {Key? key,
      required this.termSearched,
      required this.selectedPageIndex,
      required this.updateData,
      required this.titleStyle})
      : super(key: key);

  @override
  State<SearchTablet> createState() => _SearchTabletState();
}

class _SearchTabletState extends State<SearchTablet> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    return TemplateColumn(children: [
      Container(
          margin: paddingValues("sectionPadding", context),
          child: DisplaySearchResults(
              widget.termSearched, swidth, widget.selectedPageIndex, null)),
      SizedBox(
        height: 65,
      ),
    ]);
  }
}
