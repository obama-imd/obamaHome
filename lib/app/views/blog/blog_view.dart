import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:obamahome/app/views/blog/responsividade/blog_desktop.dart';
import 'package:obamahome/app/views/blog/responsividade/blog_mobile.dart';
import 'package:obamahome/app/views/blog/responsividade/blog_tablet.dart';

import '../../../components/loadCircle.dart';
import '../../../utils/responsivo.dart';
import '../../controllers/blog_controller.dart';

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

  bool loadPosts = false;
  bool loadObjects = false;

  @override
  void initState() {
    super.initState();
    activateLoad();
    waitData();
  }

  void activateLoad() {
    setState(() {
      loadPosts = true;
      loadObjects = true;
    });
  }

  void waitData() async {
    await fetchData("").whenComplete(() => setState(() {
          loadPosts = false;
        }));
  }

  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;

    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
            body: Stack(
          children: [
            Responsivo(
                mobile: BlogMobile(newData, key, swidth, updateData),
                tablet: BlogTablet(newData, key, swidth, updateData),
                desktop: BlogDesktop(newData, key, swidth, updateData)),
            if (loadPosts) ...{circleLoadSpinner(context)}
          ],
        )));
  }
}
