import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/models/blog_models.dart';
import 'app/views/blog/blog_view.dart';
import 'utils/app_theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => BlogViewModel(),
            child: MaterialApp(
              title: 'Blog App',
              initialRoute: '/',
              routes: {
                '/': (context) => BlogPage(),
              },
            ))
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppMaterial;
  }
}
