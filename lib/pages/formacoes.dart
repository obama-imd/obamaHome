import 'package:flutter/material.dart';

class Formacoes extends StatelessWidget {
  const Formacoes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topLeft,
        child:Padding(
          padding: const EdgeInsets.all(8.0),

          child: Column( children: [
              SizedBox(height: 20),
              Container(child: Text("Conhecendo a Plataforma Obama "),),
              SizedBox(height: 20),
              Container(child: Text("Desenvolvimento de Praticas Inovadoras em Matemática"),),
              SizedBox(height: 20),
              Container(child: Text("Uso Pedagogico do Smartphone nas Aulas de Matemática "),),
              SizedBox(height: 20),
              Container(child: Text("Ferramentas Colaborativas do Google Drive : Aplicações do Google Docs e Slides para o Ensino e Aprendizado "),),
              SizedBox(height: 20),
              Container(child: Text("erramentas do Google For Education: Aplicações do Google Forms e Classroom para o Ensino e Aprendizado"),),
              SizedBox(height: 20),
              Container(child: Text("InRede Visita Tecnica"),),
          ]
          ),
        ),
      ),
    );



  }
}
