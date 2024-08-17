// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:obamahome/advanced_search/application/study_level_service.dart';
import 'package:obamahome/advanced_search/data/study_levels_controller.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../../components/loadCircle.dart';
import '../../../utils/app_theme.dart';
import '../../../utils/responsivo.dart';
import '../../controllers/search_controller.dart';
import '../../models/pagination_oa_model.dart';
import '../../models/search_models.dart';
import '../home/components/our_product_item.dart';
import 'responsividade/search_desktop.dart';
import 'responsividade/search_mobile.dart';
import 'responsividade/search_tablet.dart';

class SearchPage extends ConsumerStatefulWidget {
  String termSearched;

  SearchPage({
    Key? key,
    required this.termSearched,
  }) : super(key: key);

  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends ConsumerState<SearchPage> {
  int selectedPageIndex = 0;
  bool loadObjects = false;
  late TextStyle titleStyle;

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

  // Future<List<dynamic>> getLevels() async {
  //   // try {
  //   // print("Iniciando getLevels");
  //   List<dynamic> levels = await fetchLevels();
  //   setState() {
  //     learningLevels = levels;
  //   }

  //   print("Níveis recebidos: $learningLevels");
  //   return levels;

  //   // } catch (e) {
  //   //   print('Erro em getLevels: $e');
  //   // }
  // }

  @override
  void initState() {
    super.initState();
    waitData();
    // getLevels();
    activateLoad();
  }

  void activateLoad() {
    setState(() {
      loadObjects = true;
    });
  }

  void waitData() async {
    Future.wait([fetchData("", ref, 0)])
        .timeout(Duration(seconds: 5))
        .whenComplete(() => setState(() {
              loadObjects = false;
            }));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
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
                    selectedPage: selectedPage,
                    titleStyle: textTheme.titleSmall!)),
            if (loadObjects) ...{circleLoadSpinner(context)}
          ],
        ),),);
  }
}

class SearchPageView extends ConsumerStatefulWidget {
  String termSearched;
  final double swidth;
  int selectedPageIndex;
  Function(void) updateData;
  void Function(int) selectedPage;

  SearchPageView(this.termSearched, this.swidth, this.selectedPageIndex,
      this.updateData, this.selectedPage);

  @override
  SearchDesktopState createState() => SearchDesktopState();
}

class SearchDesktopState extends ConsumerState<SearchPageView> {
  final TextEditingController _searchController = TextEditingController();
  Key key = UniqueKey();
  int startValue = 0;
  int endValue = 2;
  int actualPage = 0;

  @override
  Widget build(BuildContext context) {
    // double paddingCard = MediaQuery.of(context).size.width * .02;
    PageController _pageController = PageController();

    return FutureBuilder<void>(
        future: fetchData(widget.termSearched, ref, actualPage),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final paginationData = ref.watch(searchPagination);

            if (paginationData == null) {
              return Center(child: Text("No data available"));
            }

            List<Content?> searchResult = [...paginationData.content];
            PaginationInfo pagination = paginationData.paginationInfo;
            ;

            // for (var bla in searchResult) {
            //   print("json4 => ${bla!.nome}");
            // }

            int? totalPages = pagination.totalPages;
            int? currentPage = pagination.pageable.pageNumber;
            int? itemsPerPage = pagination.pageable.pageSize;

            widget.selectedPageIndex = currentPage;

            double rowNumbers = 0;

            if (widget.swidth < 360) {
              rowNumbers = 12;
            } else if (widget.swidth >= 460 && widget.swidth < 680) {
              rowNumbers = 8;
            } else {
              rowNumbers = 4;
            }

            return Column(
              children: [
                if (searchResult.isNotEmpty) ...{
                  Container(
                      height: (360 * (rowNumbers)),
                      child: ResponsiveGridList(
                        physics: NeverScrollableScrollPhysics(),
                        scroll: false,
                        desiredItemWidth: 200,
                        minSpacing: 20,
                        children: searchResult.map((result) {
                          return Container(
                            alignment: Alignment.center,
                            child: OurProductItem(
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
                                    // _pageController.previousPage(
                                    //   duration: Duration(milliseconds: 300),
                                    //   curve: Curves.easeInOut,
                                    // );
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
                                  // _pageController.jumpToPage(i);
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
                                    // _pageController.nextPage(
                                    //   duration: Duration(milliseconds: 300),
                                    //   curve: Curves.easeInOut,
                                    // );
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
