import 'package:flutter/material.dart';
import 'package:obamahome/app/views/formations/constants.dart';
import 'package:obamahome/components/bannerSuperior.dart';
import 'package:obamahome/templates/template_basic_col.dart';

import '../../../../components/dropdown_with_video.dart';
import '../../../../utils/app_padding.dart';

class FormacoesDesktop extends StatelessWidget {
  const FormacoesDesktop({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: MyStatefulWidget());
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);
  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  var item;

  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    return TemplateColumn(children: [
      BannerSuperior(context, "Formações"),
      Container(
        padding: paddingValues("carouselTop", context),
        child: DropdownFormations(accordionContent: accordionContent),
      ),
    ]);
  }
}
