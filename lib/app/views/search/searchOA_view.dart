import 'package:flutter/material.dart';
import 'package:obamahome/app/controllers/search_controller.dart';
import 'package:obamahome/app/views/search/components/advancedSearchOA.dart';
import 'package:obamahome/components/drawer.dart';
import 'package:obamahome/utils/app_theme.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../../components/bannerSuperior.dart';
import '../../../components/carousel.dart';
import '../../../components/footer.dart';
import '../../../components/navMenu.dart';
import '../../../components/topbar.dart';
import '../home/components/our_product_item.dart';

class SearchDesktop extends StatelessWidget {
  final String termSearched;

  const SearchDesktop({
    Key? key,
    required this.termSearched,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyStatefulWidget(termSearched: termSearched),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  final String termSearched;

  const MyStatefulWidget({
    Key? key,
    required this.termSearched,
  }) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _searchController = TextEditingController();

  List<dynamic> searchResult = [];
  bool dataAvailable = true;
  Key key = UniqueKey();
  int? totalPages;
  int? currentPage;
  int? itemsPerPage;
  int? totalElements;

  Future<void> fetchDataAndUpdateState(String item) async {
    (
      List<Map<String, dynamic>>,
      Object?,
      Object?,
      Object?,
      Object?
    ) fetchedData = await fetchData(item);

    totalPages = int.parse(fetchedData.$2.toString());
    totalElements = int.parse(fetchedData.$3.toString());
    currentPage = int.parse(fetchedData.$4.toString());
    itemsPerPage = int.parse(fetchedData.$5.toString());

    if (fetchedData.$1.isEmpty) {
      showDialog<String>(
          barrierColor: modalBackground,
          context: context,
          builder: (BuildContext context) => AlertDialog(
              backgroundColor: onSecondary,
              content:
                  Text("Perdão, nenhum valor correspondente foi encontrado")));
    } else {
      setState(() {
        searchResult = fetchedData.$1;
      });
    }
  }

  int startValue = 0;
  int endValue = 2;

  @override
  void initState() {
    super.initState();
    fetchDataAndUpdateState(widget.termSearched);
  }

  void updateData(newData) {
    setState(() {
      searchResult = newData;
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
    double swidth = MediaQuery.of(context).size.width;
    PageController _pageController = PageController();
    selectedPageIndex = currentPage!;

    void testFunction() {}

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
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 125,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              child: const Icon(Icons.menu, color: onPrimary),
                              onPressed: () =>
                                  scaffoldKey.currentState?.openDrawer()),
                          Container(
                              width: 280,
                              padding:
                                  const EdgeInsets.only(right: 30, left: 30),
                              child: Image.asset('assets/images/logo.png',
                                  fit: BoxFit.fitHeight)),
                        ]))
              ],
              BannerSuperior(context, 'Objetos de Aprendizagem'),
              if (MediaQuery.of(context).size.width > 1000) ...[
                Padding(
                  padding: EdgeInsets.only(
                      top: 100, left: swidth * .068, right: swidth * .068),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(children: [
                        searchResult.isEmpty
                            ? Text('Nenhum resultado não encontrado')
                            : Container(
                                padding: EdgeInsets.only(right: 30),
                                width: (swidth * .576),
                                height: (500 *
                                    (searchResult.length / 3).roundToDouble()),
                                child: PageView.builder(
                                  controller: _pageController,
                                  itemCount: int.parse(totalPages.toString()),
                                  physics: NeverScrollableScrollPhysics(),
                                  onPageChanged: (index) {
                                    setState(() {
                                      currentPage = index;
                                    });
                                  },
                                  itemBuilder: (context, index) {
                                    int startIndex = index *
                                        int.parse(itemsPerPage.toString());
                                    int endIndex = (index + 1) *
                                        int.parse(itemsPerPage.toString());
                                    endIndex = endIndex > searchResult.length
                                        ? searchResult.length
                                        : endIndex;
                                    return ResponsiveGridRow(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          // for (var lista in widget.datas) ...{
                                          for (int i = startIndex;
                                              i < endIndex;
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
                                                  child: OurProductItem(
                                                    title: searchResult[i]
                                                        ["nome"],
                                                    image: searchResult[i]
                                                        ["url"],
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
                            if (searchResult.length > itemsPerPage!) ...{
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
                                            duration:
                                                Duration(milliseconds: 300),
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
                                    color:
                                        selectedPageIndex == i ? primary : null,
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
                                              ? textTheme.bodySmall
                                              : textTheme.displaySmall),
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
                                            duration:
                                                Duration(milliseconds: 300),
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
                        width: (swidth * .288) - 30,
                        child: OAFilters(
                            swidth: swidth,
                            datas: searchResult,
                            dataAvailable: dataAvailable,
                            updateData: updateData),
                      ),
                    ],
                  ),
                ),
                Carousel(swidth),
                Footer(swidth),
              ]
            ])));
  }
}
