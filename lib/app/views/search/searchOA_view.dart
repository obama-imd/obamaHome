import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obamahome/app/controllers/search_controller.dart';
import 'package:obamahome/app/models/search_models.dart';
import 'package:obamahome/components/drawer.dart';
import 'package:obamahome/utils/app_theme.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../../components/bannerSuperior.dart';
import '../../../components/carousel.dart';
import '../../../components/footer.dart';
import '../../../components/menuMobile.dart';
import '../../../components/navMenu.dart';
import '../../../components/topbar.dart';
import '../../../utils/cores_personalizadas.dart';
import '../home/components/our_product_item.dart';
import 'components/advancedSearchOA.dart';

class SearchDesktop extends StatelessWidget {
  String termSearched;

  SearchDesktop({
    Key? key,
    required this.termSearched,
  }) : super(key: key);

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    return Scaffold(
        key: scaffoldKey,
        drawer: const drawermenu(),
        body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(children: <Widget>[
              TopBar(swidth),
              if (swidth >= 1360) ...[
                Container(
                    width: swidth,
                    height: 125,
                    margin: EdgeInsets.only(
                        left: swidth * 0.068, right: swidth * 0.068),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              width: 250,
                              child: Image.asset('assets/images/logo.png',
                                  fit: BoxFit.fitHeight)),
                          NavMenu(swidth: swidth, heightBtn: 50),
                        ])),
              ] else ...[
                menuMobile(context, scaffoldKey, swidth),
              ],
              BannerSuperior(context, 'Objetos de Aprendizagem'),
              SearchPageView(termSearched, swidth),
              Carousel(swidth),
              Footer(swidth),
            ])));
  }
}

class SearchPageView extends ConsumerStatefulWidget {
  String termSearched;
  final double swidth;

  SearchPageView(this.termSearched, this.swidth);

  @override
  SearchDesktopState createState() => SearchDesktopState();
}

class SearchDesktopState extends ConsumerState<SearchPageView> {
  final TextEditingController _searchController = TextEditingController();

  Key key = UniqueKey();
  int startValue = 0;
  int endValue = 2;

  void updateData(newData) {
    setState(() {
      widget.termSearched = newData;
      key = UniqueKey();
    });
  }

  late int selectedPageIndex;

  void selectedPage(int i) {
    if (i != selectedPageIndex) {
      setState() {
        selectedPageIndex = i;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double paddingCard = MediaQuery.of(context).size.width * .02;
    PageController _pageController = PageController();
    selectedPageIndex = 0;

    return FutureBuilder<void>(
        future: SearchOAController().fetchDataAndUpdateState(widget.termSearched, ref),
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
            return Padding(
              padding: EdgeInsets.only(
                  top: 100,
                  left: widget.swidth * .068,
                  right: widget.swidth * .068),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(children: [
                    Container(
                      padding: EdgeInsets.only(right: 30),
                      width: (widget.swidth * .576),
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
                          int startIndex = index * itemsPerPage;
                          int endIndex = (index + 1) * itemsPerPage;
                          endIndex = endIndex > searchResult.length
                              ? searchResult.length
                              : endIndex;
                          return ResponsiveGridRow(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // for (var lista in widget.datas) ...{
                                for (int i = 0;
                                    i < searchResult.length;
                                    i++) ...{
                                  ResponsiveGridCol(
                                    lg: 4,
                                    md: 6,
                                    xs: 12,
                                    child: SizedBox(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: paddingCard,
                                            vertical: 15),
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
                                      selectedPage(
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
                                color: selectedPageIndex == i ? primary : null,
                                border: Border.all(
                                  width: 1,
                                  color: Color.fromRGBO(225, 225, 225, 1.0),
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: InkWell(
                                child: Center(
                                  child: Text((i + 1).toString(),
                                      style: selectedPageIndex == i
                                          ? textTheme.displaySmall
                                          : textTheme.bodySmall),
                                ),
                                onTap: () {
                                  if ((i) != currentPage) {
                                    _pageController.jumpToPage(i);
                                    selectedPage(i);
                                    setState(() {
                                      if (i > 0 && i < totalPages! - 1) {
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
                              onTap: currentPage! < totalPages! - 1
                                  ? () {
                                      _pageController.nextPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.easeInOut,
                                      );
                                      selectedPage(
                                        startValue + 1,
                                      );
                                      setState(() {
                                        if (endValue < totalPages! - 1) {
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
                  ]),
                  SizedBox(
                    width: (widget.swidth * .288) - 30,
                    child: OAFilters(
                        swidth: widget.swidth,
                        data: widget.termSearched,
                        updateData: updateData),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            print("aqui, butto => ${snapshot.error}");
            Container(
                padding: const EdgeInsets.only(top: 100, left: 90, right: 15),
                width: widget.swidth * 0.67,
                child: Text(
                  "Perdão, não há nenhum OA correspondente com a sua pesquisa.",
                ));
          }
          return SizedBox(
            width: 75,
            height: 75,
            child: CircularProgressIndicator(
              color: CoresPersonalizadas.azulObama,
            ),
          );
        });
  }
}

void showMessage(context) {
  showDialog<String>(
      barrierColor: modalBackground,
      context: context,
      builder: (BuildContext context) => AlertDialog(
          backgroundColor: onSecondary,
          content: Text("Perdão, nenhum valor correspondente foi encontrado",
              style: textTheme.displayMedium)));
}
