import 'package:flutter/material.dart';
import 'package:obamahome/app/views/formations/responsividade/formations_desktop.dart';
import 'package:obamahome/app/views/formations/responsividade/formations_mobile.dart';
import 'package:obamahome/app/views/formations/responsividade/formations_tablet.dart';

import '../../../utils/responsivo.dart';

class Formacoes extends StatelessWidget {
  const Formacoes({super.key});
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
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: Responsivo(
              mobile: FormacoesMobile(),
              tablet: FormacoesTablet(),
              desktop: FormacoesDesktop()
        )));
  }
}
