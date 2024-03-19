import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obamahome/app/views/blog/components/blog-filters.dart';
import 'package:obamahome/components/bannerSuperior.dart';
import 'package:obamahome/templates/template_basic_col.dart';

import '../../../controllers/blog_controller.dart';
import '../../../models/blog_models.dart';
import '../blog_view.dart';

class BlogTablet extends ConsumerStatefulWidget {
  String newData;
  Key key;
  final double swidth;
  Function(String) updateData;
  BlogTablet(this.newData, this.key, this.swidth, this.updateData);
  @override
  BlogTabletState createState() => BlogTabletState();
}

class BlogTabletState extends ConsumerState<BlogTablet> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;

    return TemplateColumn(children: [
      FutureBuilder<void>(
        future: BlogController().updateBlogContent(ref, widget.newData),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final blogDataList = ref.watch(blogPosts);
            List<BlogModel?> posts = blogDataList;
            return Column(
              children: [
                BannerSuperior(context, "Publicações"),
                Container(
                    padding: const EdgeInsets.only(top: 100, left: 30),
                    width: swidth,
                    child:
                        blogFilters(context, swidth, posts, widget.updateData)),
                if (posts.isEmpty) ...{
                  Container(
                      padding: const EdgeInsets.only(top: 100, right: 15),
                      width: swidth,
                      child: Text(
                        "Perdão, não há nenhum post a ser exibido no momento.",
                      ))
                } else ...{
                  Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: blogListView(context, widget.key, swidth, posts),
                  ),
                },
              ],
            );
          } else if (snapshot.hasError) {
            Container(
                padding: const EdgeInsets.only(top: 100, left: 90, right: 15),
                width: swidth * 0.67,
                child: Text(
                  "Perdão, ocorreu um erro interno.",
                ));
          }
          return Container();
          // return circleLoadSpinner(context);
        },
      )
    ]);
  }
}
