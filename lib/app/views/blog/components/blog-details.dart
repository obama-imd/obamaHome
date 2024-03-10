import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_network/image_network.dart';
import 'package:obamahome/app/views/blog/components/blog-filters.dart';
import 'package:obamahome/components/drawer.dart';
import 'package:obamahome/components/navMenu.dart';

import '../../../../../components/carousel.dart';
import '../../../../../components/footer.dart';
import '../../../../../components/topbar.dart';
import '../../../../components/bannerSuperior.dart';
import '../../../../utils/app_theme.dart';
import '../../../controllers/blog_controller.dart';
import '../../../models/blog_models.dart';

class BlogDetails extends StatelessWidget {
  final int initialPageIndex;
  BlogDetails({Key? key, required this.initialPageIndex}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: MyStatefulWidget(initialPageIndex: initialPageIndex));
  }
}

class MyStatefulWidget extends StatefulWidget {
  final int initialPageIndex;

  const MyStatefulWidget({Key? key, required this.initialPageIndex})
      : super(key: key);

  @override
  State<MyStatefulWidget> createState() =>
      _MyStatefulWidgetState(pageIndex: initialPageIndex);
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int pageIndex;
  _MyStatefulWidgetState({required this.pageIndex});

  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool dataAvailable = true;

  late PageController _pageController;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<dynamic> postsList = [];
  List<dynamic> datas = [];

  List<IconData> shareMedia = [
    FontAwesomeIcons.facebook,
    FontAwesomeIcons.twitter,
    FontAwesomeIcons.googlePlus,
    FontAwesomeIcons.pinterest,
  ];

  Future<void> fetchContent() async {
    final fetchedData = await fetchData('');
    setState(() {
      if (fetchedData.isNotEmpty) {
        dataAvailable = false;
        datas = fetchedData;
        postsList = fetchedData;
      } else {
        dataAvailable = true;
      }
    });
  }

  void updateData(List<dynamic> newData) {
    setState(() {
      datas = newData;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialPageIndex);
    fetchContent();
  }

  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;

    return Scaffold(
        key: scaffoldKey,
        drawer: const drawermenu(),
        body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
                child: Column(children: <Widget>[
              TopBar(swidth),
              if (MediaQuery.of(context).size.width > 1360) ...[
                Container(
                    width: swidth,
                    height: 125,
                    margin: EdgeInsets.only(
                        left: swidth * 0.068, right: swidth * 0.06),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              width: 250,
                              child: Image.asset('assets/images/logo.png',
                                  fit: BoxFit.fitHeight)),
                          NavMenu(
                              swidth: swidth,
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
                                  const Icon(Icons.menu, color: onPrimary),
                              onPressed: () =>
                                  scaffoldKey.currentState?.openDrawer()),
                          Container(
                              width: 280,
                              margin:
                                  const EdgeInsets.only(right: 15, left: 15),
                              child: Image.asset('assets/images/logo.png',
                                  fit: BoxFit.fitHeight)),
                          TextButton(
                              onPressed: () {},
                              child: const Icon(Icons.search,
                                  color: onPrimary, size: 25))
                        ]))
              ],
              BannerSuperior(context, 'Publicações'),
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                if (dataAvailable == true) ...{
                  Container(
                      padding:
                          const EdgeInsets.only(top: 100, left: 90, right: 15),
                      width: swidth * 0.67,
                      child: Text(
                          "Perdão, não há nenhum post a ser exibido no momento.", )),
                } else ...{
                  Container(
                    padding:
                        const EdgeInsets.only(top: 100, left: 90, right: 15),
                    width: swidth * 0.67,
                    height: 1400,
                    child: PageView.builder(
                      controller: _pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: datas.length,
                      itemBuilder: (BuildContext context, int index) {
                        final item = datas[index];

                        String imagePath = extractImagePath(item['content']);

                        final prevItem = index > 0 ? datas[index - 1] : null;
                        final nextItem =
                            index < datas.length - 1 ? datas[index + 1] : null;

                        String previmagePath = prevItem != null
                            ? extractImagePath(prevItem['content'])
                            : "";
                        String nextimagePath = nextItem != null
                            ? extractImagePath(nextItem['content'])
                            : "";

                        String formattedDate =
                                convertDate(item['published_date']);

                        return SizedBox(
                          height: 1400,
                          width: swidth * .6,
                          child: Column(children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 30),
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                color: Colors.blue,
                                width: 8,
                              ))),
                              child: ImageNetwork(
                                  image: imagePath,
                                  width: swidth * .6,
                                  height: 400,
                                  fitAndroidIos: BoxFit.cover,
                                  fitWeb: BoxFitWeb.cover),
                            ),
                            Container(
                                alignment: Alignment.centerLeft,
                                margin: const EdgeInsets.only(bottom: 20),
                                child: Text(item['title'],
                                    style: textTheme.titleSmall)),
                            Row(children: [
                              const Icon(Icons.person,
                                  color: Colors.blue, size: 16),
                              Container(width: 2),
                              Text('Marketing',
                                  style: textTheme.labelSmall),
                              Container(width: 13),
                              const Icon(FontAwesomeIcons.calendarDays,
                                  color: Colors.blue, size: 16),
                              Container(width: 3),
                              Text(formattedDate,
                                  style: textTheme.labelSmall),
                            ]),
                            Container(
                                width: swidth * 0.6,
                                margin:
                                    const EdgeInsets.only(top: 20, bottom: 30),
                                child: Text(item['text'],
                                    style: textTheme.headlineMedium)),
                            Row(children: [
                              Container(),
                              Container(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                     Text('Share:',
                                        style: textTheme.headlineMedium),
                                    Container(width: 5),
                                    SizedBox(
                                      width: 120,
                                      height: 30,
                                      child: GridView.builder(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 4),
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return InkWell(
                                                overlayColor:
                                                    const MaterialStatePropertyAll(
                                                        Colors.transparent),
                                                onTap: () {},
                                                child: SizedBox(
                                                  width: 15,
                                                  height: 15,
                                                  child: Icon(shareMedia[index],
                                                      size: 15,
                                                      color: onPrimary),
                                                ));
                                          }),
                                    )
                                  ])),
                            ]),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  if (index > 0 && previmagePath != "") ...{
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ImageNetwork(
                                            image: previmagePath,
                                            width: 150,
                                            height: 100),
                                        TextButton(
                                          onPressed: () {
                                            if (_pageController.hasClients) {
                                              _pageController.animateToPage(
                                                index - 1,
                                                duration: const Duration(
                                                    milliseconds: 400),
                                                curve: Curves.easeInOut,
                                              );
                                            }
                                          },
                                          child: Text('< Anterior',
                                              style: textTheme.headlineSmall),
                                        ),
                                        Container(),
                                      ],
                                    ),
                                  },
                                  if (index < datas.length - 1 &&
                                      nextimagePath != "") ...{
                                    Container(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        ImageNetwork(
                                            image: nextimagePath,
                                            width: 150,
                                            height: 100),
                                        TextButton(
                                          onPressed: () {
                                            if (_pageController.hasClients) {
                                              _pageController.animateToPage(
                                                index + 1,
                                                duration: const Duration(
                                                    milliseconds: 400),
                                                curve: Curves.easeInOut,
                                              );
                                            }
                                          },
                                          child: Text('Próximo >',
                                              style: textTheme.headlineSmall),
                                        )
                                      ],
                                    ),
                                  }
                                ]),
                          ]),
                        );
                      },
                    ),
                  ),
                },
                Container(
                    padding: const EdgeInsets.only(top: 85.0, left: 15),
                    width: swidth * .33,
                    child: blogFilters(
                        context, swidth, postsList, dataAvailable, updateData)),
              ]),
              Carousel(swidth),
              Footer(swidth),
            ]))));
  }
}

