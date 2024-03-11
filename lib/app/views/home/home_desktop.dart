import 'package:flutter/material.dart';
import 'package:obamahome/components/drawer.dart';
import 'package:obamahome/components/simpleRow.dart';
import 'package:obamahome/utils/cores_personalizadas.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../../components/carousel.dart';
import '../../../components/footer.dart';
import '../../../components/menuMobile.dart';
import '../../../components/navMenu.dart';
import '../../../components/sectionTitle.dart';
import '../../../components/topbar.dart';
import '../../../utils/app_theme.dart';
import 'components/our_product_item.dart';
import 'constants.dart';
import 'home_view.dart';

class HomeDesktop extends StatelessWidget {
  final TrackingScrollController scrollController;
  final bool postAvailable;
  final bool objectAvailable;
  final List<dynamic> posts;
  final List<dynamic> objects;

  const HomeDesktop({
    required this.scrollController,
    required this.postAvailable,
    required this.objectAvailable,
    required this.posts,
    required this.objects,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyStatefulWidget(
          scrollController: scrollController,
          postAvailable: postAvailable,
          objectAvailable: objectAvailable,
          posts: posts,
          objects: objects),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  final TrackingScrollController scrollController;
  final bool postAvailable;
  final bool objectAvailable;
  final List<dynamic> posts;
  final List<dynamic> objects;

  const MyStatefulWidget({
    required this.scrollController,
    required this.postAvailable,
    required this.objectAvailable,
    required this.posts,
    required this.objects,
    Key? key,
  }) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double paddingCard = MediaQuery.of(context).size.width * .025;
    double swidth = MediaQuery.of(context).size.width;

    return Scaffold(
        key: scaffoldKey,
        drawer: const drawermenu(),
        body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(children: <Widget>[
              TopBar(swidth),

              if (swidth >= 1360) ...[
                Padding(
                  padding: paddingValues("sideMainPadding", context),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: paddingValues("logo", context),
                          child: SizedBox(
                              width: 250,
                              child: Image.asset('assets/images/logo.png',
                                  fit: BoxFit.fitHeight)),
                        ),
                        NavMenu(swidth: swidth, heightBtn: 50),
                      ]),
                ),
              ] else ...[
                menuMobile(context, scaffoldKey, swidth),
              ],

              // box com gif da foto tela inicial
              SizedBox(
                  width: swidth,
                  height: 660,
                  // color: Colors.grey,
                  child: Image.asset("assets/images/animate.gif",
                      fit: BoxFit.cover)),

              //abaixo do gif
              Container(
                height: 320,
                width: MediaQuery.of(context).size.width,
                padding: paddingValues("mainTitle", context),
                child: SectionTitle(
                    'Plataforma OBAMA',
                    'Objetos de Aprendizagem para Matemática',
                    CrossAxisAlignment.center),
              ),
              Container(
                  margin: paddingValues("sideMainPadding", context),
                  child: Expanded(
                    child: ResponsiveGridRow(
                      children: [
                        for (int i = 0; i < sectionTitle.length; i++) ...{
                          ResponsiveGridCol(
                            lg: 3,
                            md: 6,
                            xs: 12,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 30),
                              child: ItemProduto("Data Recovery",
                                  "nononon nono nonon non !", "i1.png"),
                            ),
                          ),
                        }
                      ],
                    ),
                  )),
              Container(
                margin: paddingValues("sectionPadding", context),
                color: CoresPersonalizadas.azulObama,
                child: ResponsiveGridRow(children: [
                  ResponsiveGridCol(
                    lg: 8,
                    sm: 12,
                    child: Container(
                        color: const Color.fromARGB(255, 241, 238, 238),
                        padding: paddingValues("sideMainPadding", context),
                        child: Padding(
                          padding: paddingValues("sectionPadding", context),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SectionTitle(
                                    'ABOUT SERVICE',
                                    'Easy and effective way to get your device repaired.',
                                    CrossAxisAlignment.start),
                                Container(
                                    padding: const EdgeInsets.only(top: 60),
                                    child: ResponsiveGridRow(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          for (int i = 0;
                                              i < grid1Title.length;
                                              i++) ...{
                                            ResponsiveGridCol(
                                              lg: 6,
                                              sm: 12,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 100),
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                          height: 100,
                                                          width: 100,
                                                          decoration: BoxDecoration(
                                                              color: Theme.of(
                                                                      context)
                                                                  .primaryColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          100)),
                                                          child: Icon(
                                                              grid1Icon[i],
                                                              size:
                                                                  iconSize2[i],
                                                              color:
                                                                  background)),
                                                      Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  top: 20),
                                                          child: Text(
                                                              grid1Title[i],
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .titleSmall!)),
                                                      Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  top: 20),
                                                          child: Text(
                                                              grid1Content[i],
                                                              style: textTheme
                                                                  .bodySmall))
                                                    ]),
                                              ),
                                            ),
                                          },
                                        ]))
                              ]),
                        )),
                  ),
                ]),
              ),
              if (widget.objectAvailable == false) ...{
                Container(
                  margin: paddingValues("mainTitleBottom", context),
                  child: SectionTitle('OBJETOS DE APRENDIZAGEM',
                      'Mais populares', CrossAxisAlignment.center),
                ),
                // if (MediaQuery.of(context).size.width > 1000) ...[
                Padding(
                  padding: paddingValues("sideHomeCards", context),
                  child: ResponsiveGridRow(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      for (var lista in widget.objects) ...{
                        ResponsiveGridCol(
                          lg: 3,
                          md: 6,
                          xs: 12,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: OurProductItem(
                              title: lista['nome'],
                              image: lista['url'],
                            ),
                          ),
                        ),
                      }
                    ],
                  ),
                ),
              },
              Padding(
                padding: paddingValues("carouselTop", context),
                child: Container(
                  color: CoresPersonalizadas.azulObama,
                  child: ResponsiveGridRow(children: [
                    if (swidth > 992) ...{
                      ResponsiveGridCol(
                        lg: 4,
                        child: Container(),
                      ),
                    },
                    ResponsiveGridCol(
                      lg: 8,
                      sm: 12,
                      child: Container(
                          color: const Color.fromARGB(255, 241, 238, 238),
                          padding: paddingValues("sideMainPadding", context),
                          child: Padding(
                            padding: paddingValues("sectionPadding", context),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SectionTitle(
                                      'OUR FEEDBACK',
                                      'Easy and effective way to get your device repaired.',
                                      CrossAxisAlignment.end),
                                  Container(
                                      padding: const EdgeInsets.only(top: 60),
                                      child: ResponsiveGridRow(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            for (int i = 0;
                                                i < grid2Title.length;
                                                i++) ...{
                                              ResponsiveGridCol(
                                                lg: 6,
                                                sm: 12,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 100),
                                                  child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Container(
                                                            height: 100,
                                                            width: 100,
                                                            decoration: BoxDecoration(
                                                                color: Theme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100)),
                                                            child: Icon(
                                                                grid2Icon[i],
                                                                size: iconSize2[
                                                                    i],
                                                                color:
                                                                    background)),
                                                        Container(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    top: 20),
                                                            child: Text(
                                                                grid2Title[i],
                                                                style: textTheme
                                                                    .titleSmall!)),
                                                        Container(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    top: 20),
                                                            child: Text(
                                                                grid2Content[i],
                                                                style: textTheme
                                                                    .bodySmall))
                                                      ]),
                                                ),
                                              ),
                                            },
                                          ]))
                                ]),
                          )),
                    ),
                  ]),
                ),
              ),
              if (widget.postAvailable == false) ...{
                Padding(
                  padding: paddingValues("sideHomePosts", context),
                  child: Column(
                    children: [
                      Padding(
                        padding: paddingValues("mainTitleBottom", context),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: swidth * .016),
                              child: SectionTitle('Últimos posts do blog', '',
                                  CrossAxisAlignment.start),
                            ),
                          ],
                        ),
                      ),
                      ResponsiveGridList(
                          physics: NeverScrollableScrollPhysics(),
                          scroll: false,
                          desiredItemWidth: swidth * .25,
                          minSpacing: swidth * .016,
                          children: widget.posts.map((post) {
                            return Container(
                              alignment: Alignment(0, 0),
                              child: blogData(context, post),
                            );
                          }).toList()
                          // for (int i = 0; i < widget.posts.length; i++) ...{
                          //   blogData(context, i, widget.posts),
                          // }
                          ),
                    ],
                  ),
                ),
              },
              Carousel(swidth),
              Footer(swidth),
            ])));
  }
}
