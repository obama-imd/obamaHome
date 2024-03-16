import 'package:flutter/material.dart';
import 'package:obamahome/app/views/formations/constants.dart';
import 'package:obamahome/templates/template_basic_col.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../../../components/bannerSuperior.dart';
import '../../../../components/dropdown_with_video.dart';
import '../../../../components/sectionTitle.dart';

class FormacoesMobile extends StatelessWidget {
  const FormacoesMobile({super.key});
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
    return TemplateColumn(children: [
      BannerSuperior(context, 'Formações'),
      Padding(
        padding: const EdgeInsets.only(top: 120.0, bottom: 65.0),
        child: SectionTitle(
            'Plataforma OBAMA',
            'Objetos de Aprendizagem para Matemática',
            CrossAxisAlignment.center),
      ),
      if (MediaQuery.of(context).size.width > 1200) ...[
        Container(
          padding: const EdgeInsets.all(8.0),
          child: ResponsiveGridCol(
              lg: 8,
              sm: 12,
              child: DropdownFormations(accordionContent: accordionContent)),
        ),
      ]
    ]);
  }
}
