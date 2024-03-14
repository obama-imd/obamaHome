import 'package:flutter/material.dart';
import 'package:obamahome/app/views/trilhas/responsividade/trilhas_desktop.dart';
import 'package:obamahome/app/views/trilhas/responsividade/trilhas_mobile.dart';
import 'package:obamahome/app/views/trilhas/responsividade/trilhas_tablet.dart';

import '../../../utils/responsivo.dart';

class TrilhasPage extends StatelessWidget {
  const TrilhasPage({super.key});
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

  @override
  Widget build(BuildContext context) {
    double swidth = MediaQuery.of(context).size.width;
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: Responsivo(
              mobile: TrilhasMobile(),
              tablet: TrilhasTablet(),
              desktop: TrilhasDesktop()
        )));
  }
}
