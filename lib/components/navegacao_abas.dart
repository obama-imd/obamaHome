import 'package:flutter/material.dart';

class NavegacaoAbas extends StatelessWidget {
  const NavegacaoAbas({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(tabs: [tab()]);
  }
}
