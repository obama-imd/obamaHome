import 'package:flutter/material.dart';

class NavegacaoEntrePaginasMobile extends StatelessWidget {

  final List<Icon> icones;
  final int  indiceAbaSelecionada;
  final Function(int) onTap;

  const NavegacaoEntrePaginasMobile({
    required this.icones,
    required this.indiceAbaSelecionada,
    required this.onTap,
    super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: onTap,
        tabs: icones

    );
  }
}
