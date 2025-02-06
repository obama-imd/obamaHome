import 'package:flutter/material.dart';
import 'package:obamahome/utils/app_padding.dart';

import '../utils/app_theme.dart';

class RouteList {
  final String name;
  final List<String> path;

  RouteList(
      {
      required this.name,
      required this.path});
}

final List<RouteList> routesList = [
  RouteList(
    name: "Home",
    path: ['/'],
  ),
  RouteList(
    name: "Sobre Nós",
    path: ['/sobre'],
  ),
  RouteList(
    name: "Objetos de Aprendizagem",
    path: ['/objetos-aprendizagem'],
  ),
  RouteList(
    name: "Trilhas de Aprendizagem",
    path: ['/trilhas'],
  ),
  RouteList(
    name: "Manuais",
    path: ['/manuais'],
  ),
  RouteList(
    name: "Publicações",
    path: ['/blog'],
  ),
  RouteList(
    name: "Publicações",
    path: ['/blog-detalhes'],
  ),
  RouteList(
    name: "Formações",
    path: ['/formacoes'],
  ),
  RouteList(
    name: "Planos de Aula",
    path: ['/planos-aulas'],
  ),
  RouteList(
    name: "Login",
    path: ['/login'],
  ),
  RouteList(
    name: "Cadastro",
    path: ['/cadastro'],
  ),
  // RouteList(
  //   name: "Erro 404",
  //   path: ['/404'],
  // ),
];

Widget BannerSuperior(context, String pageName) {
  double swidth = MediaQuery.of(context).size.width;
  return Container(
      child: Stack(children: <Widget>[
    Container(
        width: swidth,
        height: 250,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/img.jpg'), fit: BoxFit.cover),
        )),
    Center(
      child: Container(
          height: 250,
          width: swidth,
          constraints: BoxConstraints(maxWidth: 1200),
          padding: paddingValues("sideMainPadding", context),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pageName,
                  style: textTheme.labelMedium,
                ),
                Container(
                    child: Row(children: [
                  InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/");
                      },
                      child: Text(
                        'Home',
                        style: textTheme.labelSmall,
                      )),
                  Text(
                    '  >  ',
                    style: textTheme.bodySmall,
                  ),
                  Text(
                    pageName,
                    style: textTheme.displaySmall,
                  ),
                ]))
              ])),
    )
  ]));
}
