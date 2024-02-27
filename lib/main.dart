import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:obamahome/pages/blog/blog-details.dart';
import 'package:obamahome/pages/formations/formacoes.dart';
import 'package:obamahome/pages/home/home1.dart';
import 'package:obamahome/pages/search/searchOA.dart';

import 'components/cores_personalizadas.dart';
import 'pages/about-us/aboutUs.dart';
import 'pages/blog/blog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primaryColor: CoresPersonalizadas.azulObama,
          // hoverColor: Colors.black,
          textTheme: TextTheme(
              titleLarge: GoogleFonts.raleway(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
              titleMedium:
                  GoogleFonts.raleway(color: Colors.grey, fontSize: 20),
              titleSmall: GoogleFonts.raleway(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
              headlineMedium:
                  GoogleFonts.raleway(color: Colors.black, fontSize: 16),
              displayMedium:
                  GoogleFonts.raleway(color: Colors.grey, fontSize: 14),
              displaySmall:
                  GoogleFonts.raleway(color: Colors.black, fontSize: 14)),
        ),
        debugShowCheckedModeBanner: false,
        title: 'Home',
        home: const HomePage1(),
        initialRoute: '/',
        routes: {
          '/aboutus': (context) => const AboutUsPage(),
          '/blog': (context) => const BlogPage(),
          '/blog-details': (context) => BlogDetails(initialPageIndex: 0),
          '/formacoes': (context) => const Formacoes(),
          '/servicos': (context) => SearchDesktop(datas: []),
        });
  }
}
