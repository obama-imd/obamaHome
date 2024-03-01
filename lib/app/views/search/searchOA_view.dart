import 'package:flutter/material.dart';
import 'package:obamahome/app/controllers/search_controller.dart';
import 'package:obamahome/app/views/search/components/advancedSearchOA.dart';
import 'package:obamahome/components/drawer.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../../components/bannerSuperior.dart';
import '../../../components/carousel.dart';
import '../../../components/footer.dart';
import '../../../components/navMenu.dart';
import '../../../components/topbar.dart';
import '../home/components/our_product_item.dart';

class SearchDesktop extends StatelessWidget {
  final List<dynamic> datas;

  const SearchDesktop({
    Key? key,
    required this.datas,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyStatefulWidget(datas: datas),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  final List<dynamic> datas;

  const MyStatefulWidget({
    Key? key,
    required this.datas,
  }) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  // final TextEditingController _searchController = TextEditingController();

  List<dynamic> searchResult = [];
  bool dataAvailable = true;
  Key key = UniqueKey();

  Future<void> fetchDataAndUpdateState() async {
    final fetchedData = await fetchData('');
    setState(() {
      if (fetchedData.isNotEmpty) {
        dataAvailable = false;
        searchResult = fetchedData;
      } else {
        dataAvailable = true;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.datas.isEmpty) {
      fetchDataAndUpdateState();
    } else {
      setState(() {
        searchResult = widget.datas;
      });
    }
  }

  void updateData(newData) {
    setState(() {
      searchResult = newData;
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    double paddingCard = MediaQuery.of(context).size.width * .02;
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
                          NavMenu(
                              swidth: swidth,
                              eixoLista: Axis.horizontal,
                              heightBtn: 50),
                        ])),
              ] else ...[
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 125,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              child:
                                  const Icon(Icons.menu, color: Colors.black),
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
              // if (MediaQuery.of(context).size.width > 1000) ...[
              Padding(
                padding: EdgeInsets.only(
                    top: 100, left: swidth * .048, right: swidth * .068),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: swidth * .65,
                      child: ResponsiveGridRow(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // for (var lista in widget.datas) ...{
                          for (var lista in searchResult) ...{
                            ResponsiveGridCol(
                              lg: 4,
                              md: 6,
                              xs: 12,
                              child: SizedBox(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: paddingCard, vertical: 15),
                                  child: OurProductItem(
                                    title: lista["nome"],
                                    image: lista["url"],
                                  ),
                                ),
                              ),
                            ),
                          },
                        ],
                      ),
                    ),
                    SizedBox(
                      width: swidth * .2,
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
            ])));
  }
}
