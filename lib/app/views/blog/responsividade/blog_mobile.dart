import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obamahome/app/views/blog/components/blog-filters.dart';
import 'package:obamahome/components/bannerSuperior.dart';
import 'package:obamahome/components/drawer.dart';

import '../../../../components/carousel.dart';
import '../../../../components/footer.dart';
import '../../../../components/navMenu.dart';
import '../../../../components/topbar.dart';
import '../../../../utils/app_padding.dart';
import '../../../../utils/app_theme.dart';
import '../../../controllers/blog_controller.dart';
import '../../../models/blog_models.dart';
import '../blog_view.dart';

// ignore: must_be_immutable
class BlogMobile extends ConsumerStatefulWidget {
  String newData;
  Key key;
  final double swidth;
  Function(String) updateData;
  BlogMobile(this.newData, this.key, this.swidth, this.updateData);

  @override
  BlogPageState createState() => BlogPageState();
}

class BlogPageState extends ConsumerState<BlogMobile> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;

    return FutureBuilder<void>(
      future: BlogController().updateBlogContent(ref, widget.newData),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final blogDataList = ref.watch(blogPosts);
          List<BlogModel?> posts = blogDataList;
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
                                    child: const Icon(Icons.menu,
                                        color: onPrimary),
                                    onPressed: () =>
                                        scaffoldKey.currentState?.openDrawer()),
                                Container(
                                    width: 280,
                                    margin: const EdgeInsets.only(
                                        right: 15, left: 15),
                                    child: Image.asset('assets/images/logo.png',
                                        fit: BoxFit.fitHeight)),
                                TextButton(
                                    onPressed: () {},
                                    child: const Icon(Icons.search,
                                        color: onPrimary, size: 25))
                              ]))
                    ],
                    BannerSuperior(context, 'Publicações'),
                    Padding(
                      padding: paddingValues("sideMainPadding", context),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 100, right: 15),
                              child: blogListView(context, widget.key, swidth, posts),
                            ),
                            Container(
                                padding:
                                    const EdgeInsets.only(top: 85.0, left: 15),
                                width: swidth * .295,
                                child: blogFilters(
                                    context, swidth, posts, widget.updateData)),
                          ]),
                    ),
                    Carousel(swidth),
                    Footer(swidth),
                  ]))));
        } else if (snapshot.hasError) {
          Container(
              padding: const EdgeInsets.only(top: 100, left: 90, right: 15),
              width: swidth * 0.67,
              child: Text(
                "Perdão, não há nenhum post a ser exibido no momento.",
              ));
        }
        return Container();
        // return circleLoadSpinner(context);
      },
    );
  }
}
