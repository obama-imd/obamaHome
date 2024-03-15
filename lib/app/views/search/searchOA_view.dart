import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../utils/app_theme.dart';
import '../../../utils/responsivo.dart';
import 'responsividade/search_desktop.dart';
import 'responsividade/search_mobile.dart';
import 'responsividade/search_tablet.dart';

class SearchPage extends StatefulWidget {
  String termSearched;

  SearchPage({
    Key? key,
    required this.termSearched,
  }) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int selectedPageIndex = 0;

  void updateData(newData) {
    setState(() {
      widget.termSearched = newData;
    });
  }

  void selectedPage(int i) {
    if (i != selectedPageIndex) {
      setState() {
        selectedPageIndex = i;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
            body: Responsivo(
                mobile: SearchMobile(
                    termSearched: widget.termSearched,
                    selectedPageIndex: selectedPageIndex,
                    updateData: updateData,
                    selectedPage: selectedPage),
                tablet: SearchTablet(
                    termSearched: widget.termSearched,
                    selectedPageIndex: selectedPageIndex,
                    updateData: updateData,
                    selectedPage: selectedPage),
                desktop: SearchDesktop(
                    termSearched: widget.termSearched,
                    selectedPageIndex: selectedPageIndex,
                    updateData: updateData,
                    selectedPage: selectedPage))));
  }
}

void showMessage(context) {
  showDialog<String>(
      barrierColor: modalBackground,
      context: context,
      builder: (BuildContext context) =>
          Stack(alignment: Alignment.topRight, children: [
            Container(
                color: background,
                width: 60,
                height: 60,
                child: Material(
                  child: InkWell(
                      child: Icon(FontAwesomeIcons.xmark, size: 18),
                      onTap: () => Navigator.pop(context)),
                )),
            AlertDialog(
                backgroundColor: onSecondary,
                content: Text(
                    "Parece que nenhum texto foi inserido na busca, por favor, digite algo e tente de novo.",
                    style: textTheme.displayMedium))
          ]));
}
