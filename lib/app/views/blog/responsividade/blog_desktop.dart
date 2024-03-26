// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obamahome/app/views/blog/components/blog-filters.dart';
import 'package:obamahome/templates/template_basic_row.dart';

import '../../../controllers/blog_controller.dart';
import '../../../models/blog_models.dart';
import '../blog_view.dart';

class BlogDesktop extends ConsumerStatefulWidget {
  String newData;
  Key key;
  final double swidth;
  Function(String) updateData;
  final TextStyle titleStyle;
  BlogDesktop(
      this.newData, this.key, this.swidth, this.updateData, this.titleStyle);
  @override
  BlogDesktopState createState() => BlogDesktopState();
}

class BlogDesktopState extends ConsumerState<BlogDesktop> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;

    return TemplateRow(children: [
      FutureBuilder<void>(
        future: BlogController().updateBlogContent(ref, widget.newData),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final blogDataList = ref.watch(blogPosts);
            List<BlogModel?> posts = blogDataList;
            return SizedBox(
              width: swidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    constraints: BoxConstraints(maxWidth: 1200),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (posts.isEmpty) ...{
                            Container(
                                padding: const EdgeInsets.only(top: 100, right: 15),
                                width: swidth> 1200 ? 1200 *.7: swidth *.565,
                                child: Text(
                                  "Perdão, não há nenhum post a ser exibido no momento.",
                                ))
                          } else ...{
                            Container(
                              width: swidth> 1200 ? 1200 *.7: swidth *.565,
                              padding: const EdgeInsets.only(top: 100),
                              child: blogListView(context, widget.key, swidth, posts),
                            ),
                          },
                          Container(
                              padding: const EdgeInsets.only(top: 100, left: 30),
                              width: swidth> 1200 ? (1200 *.3): (swidth *.3),
                              child: blogFilters(context, swidth, posts,
                                  widget.updateData, widget.titleStyle)),
                        ]),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            Container(
                padding: const EdgeInsets.only(top: 100, left: 90, right: 15),
                width: swidth> 1200 ? 1200 *.565: swidth *.565,
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
