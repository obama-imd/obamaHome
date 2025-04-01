import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
  String termSearched;
  final String? queryParam;
  final double swidth;
  int selectedPageIndex;

  DisplaySearchResults(
      this.termSearched, this.swidth, this.selectedPageIndex, this.queryParam);

  @override
  SearchResultsState createState() => SearchResultsState();
}

class SearchResultsState extends State<DisplaySearchResults> {
  Key key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PaginationResponse?>(
        future: fetchData(
            widget.termSearched, widget.selectedPageIndex, widget.queryParam),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final paginationData = snapshot.data;

            if (paginationData == null) {
              return Center(child: Text("Sem dados disponíveis"));
            }

            List<Content?> searchResult = [...paginationData.content];
            PaginationInfo pagination = paginationData.paginationInfo;

            int? totalPages = pagination.totalPages;
            int? currentPage = pagination.pageable.pageNumber;

            double rowNumbers = 0;

            if (widget.swidth < 460) {
              rowNumbers = searchResult.length.toDouble();
            } else if (widget.swidth >= 460 && widget.swidth < 680) {
              rowNumbers = calcRowNumbers(searchResult.length.toDouble(), 2);
            } else if (widget.swidth >= 680 && widget.swidth < 900) {
              rowNumbers = calcRowNumbers(searchResult.length.toDouble(), 3);
            } else if (widget.swidth >= 900 && widget.swidth < 1120) {
              rowNumbers = calcRowNumbers(searchResult.length.toDouble(), 4);
            } else if (widget.swidth >= 1120 && widget.swidth < 1200) {
              rowNumbers = calcRowNumbers(searchResult.length.toDouble(), 5);
            } else {
              rowNumbers = calcRowNumbers(searchResult.length.toDouble(), 3);
            }

            return Column(
              children: [
                if (searchResult.isNotEmpty) ...{
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Busca obteve ${pagination.totalElements} resultados", style: textTheme.bodySmall),
                    ],
                  ),
                  Container(
                      constraints: BoxConstraints(minHeight: 370),
                      height: (355 * (rowNumbers)),
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
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (totalPages > 1) ...{
                        if (currentPage > 0) ...{
                          Container(
                            width: 40,
                            height: 40,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: Color.fromRGBO(225, 225, 225, 1.0),
                              ),
                            ),
                            child: InkWell(
                                child: Icon(Icons.navigate_before),
                                onTap: () {
                                  setState(() {
                                    widget.selectedPageIndex = currentPage - 1;
                                  });
                                }),
                          )
                        },
                        for (int i = currentPage - 1;
                            i <= currentPage + 1;
                            i++) ...{
                          if (i >= 0 && i < totalPages) ...{
                            Container(
                              width: 40,
                              height: 40,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                color: widget.selectedPageIndex == i
                                    ? primary
                                    : null,
                                border: Border.all(
                                  width: 1,
                                  color: Color.fromRGBO(225, 225, 225, 1.0),
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: InkWell(
                                child: Center(
                                  child: Text((i + 1).toString(),
                                      style: widget.selectedPageIndex == i
                                          ? textTheme.displaySmall
                                          : textTheme.bodySmall),
                                ),
                                onTap: () {
                                  if ((i) != currentPage) {
                                    setState(() {
                                      if (i >= 0 && i <= totalPages - 1) {
                                        widget.selectedPageIndex = i;
                                      }
                                    });
                                  }
                                },
                              ),
                            )
                          }
                        },
                        if (currentPage < totalPages - 1) ...{
                          Container(
                            width: 40,
                            height: 40,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: Color.fromRGBO(225, 225, 225, 1.0),
                              ),
                            ),
                            child: InkWell(
                                child: Icon(Icons.navigate_next),
                                onTap: () {
                                  setState(() {
                                    widget.selectedPageIndex = currentPage + 1;
                                  });
                                }),
                          ),
                        }
                      }
                    ],
                  ),
                } else ...{
                  Center(child: Text("Nada a exibir no momento")),
                },
              ],
            );
          } else if (snapshot.hasError) {
            Container(
                padding: const EdgeInsets.only(top: 100, left: 90, right: 15),
                width: widget.swidth * 0.67,
                child: Text(
                  "Perdão, houve um erro interno.",
                ));
          }
          return Container();
          // return circleLoadSpinner(context);
        });
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
