// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:obamahome/app/models/objeto_aprendizagem.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../../components/loadCircle.dart';
import '../../../utils/app_theme.dart';
import '../../../utils/responsivo.dart';
import '../../controllers/search_controller.dart';
import '../../models/pagination_oa_model.dart';
import '../home/components/our_product_item.dart';
import 'responsividade/search_desktop.dart';
import 'responsividade/search_mobile.dart';
import 'responsividade/search_tablet.dart';

class SearchPage extends ConsumerStatefulWidget {
  String termSearched;
  String? queryParams;

  SearchPage({
    Key? key,
    required this.termSearched,
    required this.queryParams,
  }) : super(key: key);

  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends ConsumerState<SearchPage> {
  int selectedPageIndex = 0;
  bool loadObjects = false;
  late TextStyle titleStyle;
  String nivelEnsinoSelected = '0';
  String temaConteudoSelected = '0';

  List<NivelEnsino> niveisEnsino = [];

  void updateData(newData) {
    setState(() {
      widget.termSearched = '$newData';
    });
  }

  void updateDataFromAdvancedSearchPage(newData) {
    setState(() {
      widget.queryParams = newData;
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
  void initState() {
    super.initState();
    waitData();
    activateLoad();
  }

  void activateLoad() {
    setState(() {
      loadObjects = true;
    });
  }

  void waitData() async {
    Future.wait([fetchData("", 0, null)])
        .timeout(Duration(seconds: 5))
        .whenComplete(() => setState(() {
              loadObjects = false;
            }));
    Future.wait([fetchNivelEnsino()])
        .then((data) => setState(() {
              niveisEnsino = data.first;
            }))
        .timeout(Duration(seconds: 5))
        .whenComplete(() => setState(() {
              loadObjects = false;
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Responsivo(
              mobile: SearchMobile(
                  termSearched: widget.termSearched,
                  selectedPageIndex: selectedPageIndex,
                  updateData: updateData,
                  selectedPage: selectedPage,
                  titleStyle: textTheme.headlineSmall!),
              tablet: SearchTablet(
                  termSearched: widget.termSearched,
                  selectedPageIndex: selectedPageIndex,
                  updateData: updateData,
                  selectedPage: selectedPage,
                  titleStyle: textTheme.headlineSmall!),
              desktop: SearchDesktop(
                  termSearched: widget.termSearched,
                  selectedPageIndex: selectedPageIndex,
                  updateData: updateData,
                  queryParams: widget.queryParams ?? '',
                  updateDataFromAdvancedSearchPage:
                      updateDataFromAdvancedSearchPage,
                  selectedPage: selectedPage,
                  titleStyle: textTheme.titleSmall!)),
          if (loadObjects) ...{circleLoadSpinner(context)}
        ],
      ),
    );
  }
}

double calcRowNumbers(double number, double factor) {
  print("check $number, ${number % factor}");
  double newValue = number / factor;
  return (newValue.ceil().toDouble());
}

class SearchPageView extends StatefulWidget {
  String termSearched;
  final String? queryParam;
  final double swidth;
  int selectedPageIndex;
  void Function(int) selectedPage;

  SearchPageView(this.termSearched, this.swidth, this.selectedPageIndex,
      this.selectedPage, this.queryParam);

  @override
  SearchDesktopState createState() => SearchDesktopState();
}

class SearchDesktopState extends State<SearchPageView> {
  Key key = UniqueKey();
  int startValue = 0;
  int endValue = 2;
  int actualPage = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PaginationResponse?>(
        future: fetchData(widget.termSearched, actualPage, widget.queryParam),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final paginationData = snapshot.data;

            if (paginationData == null) {
              return Center(child: Text("No data available"));
            }

            List<Content?> searchResult = [...paginationData.content];
            PaginationInfo pagination = paginationData.paginationInfo;

            int? totalPages = pagination.totalPages;
            int? currentPage = pagination.pageable.pageNumber;

            widget.selectedPageIndex = currentPage;

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
                              image: result?.caminhoImagem ?? "",
                            ),
                          );
                        }).toList(),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (searchResult.length > 5) ...{
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
                            onTap: currentPage > 0
                                ? () {
                                    widget.selectedPage(
                                      currentPage - 1,
                                    );
                                    setState(() {
                                      if (currentPage > 0) {
                                        startValue--;
                                        endValue--;
                                        actualPage--;
                                      }
                                    });
                                  }
                                : null,
                          ),
                        ),
                        for (int i = startValue; i <= endValue; i++) ...{
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
                                  widget.selectedPage(i);
                                  setState(() {
                                    if (i > 0 && i < totalPages - 1) {
                                      startValue = i - 1;
                                      actualPage = i;
                                      endValue = i + 1;
                                    }
                                  });
                                }
                              },
                            ),
                          )
                        },
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
                            onTap: currentPage < totalPages - 1
                                ? () {
                                    widget.selectedPage(
                                      currentPage + 1,
                                    );
                                    setState(() {
                                      if (endValue < totalPages - 1) {
                                        startValue++;
                                        actualPage++;
                                        endValue++;
                                      }
                                    });
                                  }
                                : null,
                          ),
                        ),
                      }
                    ],
                  ),
                  // Container(height:60),
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
