import 'package:flutter/material.dart';
import 'package:obamahome/app/views/manual/constants.dart';
import 'package:obamahome/components/bannerSuperior.dart';
import 'package:obamahome/templates/template_basic_col.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../../../components/dropdown_with_video.dart';
import '../../../../utils/app_theme.dart';

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
    double swidth = MediaQuery.of(context).size.width;
    return TemplateColumn(children: [
     BannerSuperior(context, 'Manuais'),
      if (swidth > 1200) ...[
        Container(
          padding: paddingValues("carouselTop", context),
          child: ResponsiveGridCol(
              lg: 8,
              sm: 12,
              child: DropdownManuais(accordionContent: manualItems)),
        )
      ]
    ]);
  }
}
