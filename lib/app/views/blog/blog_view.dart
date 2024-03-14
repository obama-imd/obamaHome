import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:obamahome/app/views/blog/responsividade/blog_desktop.dart';
import 'package:obamahome/app/views/blog/responsividade/blog_mobile.dart';
import 'package:obamahome/app/views/blog/responsividade/blog_tablet.dart';

import '../../../utils/responsivo.dart';

List<IconData> shareMedia = [
  FontAwesomeIcons.facebook,
  FontAwesomeIcons.twitter,
  FontAwesomeIcons.googlePlus,
  FontAwesomeIcons.pinterest,
];

class BlogPage extends StatefulWidget {
  const BlogPage({Key? key}) : super(key: key);
  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool dataAvailable = false;

  String newData = '';
  Key key = UniqueKey();

  void updateData(String value) {
    setState(() {
      newData = value;
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;

    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
            body: Responsivo(
                mobile: BlogMobile(newData, key, swidth, updateData),
                tablet: BlogTablet(newData, key, swidth, updateData),
                desktop: BlogDesktop(newData, key, swidth, updateData))));
  }
}
