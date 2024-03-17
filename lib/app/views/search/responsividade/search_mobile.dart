// ignore_for_file: must_be_immutable, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:obamahome/templates/template_basic_col.dart';

import '../../../../components/bannerSuperior.dart';
import '../searchOA_view.dart';

class SearchMobile extends StatefulWidget {
  String termSearched;
  int selectedPageIndex;
  Function(void) updateData;
  void Function(int) selectedPage;

 SearchMobile(
      {Key? key,
      required this.termSearched,
      required this.selectedPageIndex,
      required this.updateData,
      required this.selectedPage})
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
      BannerSuperior(context, 'Objetos de Aprendizagem'),
      SearchPageView(widget.termSearched, swidth, widget.selectedPageIndex, widget.updateData,
          widget.selectedPage),
    ]);
  }
}
