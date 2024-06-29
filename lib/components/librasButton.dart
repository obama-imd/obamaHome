import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obamahome/utils/app_theme.dart';
import 'package:obamahome/utils/cores_personalizadas.dart';

final librasMode = StateProvider<bool>((ref) {
  return false;
});

void SetLibrasModeActive(WidgetRef ref, bool isLibrasModeActive) {
  ref.read(librasMode.notifier).state = !isLibrasModeActive;
}

class LibrasButton extends ConsumerStatefulWidget {
  const LibrasButton({super.key});

  @override
  _LibrasButtonState createState() => _LibrasButtonState();
}

class _LibrasButtonState extends ConsumerState<LibrasButton> {
  @override
  Widget build(BuildContext context) {
    bool isActive = ref.watch(librasMode);
    return FloatingActionButton(
      tooltip: "Ativar/Desativar ferramenta de Libras",
      backgroundColor: isActive ? onPrimary : CoresPersonalizadas.azulObama,
      onPressed: () {
        SetLibrasModeActive(ref, isActive);
      },
      child: Icon(Icons.sign_language, color: background),
    );
  }
}
