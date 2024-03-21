import 'package:flutter/material.dart';
import 'package:obamahome/components/mainButton.dart';

import '../utils/app_theme.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Text("Esqueceu a senha?"),
        onTap: () {
          showDialog(
              context: context,
              barrierColor: modalBackground,
              builder: (BuildContext context) => AlertDialog(
                  contentPadding: EdgeInsets.all(35),
                  title:
                      Center(child: Text("Recuperação de Senha", style: textTheme.titleSmall)),
                  content: ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: 210, maxWidth: 350),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            "Informe o e-mail cadastrado para que possamos te ajudar a recuperar os dados de acesso."),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 35),
                          child: TextFormField(
                            decoration: InputDecoration(
                                filled: true,
                                label: Text("E-mail"),
                                labelStyle: textTheme.bodySmall,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                fillColor: textFieldBackground,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: secondary))),
                          ),
                        ),
                        mainButton(context, "Enviar", null, () {})
                      ],
                    ),
                  )));
        });
  }
}
