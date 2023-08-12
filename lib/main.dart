import 'package:flutter/material.dart';

import 'pages/about-us/aboutUs.dart';
import 'pages/blog/blog.dart';
import 'pages/home/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home',
      home: const HomePage(),
      initialRoute: '/',
      routes: {
        '/aboutus' : (context) => const AboutUsPage(),
        '/blog' : (context) => const BlogPage(),
      }
    );
  }
}