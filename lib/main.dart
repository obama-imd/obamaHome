import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'utils/app_theme.dart';

// Rodar com esse comando para pegar o backend localmente
// flutter run -d chrome --web-browser-flag "--disable-web-security"

void main() {
  runApp(ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppMaterial;
  }
}
