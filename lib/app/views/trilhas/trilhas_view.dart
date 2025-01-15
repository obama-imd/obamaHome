import 'package:flutter/material.dart';
import 'package:obamahome/app/views/trilhas/responsividade/trilhas_desktop.dart';

import '../../../utils/responsivo.dart';
import 'responsividade/trilhas_mobile.dart';
import 'responsividade/trilhas_tablet.dart';

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
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          // body: TrilhasDesktop(),
          body: Responsivo(
              mobile: TrilhasMobile(),
              tablet: TrilhasTablet(),
              desktop: TrilhasDesktop()
        )
        ));
  }
}
