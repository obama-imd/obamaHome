import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obamahome/app/models/blog_models.dart';
import 'package:obamahome/app/models/search_models.dart';
import 'package:obamahome/app/views/home/responsividade/home_desktop.dart';
import 'package:obamahome/app/views/home/responsividade/home_mobile1.dart';
import 'package:obamahome/app/views/home/responsividade/home_tablet.dart';
import 'package:obamahome/components/loadCircle.dart';
import 'package:obamahome/utils/responsivo.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../../components/sectionTitle.dart';
import '../../../utils/app_padding.dart';
import '../../../utils/app_theme.dart';
import '../../controllers/home_controllers.dart';
import 'components/our_product_item.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  final TrackingScrollController _scrollController = TrackingScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  bool loadPosts = false;
  bool loadObjects = false;

  @override
  void initState() {
    super.initState();
    activateLoad();
    waitData(ref);
  }

  void activateLoad() {
    setState(() {
      loadPosts = true;
      loadObjects = true;
    });
  }

  void waitData(ref) {
    Future.wait([fetchPosts(ref), fetchObjects(ref)])
        .timeout(Duration(seconds: 5))
        .whenComplete(() => setState(() {
              loadPosts = false;
              loadObjects = false;
            }));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
            body: Stack(
          children: [
            Responsivo(
                mobile: HomeMobile1(),
                //mobile: HomeMobile( scrollController: _scrollController,),
                tablet: HomeTablet(
                  scrollController: _scrollController,
                ),
                desktop: HomeDesktop(
                  scrollController: _scrollController,
                )),
            if (loadPosts || loadObjects) ...{circleLoadSpinner(context)}
          ],
        )));
  }
}

class OAHome extends ConsumerStatefulWidget {
  final double swidth;
  const OAHome(this.swidth, {super.key});

  @override
  OAHomeState createState() => OAHomeState();
}

class OAHomeState extends ConsumerState<OAHome> {
  Key key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchObjects(ref),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final searchList = ref.watch(searchListHome);
          List<SearchModel?> data = [...searchList];
          return Column(children: [
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
                              horizontal: widget.swidth * .016),
                          child: SectionTitle('Objetos de Aprendizagem', '',
                              CrossAxisAlignment.start),
                        ),
                      ],
                    ),
                  ),
                  ResponsiveGridList(
                      physics: NeverScrollableScrollPhysics(),
                      scroll: false,
                      desiredItemWidth: 237.5,
                      minSpacing: widget.swidth * .016,
                      children: data.map((post) {
                        return Container(
                          alignment: Alignment(0, 0),
                          child: OurProductItem(
                              title: post!.nome, image: post.url),
                        );
                      }).toList()),
                ],
              ),
            )
          ]);
        } else if (snapshot.hasError) {
          Container(
              padding: const EdgeInsets.only(top: 100, left: 90, right: 15),
              width: widget.swidth * 0.67,
              child: Text(
                "Perdão, tivemos um problema, tente mais tarde.",
              ));
        }
        return Container();
        // return circleLoadSpinner(context);
      },
    );
  }
}

class BlogHome extends ConsumerStatefulWidget {
  final double swidth;
  const BlogHome(this.swidth, {super.key});

  @override
  BlogHomeState createState() => BlogHomeState();
}

class BlogHomeState extends ConsumerState<BlogHome> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double imageWidth = widget.swidth * .3;
    double imageHeight = 185;

    return FutureBuilder(
      future: fetchPosts(ref),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final blogList = ref.watch(blogPostsHome);
          List<BlogModel?> posts = [...blogList];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: widget.swidth * .057),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              if (posts.isNotEmpty) ...{
                Padding(
                  padding: paddingValues("mainTitle", context),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: widget.swidth * .01),
                        child: SectionTitle('Últimos posts do blog', '',
                            CrossAxisAlignment.start),
                      ),
                    ],
                  ),
                ),
                ResponsiveGridRow(children: [
                  for (var item in posts) ...{
                    ResponsiveGridCol(
                      lg: 4,
                      md: 8,
                      sm: 12,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: widget.swidth * .01),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(item!.imagePath,
                                  height: imageHeight,
                                  width: imageWidth,
                                  fit: BoxFit.cover),
                              Padding(
                                padding: paddingValues("blogPostDate", context),
                                child: Row(
                                  children: [
                                    const Icon(Icons.access_time, size: 16),
                                    Text(item.publishedDate),
                                  ],
                                ),
                              ),
                              Container(
                                margin: paddingValues("blogHomeTitle", context),
                                child: Text(item.title,
                                    style: textTheme.titleSmall!),
                              ),
                              Text(item.text, maxLines: 4),
                            ]),
                      ),
                    )
                  }
                ])
              } else
                ...{}
            ]),
          );
        } else if (snapshot.hasError) {
          Container(
              padding: const EdgeInsets.only(top: 100, left: 90, right: 15),
              width: widget.swidth,
              child: Text(
                "Perdão, tivemos um problema, tente mais tarde.",
              ));
        }
        return circleLoadSpinner(context);
      },
    );
  }
}
