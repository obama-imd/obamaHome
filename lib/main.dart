import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obamahome/advanced_search/application/study_level_service.dart';

import 'utils/app_theme.dart';

// Rodar com esse comando para pegar o backend localmente
// flutter run -d chrome --web-browser-flag "--disable-web-security"

void main() {
  runApp(ProviderScope(
    child: MyApp(),
  ));
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
    ref.read(studyLevelService).fetchAll();
  }

  @override
  Widget build(BuildContext context) {
    return AppMaterial;
  }
}
