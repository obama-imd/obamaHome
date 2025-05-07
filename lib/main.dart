import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'utils/app_theme.dart';

// Rodar com esse comando para pegar o backend localmente
// flutter run -d chrome --web-browser-flag "--disable-web-security"

void main() {
  usePathUrlStrategy();
  runApp(ProviderScope(child: MyApp()));
  WidgetsFlutterBinding.ensureInitialized();
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState(); 
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MyAppMaterial(
      ref: ref, context: context,
    );
  }
}
