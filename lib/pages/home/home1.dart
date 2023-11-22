import 'package:flutter/material.dart';
import 'package:obamahome/pages/home/home_desktop.dart';
import 'package:obamahome/pages/home/home_tablet.dart';
import 'package:obamahome/pages/home/responsivo.dart';
import 'package:obamahome/pages/mobile_pages/home_mobile1.dart';

class HomePage1 extends StatefulWidget {
  const HomePage1({super.key});

  @override
  State<HomePage1> createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {

  final TrackingScrollController _scrollController = TrackingScrollController();

  @override
  void dispose(){
    _scrollController.dispose();
    super.dispose();
  }

  

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsivo(
          mobile: HomeMobile1(),
          //mobile: HomeMobile( scrollController: _scrollController,),
          tablet: HomeTablet(scrollController: _scrollController,),
          desktop: HomeDesktop(scrollController: _scrollController,),
        ),
      ),
    );
  }
}






