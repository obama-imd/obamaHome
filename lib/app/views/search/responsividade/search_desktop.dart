import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obamahome/templates/template_basic_col.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../../../components/bannerSuperior.dart';
import '../../../../components/loadCircle.dart';
import '../../../../utils/app_theme.dart';
import '../../../controllers/search_controller.dart';
import '../../../models/search_models.dart';
import '../../home/components/our_product_item.dart';
import '../components/advancedSearchOA.dart';

class SearchDesktop extends StatefulWidget {
  String termSearched;
  int selectedPageIndex;
  Function(void) updateData;
  void Function(int) selectedPage;

  SearchDesktop(
      {Key? key,
      required this.termSearched,
      required this.selectedPageIndex,
      required this.updateData,
      required this.selectedPage})
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
        child: BannerSuperior(context, 'Objetos de Aprendizagem'),
      ),
      Padding(
        padding: paddingValues("sideMainPadding", context),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: (swidth * .614),
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
                width: (swidth * .25) - 30,
                child: OAFilters(
                    swidth: swidth,
                    data: widget.termSearched,
                    updateData: widget.updateData),
              ),
            ),
          ],
        ),
      ),
    ]);
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

  @override
  Widget build(BuildContext context) {
    double paddingCard = MediaQuery.of(context).size.width * .02;
    PageController _pageController = PageController();

    return FutureBuilder<void>(
        future: SearchOAController()
            .fetchDataAndUpdateState(widget.termSearched, ref),
        builder: (context, snapshot) {
          final paginationData = ref.watch(searchPagination);
          List<SearchResponse?> pagination = [...paginationData];
          int? totalPages = pagination[0]!.totalPages;
          int? currentPage = pagination[0]!.currentPage;
          int? itemsPerPage = pagination[0]!.itemsPerPage;
          // int? totalElements = pagination[0]!.totalElements;
          // selectedPageIndex = currentPage!;
          List<SearchModel?> searchResult = pagination[0]!.content;

          if (snapshot.connectionState == ConnectionState.done) {
            return Column(children: [
              if (searchResult.isNotEmpty) ...{
                Container(
                  height: (500 * (searchResult.length / 3).roundToDouble()),
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: totalPages,
                    physics: NeverScrollableScrollPhysics(),
                    onPageChanged: (index) {
                      setState(() {
                        currentPage = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      // int startIndex = index * itemsPerPage;
                      // int endIndex = (index + 1) * itemsPerPage;
                      // endIndex = endIndex > searchResult.length
                      //     ? searchResult.length
                      //     : endIndex;
                      return ResponsiveGridRow(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // for (var lista in widget.datas) ...{
                            for (int i = 0; i < searchResult.length; i++) ...{
                              ResponsiveGridCol(
                                lg: 4,
                                md: 6,
                                xs: 12,
                                child: SizedBox(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: paddingCard, vertical: 15),
                                    // child: Container(),
                                    child: OurProductItem(
                                      title: searchResult[i]!.nome,
                                      image: searchResult[i]!.url,
                                    ),
                                  ),
                                ),
                              ),
                            }
                          ]);
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (searchResult.length > 10) ...{
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
                          onTap: currentPage! > 0
                              ? () {
                                  _pageController.previousPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                  widget.selectedPage(
                                    startValue + 1,
                                  );
                                  setState(() {
                                    if (startValue > 0) {
                                      startValue--;
                                      endValue--;
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
                            color:
                                widget.selectedPageIndex == i ? primary : null,
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
                                _pageController.jumpToPage(i);
                                widget.selectedPage(i);
                                setState(() {
                                  if (i > 0 && i < totalPages - 1) {
                                    startValue = i - 1;
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
                          onTap: currentPage! < totalPages - 1
                              ? () {
                                  _pageController.nextPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                  widget.selectedPage(
                                    startValue + 1,
                                  );
                                  setState(() {
                                    if (endValue < totalPages - 1) {
                                      startValue++;
                                      endValue++;
                                    }
                                  });
                                }
                              : null,
                        ),
                      ),
                    }
                  ],
                )
              } else ...{
                Container(
                    child: Text(
                  "Perdão, não há nenhum OA correspondente com a sua pesquisa.",
                )),
              }
            ]);
          } else if (snapshot.hasError) {
            Container(
                padding: const EdgeInsets.only(top: 100, left: 90, right: 15),
                width: widget.swidth * 0.67,
                child: Text(
                  "Perdão, houve um erro interno.",
                ));
          }
          return Center(child: circleLoadSpinner(context));
        });
  }
}
