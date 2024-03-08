import 'package:flutter/material.dart';
import 'package:obamahome/app/views/blog/components/blog-details.dart';
import 'package:obamahome/app/views/formations/formacoes_view.dart';
import 'package:obamahome/app/views/home/home_view.dart';
import 'package:obamahome/app/views/manual/manual_view.dart';
import 'package:obamahome/app/views/search/searchOA_view.dart';

import '404.dart';
import 'app/views/about-us/aboutUs_view.dart';
import 'app/views/blog/blog_view.dart';
import 'app/views/trilhas/trilhas_view.dart';
import 'utils/app_theme.dart';
import 'utils/cores_personalizadas.dart';

void main() {
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
  };
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            menuButtonTheme: MenuButtonThemeData(
                style: ButtonStyle(
              overlayColor: MaterialStatePropertyAll(Colors.white),
            )),
            menuBarTheme: MenuBarThemeData(
                style: MenuStyle(
              elevation: MaterialStatePropertyAll(0),
              backgroundColor: MaterialStatePropertyAll(Colors.white),
              side: MaterialStatePropertyAll(BorderSide.none),
            )),
            useMaterial3: true,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            primaryColor: CoresPersonalizadas.azulObama,
            splashColor: background,
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
            textTheme: textTheme),
        debugShowCheckedModeBanner: false,
        title: 'Home',
        home: const HomeView(),
        initialRoute: '/',
        routes: {
          '/aboutus': (context) => const AboutUsPage(),
          '/blog': (context) => const BlogPage(),
          '/blog-details': (context) => BlogDetails(initialPageIndex: 0),
          '/formacoes': (context) => const Formacoes(),
          '/servicos': (context) => SearchDesktop(
              termSearched:
                  ModalRoute.of(context)?.settings.arguments as String? ?? ''),
          '/trilhas': (context) => TrilhasPage(),
          '/manuais': (context) => ManuaisPage()
        },
        onGenerateRoute: (settings) {
          if (settings.name == null) {
            return null;
          }

          final routeName = settings.name!;
          // final args = settings.arguments;

          WidgetBuilder builder;
          switch (routeName) {
            case '/':
              builder = (context) => HomeView();
              break;
            case '/aboutus':
              builder = (context) => const AboutUsPage();
              break;
            default:
              builder = (context) => ErrorPage();
          }

          return MaterialPageRoute(builder: builder, settings: settings);
        },
        onUnknownRoute: (settings) =>
            MaterialPageRoute(builder: (_) => ErrorPage()));
  }
}
