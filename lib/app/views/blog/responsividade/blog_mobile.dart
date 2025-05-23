// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obamahome/app/views/blog/components/blog-filters.dart';
import 'package:obamahome/utils/app_padding.dart';

import '../../../../templates/template_basic_col.dart';
import '../../../controllers/blog_controller.dart';
import '../../../models/blog_models.dart';
import '../blog_view.dart';

class BlogMobile extends ConsumerStatefulWidget {
  String newData;
  Key key;
  final double swidth;
  Function(String) updateData;
  final TextStyle titleStyle;
  BlogMobile(
      this.newData, this.key, this.swidth, this.updateData, this.titleStyle);

  @override
  BlogMobileState createState() => BlogMobileState();
}

class BlogMobileState extends ConsumerState<BlogMobile> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;

    return TemplateColumn(children: [
      FutureBuilder<List<BlogModel?>>(
        future: BlogController().updateBlogContent(widget.newData),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final blogDataList = snapshot.data!;
            List<BlogModel?> posts = blogDataList;

            return Column(
              children: [
                Container(
                  margin: paddingValues("carouselTop", context),
                  padding: paddingValues("sideMainPadding", context),
                  child: Column(children: [
                    Container(
                        // padding: paddingValues(paddingName, context)
                        width: swidth,
                        child: ExpansionTile(title: Text("Busca"), children: [
                          Padding(
                            padding: paddingValues("fullGrid", context),
                            child: blogFilters(context, swidth, posts,
                                widget.updateData, widget.titleStyle),
                          ),
                        ])),
                    if (posts.isEmpty) ...{
                      Container(
                          padding: const EdgeInsets.only(top: 100),
                          width: swidth,
                          child: Center(
                              child: Text(
                            "Perdão, não há nenhum post a ser exibido no momento.",
                          )))
                    } else ...{
                      Padding(
                        padding: const EdgeInsets.only(top: 65),
                        child: BlogListView(posts, swidth),
                      ),
                    },
                  ]),
                )
              ],
            );
          } else if (snapshot.hasError) {
            Center(
              child: Container(
                  width: swidth,
                  child: Text(
                    "Perdão, ocorreu um erro interno.",
                  )),
            );
          }
          return SizedBox(
              height: 200,
              width: swidth,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                ],
              ));
        },
      )
    ]);
  }
}
