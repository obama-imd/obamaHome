import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'utils/app_theme.dart';

void main() {
  runApp(
    // MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider(
    //         create: (context) => BlogViewModel(),
    //         child: MaterialApp(routes: {
    //           '/blog': (context) => const BlogPage(),
    //           '/blog-detalhes': (context) => BlogDetails(initialPageIndex: 0),
    //         })),
    //   ],
    //   child: MyApp(),
    ProviderScope(

      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppMaterial;
  }
}
