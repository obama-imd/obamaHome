// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:obamahome/app/views/search/searchOA_view.dart';
import 'package:obamahome/templates/template_basic_col.dart';

import '../../../../utils/app_padding.dart';
import '../components/advancedSearchOA.dart';

class SearchDesktop extends StatefulWidget {
  String termSearched;
  int selectedPageIndex;
  Function(void) updateData;
  void Function(int) selectedPage;
  TextStyle titleStyle;
  List<dynamic> learningLevels;

  SearchDesktop(
      {Key? key,
      required this.termSearched,
      required this.selectedPageIndex,
      required this.updateData,
      required this.selectedPage,
      required this.learningLevels,
      required this.titleStyle})
      : super(key: key);

  @override
  State<SearchDesktop> createState() => _SearchDesktopState();
}

class _SearchDesktopState extends State<SearchDesktop> {
  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    return TemplateColumn(children: [
      Padding(
        padding: EdgeInsets.only(bottom: 100),
      ),
      Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 1200),
          padding: paddingValues("sideMainPadding", context),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: swidth > 1200 ? (1200 * .7) : (swidth * .7),
                child: Column(
                  children: [
                    SearchPageView(
                        widget.termSearched,
                        swidth,
                        widget.selectedPageIndex,
                        widget.updateData,
                        widget.selectedPage),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: SizedBox(
                  width: swidth > 1200 ? (1200 * .3) - 30 : (swidth * .3) - 30,
                  child: OAFilters(
                    swidth: swidth,
                    data: widget.termSearched,
                    updateData: widget.updateData,
                    titleStyle: widget.titleStyle,
                    learningLevels: widget.learningLevels
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
