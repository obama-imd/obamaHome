// import 'package:flutter/material.dart';
// import 'package:obamahome/app/views/formations/constants.dart';
// import 'package:obamahome/components/bannerSuperior.dart';
// import 'package:obamahome/templates/template_basic_col.dart';
// import 'package:responsive_grid/responsive_grid.dart';

// import '../../../../components/dropdown_with_video.dart';
// import '../../../../utils/app_padding.dart';

// class FormacoesTablet extends StatelessWidget {
//   const FormacoesTablet({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(body: MyStatefulWidget());
//   }
// }

// class MyStatefulWidget extends StatefulWidget {
//   const MyStatefulWidget({Key? key}) : super(key: key);
//   @override
//   State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
// }

// class _MyStatefulWidgetState extends State<MyStatefulWidget> {
//   var scaffoldKey = GlobalKey<ScaffoldState>();

//   var item;

//   @override
//   Widget build(BuildContext context) {
//     double swidth = MediaQuery.of(context).size.width;
//     return TemplateColumn(children: [
//       BannerSuperior(context, "Formações"),
//       Container(
//         padding: paddingValues("carouselTop", context),
//         child: ResponsiveGridCol(
//             lg: 8,
//             sm: 12,
//             child: DropdownFormations(accordionContent: accordionContent)),
//       ),
//     ]);
//   }
// }
