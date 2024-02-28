import 'package:flutter/material.dart';
import 'package:obamahome/app/views/blog/components/blog-details.dart';
import 'package:obamahome/app/views/formations/formacoes.dart';
import 'package:obamahome/app/views/home/home_view.dart';
import 'package:obamahome/app/views/search/searchOA_view.dart';

import 'app/views/about-us/aboutUs_view.dart';
import 'app/views/blog/blog_view.dart';
import 'components/cores_personalizadas.dart';
import 'utils/app_theme.dart';

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
          colorScheme: ColorScheme(
            brightness: Brightness.light,
            primary: primary,
            onPrimary: onPrimary,
            secondary: secondary,
            onSecondary: onSecondary,
            error: error,
            onError: onError,
            background: background,
            onBackground: onBackground,
            surface: surface,
            onSurface: onSurface,
          ),
          textTheme: textTheme
        ),
        debugShowCheckedModeBanner: false,
        title: 'Home',
        home: const HomeView(),
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
