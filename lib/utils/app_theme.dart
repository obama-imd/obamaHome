import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../404.dart';
import '../app/views/about-us/aboutUs_view.dart';
import '../app/views/blog/blog_view.dart';
import '../app/views/blog/components/blog-details.dart';
import '../app/views/formations/formacoes_view.dart';
import '../app/views/home/home_view.dart';
import '../app/views/manual/manual_view.dart';
import '../app/views/search/searchOA_view.dart';
import '../app/views/trilhas/trilhas_view.dart';
import 'cores_personalizadas.dart';

const Color primary = Color.fromRGBO(23, 119, 242, 1);
const Color onPrimary = Colors.black;
const Color secondary = Colors.grey;
const Color onSecondary = Colors.transparent;
const Color error = Colors.red;
const Color onError = Colors.redAccent;
const Color background = Colors.white;
const Color onBackground = Colors.white;
const Color surface = Color.fromRGBO(23, 160, 242, 1);
const Color modalBackground = Color.fromRGBO(23, 160, 242, .95);
const Color onSurface = Colors.black;

const LinearGradient gradientColor = LinearGradient(
    begin: Alignment.topLeft, colors: [Colors.white, Colors.blue]);

final TextTheme textTheme = TextTheme(
  titleLarge: GoogleFonts.raleway(
    fontSize: 35,
    fontWeight: FontWeight.bold,
  ),
  titleMedium: GoogleFonts.raleway(color: Colors.grey, fontSize: 20),
  titleSmall: GoogleFonts.raleway(
      color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
  headlineLarge: GoogleFonts.raleway(
      color: primary, fontSize: 14, fontWeight: FontWeight.bold),
  headlineMedium: GoogleFonts.raleway(color: Colors.black, fontSize: 16),
  headlineSmall: GoogleFonts.raleway(
      color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
  labelLarge: GoogleFonts.raleway(
      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 36),
  labelMedium: GoogleFonts.raleway(
    color: Colors.white,
    fontSize: 14,
    shadows: [
      Shadow(
        offset: Offset(1, 1),
        color: Color.fromRGBO(0, 0, 0, 0.5),
      )
    ],
  ),
  labelSmall: GoogleFonts.raleway(color: primary, fontSize: 14),
  bodyLarge: GoogleFonts.raleway(
      color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
  bodyMedium: GoogleFonts.raleway(color: Colors.black, fontSize: 14),
  bodySmall: GoogleFonts.raleway(color: Colors.grey, fontSize: 14),
  displayLarge: GoogleFonts.raleway(fontSize: 30, color: Colors.white),
  displayMedium: GoogleFonts.raleway(fontSize: 20, color: Colors.white),
  displaySmall: GoogleFonts.raleway(color: Colors.white, fontSize: 14),
);

final MaterialApp AppMaterial = MaterialApp(
  theme: ThemeData(
      menuButtonTheme: MenuButtonThemeData(
          style: ButtonStyle(
        overlayColor: MaterialStatePropertyAll(background),
      )),
      menuBarTheme: MenuBarThemeData(
          style: MenuStyle(
              // padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 18, vertical: 15)),
              elevation: MaterialStatePropertyAll(0),
              backgroundColor: MaterialStatePropertyAll(background),
              shape: MaterialStatePropertyAll(
                  BeveledRectangleBorder(borderRadius: BorderRadius.zero)))),
      textButtonTheme: TextButtonThemeData(
          style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(primary),
        overlayColor: MaterialStatePropertyAll(Colors.lightBlue),
      )),
      iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
              shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(borderRadius: BorderRadius.zero)))),
      useMaterial3: true,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primaryColor: CoresPersonalizadas.azulObama,
      splashColor: background,
      disabledColor: secondary,
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
    '/sobre': (context) => const AboutUsPage(),
    '/blog': (context) => const BlogPage(),
    '/blog-detalhes': (context) => BlogDetails(initialPageIndex: 0),
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

    WidgetBuilder builder;
    switch (routeName) {
      default:
        builder = (context) => ErrorPage();
    }

    return MaterialPageRoute(builder: builder, settings: settings);
  },
  onUnknownRoute: (settings) => MaterialPageRoute(builder: (_) => ErrorPage()),
  navigatorKey: GlobalKey(),
);

EdgeInsets paddingValues(String paddingName, double? swidth) {
  switch (paddingName) {
    case "sideMainPadding":
      return EdgeInsets.symmetric(horizontal: swidth! *.068);
    case "sideHomePosts":
      return EdgeInsets.symmetric(horizontal: swidth! *.052);
    case "sideHomeCards":
      return EdgeInsets.symmetric(horizontal: (swidth! *.068) - 30);
    case "sectionPadding":
      return EdgeInsets.only(top: 120, bottom: 115);
    case "logo":
      return EdgeInsets.only(top: 19, bottom: 19);
    case "mainTitle":
      return EdgeInsets.only(top: 120, bottom: 65);
    case "mainTitleBottom":
      return EdgeInsets.only(bottom: 65);
    case "menuItems":
      return EdgeInsets.only(left: 18);
    case "meuSubItems":
      return EdgeInsets.symmetric(horizontal: 20);
    case "bannerTitle":
      return EdgeInsets.only(bottom: 15);
    case "aboutUsVideo":
      return EdgeInsets.all(30);
    case "underCard":
      return EdgeInsets.only(bottom: 30);
    case "gridTitle":
      return EdgeInsets.only(top: 25, bottom: 15);
    case "fullGrid":
      return EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 35);
    case "blogPostDate":
      return EdgeInsets.only(top: 20, bottom: 15);
    case "blogHomeTile":
      return EdgeInsets.only(top: 10, bottom: 15);
    case "sectionSubTitle":
      return EdgeInsets.only(top: 15, bottom: 10);
    case "carouselTop":
      return EdgeInsets.only(top: 120);
    case "sliderSubtitle":
      return EdgeInsets.only(top: 30, bottom: 20);
    case "partners":
      return EdgeInsets.symmetric(vertical: 50);
    case "footer":
      return EdgeInsets.only(top: 75, left: 75, right: 75, bottom: 30);
    default:
      return EdgeInsets.zero;
  }
}
