// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:obamahome/templates/template_basic_col.dart';

import 'package:obamahome/app/views/search/components/advancedSearchOA.dart';

import '../../../../utils/app_padding.dart';
import '../components/resultsSearch.dart';

class SearchDesktop extends StatefulWidget {
  String termSearched;
  String queryParams;
  int selectedPageIndex;
  Function(void) updateData;
  Function(String) updateDataFromAdvancedSearchPage;
  void Function(int) selectedPage;
  TextStyle titleStyle;

  SearchDesktop({
    super.key,
    required this.termSearched,
    required this.selectedPageIndex,
    required this.updateData,
    required this.updateDataFromAdvancedSearchPage,
    required this.selectedPage,
    required this.titleStyle,
    required this.queryParams,
  });

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
                    DisplaySearchResults(
                        widget.termSearched,
                        swidth,
                        widget.selectedPageIndex,
                        widget.selectedPage,
                        widget.queryParams),
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
                    updateData: widget.updateDataFromAdvancedSearchPage,
                    titleStyle: widget.titleStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 65,
      ),
    ]);
  }
}
