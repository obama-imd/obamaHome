import 'package:flutter/material.dart';
import 'package:obamahome/app/views/lessons/lesson_plan_view.dart';
import 'package:obamahome/auth/login.dart';

import '../404.dart';
import '../app/views/about-us/aboutUs_view.dart';
import '../app/views/blog/blog_view.dart';
import '../app/views/blog/components/blog-details.dart';
import '../app/views/formations/formacoes_view.dart';
import '../app/views/home/home_view.dart';
import '../app/views/lessons/lesson_plan_new.dart';
import '../app/views/manual/manual_view.dart';
import '../app/views/search/searchOA_view.dart';
import '../app/views/trilhas/trilhas_view.dart';
import '../auth/signin.dart';
import 'cores_personalizadas.dart';

const Color primary = Color.fromRGBO(23, 119, 242, 1);
const Color onPrimary = Colors.black;
const Color secondary = Colors.grey;
const Color onSecondary = Colors.transparent;
const Color terciary = Color.fromARGB(255, 231, 228, 228);
const Color error = Colors.red;
const Color onError = Colors.redAccent;
const Color background = Colors.white;
const Color onBackground = Colors.white;
const Color surface = Color.fromRGBO(23, 160, 242, 1);
const Color modalBackground = Color.fromRGBO(23, 119, 242, .9);
const Color onSurface = Colors.black;
const Color borderInput = Color.fromARGB(158, 225, 225, 225);
const Color textFieldBackground = Color.fromARGB(255, 248, 248, 248);

const LinearGradient gradientColor = LinearGradient(
    begin: Alignment.topLeft,
    colors: [Color.fromARGB(255, 150, 144, 144), Colors.blue]);

final TextTheme textTheme = TextTheme(
  titleLarge: TextStyle(fontFamily: 'Raleway', 
    fontSize: 35,
    fontWeight: FontWeight.bold,
  ),
  titleMedium: TextStyle(fontFamily: 'Raleway', color: Colors.grey, fontSize: 20),
  titleSmall:
      TextStyle(fontFamily: 'Raleway', color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
  headlineLarge:
      TextStyle(fontFamily: 'Raleway', color: primary, fontSize: 14, fontWeight: FontWeight.bold),
  headlineMedium: TextStyle(fontFamily: 'Raleway', color: Colors.black, fontSize: 16),
  headlineSmall:
      TextStyle(fontFamily: 'Raleway', color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
  labelLarge:
      TextStyle(fontFamily: 'Raleway', color: Colors.white, fontWeight: FontWeight.bold, fontSize: 36),
  labelMedium: TextStyle(fontFamily: 'Raleway', 
    color: Colors.white,
    fontSize: 14,
    shadows: [
      Shadow(
        offset: Offset(1, 1),
        color: Color.fromRGBO(0, 0, 0, 0.5),
      )
    ],
  ),
  labelSmall: TextStyle(fontFamily: 'Raleway', color: primary, fontSize: 14),
  bodyLarge:
      TextStyle(fontFamily: 'Raleway', color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
  bodyMedium: TextStyle(fontFamily: 'Raleway', color: Colors.black, fontSize: 14),
  bodySmall: TextStyle(fontFamily: 'Raleway', color: Colors.grey, fontSize: 14),
  displayLarge: TextStyle(fontFamily: 'Raleway', fontSize: 30, color: Colors.white),
  displayMedium: TextStyle(fontFamily: 'Raleway', fontSize: 20, color: Colors.white),
  displaySmall: TextStyle(fontFamily: 'Raleway', color: Colors.white, fontSize: 14),
);

final MaterialApp AppMaterial = MaterialApp(
  theme: ThemeData(
      fontFamily: 'Raleway',
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
          style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(primary),
        foregroundColor: MaterialStatePropertyAll(background),
        padding: MaterialStatePropertyAll(EdgeInsets.all(10)),
        textStyle: MaterialStatePropertyAll(textTheme.displaySmall),
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
        surface: background,
        onSurface: onSurface,
      ),
      textTheme: textTheme),
  debugShowCheckedModeBanner: false,
  home: const HomeView(),
  initialRoute: '/',
  routes: {
    '/sobre': (context) => const AboutUsPage(),
    '/blog': (context) => const BlogPage(),
    '/blog-detalhes': (context) => BlogDetails(
        initialPageIndex:
            ModalRoute.of(context)?.settings.arguments as int? ?? 0),
    '/formacoes': (context) => const Formacoes(),
    '/servicos': (context) => SearchPage(
        termSearched:
            ModalRoute.of(context)?.settings.arguments as String? ?? ''),
    '/trilhas': (context) => TrilhasPage(),
    '/manuais': (context) => ManuaisPage(),
    '/planos-aulas/lista': (context) => ListLessonPlan(),
    '/planos-aulas/criar': (context) => NewLessonPlan(),
    '/login': (context) => LoginPageView(),
    '/cadastro': (context) => SignInPageView(),
    // '/esqueciMinhaSenha': (context) => ForgotPasswordView()
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
