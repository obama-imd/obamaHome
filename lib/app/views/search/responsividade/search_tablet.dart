// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:obamahome/app/views/search/searchOA_view.dart';
import 'package:obamahome/templates/template_basic_col.dart';

import '../../../../components/bannerSuperior.dart';

class SearchTablet extends StatefulWidget {
  String termSearched;
  int selectedPageIndex;
  Function(void) updateData;
  void Function(int) selectedPage;

  SearchTablet(
      {Key? key,
      required this.termSearched,
      required this.selectedPageIndex,
      required this.updateData,
      required this.selectedPage})
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
      BannerSuperior(context, 'Objetos de Aprendizagem'),
      SearchPageView(widget.termSearched, swidth, widget.selectedPageIndex, widget.updateData,
          widget.selectedPage),
    ]);
  }
}
