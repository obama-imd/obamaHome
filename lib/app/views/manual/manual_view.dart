import 'package:flutter/material.dart';
import 'package:obamahome/app/views/manual/responsividade/manual_desktop.dart';

class ManuaisPage extends StatelessWidget {
  const ManuaisPage({super.key});
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

  var item = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(body: ManuaisDesktop()
            //   Responsivo(
            //       mobile: ManuaisMobile(),
            //       tablet: ManuaisTablet(),
            //       desktop: ManuaisDesktop()
            // )
            ));
  }
}
