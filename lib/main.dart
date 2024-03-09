import 'package:flutter/material.dart';

import 'utils/app_theme.dart';

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
    return AppMaterial;
  }
}
