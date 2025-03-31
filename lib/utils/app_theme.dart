import 'dart:js';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obamahome/app/views/lessons/lesson_plan_view.dart';
import 'package:obamahome/auth/controller.dart';
import 'package:obamahome/auth/login.dart';
import 'package:obamahome/auth/validateUser.dart';

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
import 'nav_key.dart';

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
  colors: [
    Color.fromARGB(255, 150, 144, 144),
    Colors.blue,
  ],
);

final TextTheme textTheme = TextTheme(
  titleLarge: TextStyle(
    fontSize: 35,
    fontWeight: FontWeight.bold,
  ),
  titleMedium: TextStyle(
    color: Colors.grey,
    fontSize: 20,
  ),
  titleSmall: TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  ),
  headlineLarge: TextStyle(
    color: primary,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  ),
  headlineMedium: TextStyle(
    color: Colors.black,
    fontSize: 16,
  ),
  headlineSmall: TextStyle(
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  ),
  labelLarge: TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  ),
  labelMedium: TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 36,
  ),
  labelSmall: TextStyle(
    color: primary,
    fontSize: 14,
  ),
  bodyLarge: TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 18,
  ),
  bodyMedium: TextStyle(
    color: Colors.black,
    fontSize: 14,
  ),
  bodySmall: TextStyle(
    color: Colors.grey,
    fontSize: 14,
  ),
  displayLarge: TextStyle(
    fontSize: 30,
    color: Colors.white,
  ),
  displayMedium: TextStyle(
    fontSize: 20,
    color: Colors.white,
  ),
  displaySmall: TextStyle(
    color: Colors.white,
    fontSize: 14,
  ),
);

class MyAppMaterial extends MaterialApp {
  final WidgetRef ref;

  MyAppMaterial({required this.ref, context})
      : super(
          scrollBehavior: ScrollConfiguration.of(context).copyWith(
            dragDevices: {
              PointerDeviceKind.touch,
              PointerDeviceKind.mouse,
            },
          ),
          theme: ThemeData(
            menuButtonTheme: MenuButtonThemeData(
              style: ButtonStyle(
                overlayColor: MaterialStatePropertyAll(background),
              ),
            ),
            menuBarTheme: MenuBarThemeData(
              style: MenuStyle(
                // padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 18, vertical: 15)),
                elevation: MaterialStatePropertyAll(0),
                backgroundColor: MaterialStatePropertyAll(background),
                shape: MaterialStatePropertyAll(
                  BeveledRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
              ),
            ),
            textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(primary),
                foregroundColor: MaterialStatePropertyAll(background),
                padding: MaterialStatePropertyAll(
                  EdgeInsets.all(10),
                ),
                textStyle: MaterialStatePropertyAll(
                  textTheme.displaySmall,
                ),
                overlayColor: MaterialStatePropertyAll(
                  Colors.lightBlue,
                ),
              ),
            ),
            iconButtonTheme: IconButtonThemeData(
              style: ButtonStyle(
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
              ),
            ),
            useMaterial3: true,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            primaryColor: CoresPersonalizadas.azulObama,
            splashColor: background,
            disabledColor: secondary,
            fontFamily: 'Raleway',
            colorScheme: ColorScheme(
              brightness: Brightness.light,
              primary: primary,
              onPrimary: onPrimary,
              secondary: secondary,
              onSecondary: onSecondary,
              error: error,
              onError: onError,
              surface: background,
              background: background,
              onBackground: background,
              onSurface: onSurface,
            ),
            textTheme: textTheme,
          ),
          debugShowCheckedModeBanner: false,
          title: 'OBAMA - Objetos de Aprendizagem para Matemática',
          home: const HomeView(),
          initialRoute: '/',
          routes: {
            '/sobre': (context) => const AboutUsPage(),
            '/blog': (context) => const BlogPage(),
            '/blog-detalhes': (context) => BlogDetails(
                  initialPageIndex:
                      ModalRoute.of(context)?.settings.arguments as int? ?? 0,
                ),
            '/formacoes': (context) => const Formacoes(),
            '/objetos-aprendizagem-nav': (context) {
              return SearchPage(
                termSearched:
                    ModalRoute.of(context)?.settings.arguments as String? ?? '',
                queryParams: '',
              );
            },
            '/objetos-aprendizagem': (context) {
              return SearchPage(
                termSearched: '',
                queryParams: '',
              );
            },
            '/trilhas': (context) => TrilhasPage(),
            '/manuais': (context) => ManuaisPage(),
            '/planos-aulas/lista': (context) => ListLessonPlan(),
            '/planos-aulas/criar': (context) => NewLessonPlan(),
            '/login': (context) => LoginPageView(),
            '/cadastro': (context) => SignInPageView(),
            '/validar-cadastro': (context) => ValidateUserPageView(),
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
            return MaterialPageRoute(
              builder: builder,
              settings: settings,
            );
          },
          onUnknownRoute: (settings) => MaterialPageRoute(
            builder: (_) => ErrorPage(),
          ),
          navigatorKey: NavKey.navigatorKey,
        );
}
