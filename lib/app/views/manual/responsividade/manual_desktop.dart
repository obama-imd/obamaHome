import 'package:flutter/material.dart';
import 'package:obamahome/app/views/manual/constants.dart';
import 'package:obamahome/templates/template_basic_col.dart';

import '../../../../components/dropdown_with_video.dart';
import '../../../../utils/app_padding.dart';

class ManuaisDesktop extends StatefulWidget {
  const ManuaisDesktop({super.key});
  @override
  State<ManuaisDesktop> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<ManuaisDesktop> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  var item = 0;

  @override
  Widget build(BuildContext context) {
    return TemplateColumn(children: [
      // BannerSuperior(context, 'Manuais'),
      Container(
        constraints: BoxConstraints(maxWidth: 1200),
        padding: paddingValues("carouselTop", context),
        child: DropdownManuais(accordionContent: manualItems),
      )
    ]);
  }
}