/*
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_network/image_network.dart';
import 'package:obamahome/app/views/blog/components/blog-filters.dart';
import 'package:obamahome/components/drawer.dart';
import 'package:obamahome/components/navMenu.dart';
import 'package:provider/provider.dart';

import '../../../../../components/carousel.dart';
import '../../../../../components/footer.dart';
import '../../../../../components/topbar.dart';
import '../../../../components/bannerSuperior.dart';
import '../../../../utils/app_theme.dart';
import '../../../models/blog_models.dart';
import '../blog_view.dart';

class BlogDetails extends StatelessWidget {
  final int initialPageIndex;
  BlogDetails({Key? key, required this.initialPageIndex}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: MyStatefulWidget(initialPageIndex: initialPageIndex));
  }
}

class MyStatefulWidget extends StatefulWidget {
  final int initialPageIndex;

  const MyStatefulWidget({Key? key, required this.initialPageIndex})
      : super(key: key);

  @override
  State<MyStatefulWidget> createState() =>
      _MyStatefulWidgetState(pageIndex: initialPageIndex);
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int pageIndex;
  _MyStatefulWidgetState({required this.pageIndex});

  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool dataAvailable = false;

  late PageController _pageController;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<dynamic> postsList = [];
  List<dynamic> datas = [];

  // Future<void> fetchContent() async {
  //   final fetchedData = await fetchData('');
  //   setState(() {
  //     if (fetchedData.isNotEmpty) {
  //       dataAvailable = false;
  //       datas = fetchedData;
  //       postsList = fetchedData;
  //     } else {
  //       dataAvailable = true;
  //     }
  //   });
  // }

  void updateData(List<dynamic> newData) {
    setState(() {
      datas = newData;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialPageIndex);
    // fetchContent();
  }

  //  @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   BlogController.updateBlogContent(context);
  // }

  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    final viewModel = Provider.of<BlogViewModel>(context);

    return Consumer<BlogViewModel>(builder: (context, viewModel, child) {
      var posts = viewModel.posts;
      return Scaffold(
          key: scaffoldKey,
          drawer: const drawermenu(),
          body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                  child: Column(children: <Widget>[
                TopBar(swidth),
                if (MediaQuery.of(context).size.width > 1360) ...[
                  Container(
                      width: swidth,
                      height: 125,
                      margin: EdgeInsets.only(
                          left: swidth * 0.068, right: swidth * 0.06),
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
                                margin:
                                    const EdgeInsets.only(right: 15, left: 15),
                                child: Image.asset('assets/images/logo.png',
                                    fit: BoxFit.fitHeight)),
                            TextButton(
                                onPressed: () {},
                                child: const Icon(Icons.search,
                                    color: onPrimary, size: 25))
                          ]))
                ],
                BannerSuperior(context, 'Publicações'),
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  if (dataAvailable == true) ...{
                    Container(
                        padding: const EdgeInsets.only(
                            top: 100, left: 90, right: 15),
                        width: swidth * 0.67,
                        child: Text(
                          "Perdão, não há nenhum post a ser exibido no momento.",
                        )),
                  } else ...{
                    Container(
                        padding: const EdgeInsets.only(
                            top: 100, left: 90, right: 15),
                        width: swidth * 0.67,
                        height: 1400,
                        child: BlogPageView(swidth, _pageController, posts)),
                  },
                  Container(
                      padding: const EdgeInsets.only(top: 85.0, left: 15),
                      width: swidth * .33,
                      child: blogFilters(
                          context, swidth, posts, dataAvailable, updateData)),
                ]),
                Carousel(swidth),
                Footer(swidth),
              ]))));
    });
  }
}

class BlogPageView extends StatelessWidget {
  final double swidth;
  final PageController _pageController;
  final List<BlogModel> posts;
  BlogPageView(this.swidth, this._pageController, this.posts);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: posts.length,
      itemBuilder: (BuildContext context, int index) {
        final post = posts[index];
        final prevPost = posts[index - 1];
        final nextPost = posts[index + 1];

        final prevItem = index > 0 ? prevPost : null;
        final nextItem = index < posts.length - 1 ? nextPost : null;

        String previmagePath =
            prevItem != null ? extractImagePath(prevItem.content) : "";
        String nextimagePath =
            nextItem != null ? extractImagePath(nextItem.content) : "";
        return SizedBox(
          height: 1400,
          width: swidth * .6,
          child: Column(children: [
            Container(
              margin: const EdgeInsets.only(bottom: 30),
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Colors.blue,
                width: 8,
              ))),
              child: ImageNetwork(
                  image: post.imagePath,
                  width: swidth * .6,
                  height: 400,
                  fitAndroidIos: BoxFit.cover,
                  fitWeb: BoxFitWeb.cover),
            ),
            Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(bottom: 20),
                child: Text(post.title, style: textTheme.titleSmall)),
            Row(children: [
              const Icon(Icons.person, color: Colors.blue, size: 16),
              Container(width: 2),
              Text('Marketing', style: textTheme.labelSmall),
              Container(width: 13),
              const Icon(FontAwesomeIcons.calendarDays,
                  color: Colors.blue, size: 16),
              Container(width: 3),
              Text(post.publishedDate, style: textTheme.labelSmall),
            ]),
            Container(
                width: swidth * 0.6,
                margin: const EdgeInsets.only(top: 20, bottom: 30),
                child: Text(post.text, style: textTheme.headlineMedium)),
            Row(children: [
              Container(),
              Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                    Text('Share:', style: textTheme.headlineMedium),
                    Container(width: 5),
                    SizedBox(
                      width: 120,
                      height: 30,
                      child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4),
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                                overlayColor: const MaterialStatePropertyAll(
                                    Colors.transparent),
                                onTap: () {},
                                child: SizedBox(
                                  width: 15,
                                  height: 15,
                                  child: Icon(shareMedia[index],
                                      size: 15, color: onPrimary),
                                ));
                          }),
                    )
                  ])),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              if (index > 0 && previmagePath != "") ...{
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ImageNetwork(image: previmagePath, width: 150, height: 100),
                    TextButton(
                      onPressed: () {
                        if (_pageController.hasClients) {
                          _pageController.animateToPage(
                            index - 1,
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      child: Text('< Anterior', style: textTheme.headlineSmall),
                    ),
                    Container(),
                  ],
                ),
              },
              if (index < posts.length - 1 &&
                  nextimagePath != "") ...{
                Container(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ImageNetwork(image: nextimagePath, width: 150, height: 100),
                    TextButton(
                      onPressed: () {
                        if (_pageController.hasClients) {
                          _pageController.animateToPage(
                            index + 1,
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      child: Text('Próximo >', style: textTheme.headlineSmall),
                    )
                  ],
                ),
              }
            ]),
          ]),
        );
      },
    );
  }
}

*/