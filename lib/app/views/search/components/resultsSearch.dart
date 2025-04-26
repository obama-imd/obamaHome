import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:obamahome/app/views/search/components/pagination_widget.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../../../utils/app_theme.dart';
import '../../../controllers/search_controller.dart';
import '../../../models/pagination_oa_model.dart';
import '../../home/components/our_product_item.dart';

double calcRowNumbers(double number, double factor) {
  double newValue = number / factor;
  return (newValue.ceil().toDouble());
}

class DisplaySearchResults extends StatefulWidget {
  final String termSearched;
  final String? queryParam;
  final double swidth;
  int selectedPageIndex;

  DisplaySearchResults({
    super.key,
    required this.termSearched,
    required this.swidth,
    required this.selectedPageIndex,
    this.queryParam,
  });

  @override
  State<DisplaySearchResults> createState() => _SearchResultsState();
}

class _SearchResultsState extends State<DisplaySearchResults> {
  Key key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PaginationResponse?>(
      future: fetchData(
        widget.termSearched,
        widget.selectedPageIndex,
        widget.queryParam,
      ),
      builder: (context, snapshot) {
        Widget child;
        if (snapshot.connectionState == ConnectionState.waiting) {
          child = SizedBox(
            height: double.maxFinite,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          child = Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
            child: SizedBox(
              height: double.maxFinite,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error_outline, color: Colors.red, size: 50),
                    SizedBox(height: 10),
                    Text(
                      "Perdão, houve um erro interno.",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          final paginationData = snapshot.data;

          if (paginationData == null || paginationData.content.isEmpty) {
            child = SizedBox(
              height: double.maxFinite,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.content_paste_off_sharp,
                        size: 50, color: Colors.grey),
                    SizedBox(height: 10),
                    Text("Nenhum dado disponível.",
                        style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            );
          } else {
            List<Content?> searchResult = [...paginationData.content];
            PaginationInfo pagination = paginationData.paginationInfo;

            int? totalPages = pagination.totalPages;
            int? currentPage = pagination.pageable.pageNumber;

            double rowNumbers = calcRowNumbers(searchResult.length.toDouble(),
                _getColumnCount(widget.swidth).toDouble());
            child = Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Busca obteve ${pagination.totalElements} resultados",
                        style: textTheme.labelLarge),
                  ],
                ),
                Container(
                  constraints: BoxConstraints(minHeight: 370),
                  height: (365 * rowNumbers),
                  child: ResponsiveGridList(
                    physics: NeverScrollableScrollPhysics(),
                    scroll: false,
                    desiredItemWidth: 200,
                    minSpacing: 20,
                    children: searchResult.map((result) {
                      return Container(
                        alignment: Alignment.center,
                        child: OurProductItem(
                          id: result?.id ?? -1,
                          title: result?.nome ?? "",
                        ),
                      );
                    }).toList(),
                  ),
                ),
                PaginationWidget(
                  totalPages: totalPages,
                  currentPage: currentPage,
                  onPageSelected: (page) {
                    setState(() {
                      widget.selectedPageIndex = page;
                    });
                  },
                  primaryColor: primary,
                  textTheme: textTheme,
                ),
                SizedBox(height: 60),
              ],
            );
          }
        }
        return AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          child: child,
        );
      },
    );
  }

  int _getColumnCount(double width) {
    if (width < 460) return 1;
    if (width < 680) return 2;
    if (width < 900) return 3;
    if (width < 1120) return 4;
    if (width < 1200) return 5;
    return 3;
  }
}

void showMessage(context) {
  showDialog<String>(
    barrierColor: modalBackground,
    context: context,
    builder: (BuildContext context) => Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          color: background,
          width: 60,
          height: 60,
          child: Material(
            child: InkWell(
              child: Icon(FontAwesomeIcons.xmark, size: 18),
              onTap: () => Navigator.pop(context),
            ),
          ),
        ),
        AlertDialog(
          backgroundColor: onSecondary,
          content: Text(
              "Parece que nenhum texto foi inserido na busca, por favor, digite algo e tente de novo.",
              style: textTheme.displayMedium),
        ),
      ],
    ),
  );
}
