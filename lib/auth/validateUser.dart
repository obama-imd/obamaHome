import 'package:flutter/material.dart';
import 'package:obamahome/auth/controller.dart';
import 'package:obamahome/auth/forgotPassword.dart';
import 'package:obamahome/components/mainButton.dart';
import 'package:obamahome/templates/template_basic_col.dart';

import 'components/formFields.dart';
import 'components/googleSignInButton.dart';

class ValidateUserPageView extends StatefulWidget {
  const ValidateUserPageView({super.key});

  @override
  State<ValidateUserPageView> createState() => _ValidateUserPageViewState();
}

class _ValidateUserPageViewState extends State<ValidateUserPageView> {
  GlobalKey loginKey = GlobalKey<FormState>();
  bool logged = false;
  String feedbackText = "";

  TextEditingController tokenController = TextEditingController();

  Future<void> isLogged(bool setLog) async {
    setState(() {
      logged = setLog;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TemplateColumn(children: [
      Padding(
        padding: const EdgeInsets.only(top: 120, bottom: 90),
        child: Form(
            key: loginKey,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 350),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30, bottom: 30),
                      child: Image.asset("assets/images/icons/icone.png", width: 150),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text("Informe o token que chegou no seu e-mail"),
                    ),
                    SizedBox(height: 20),
                    formFieldNoHide(context, "Token", tokenController),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(feedbackText),
                    ),
                    SizedBox(height: 20),
                    mainButton(context, "Validar e-mail", null, () {
                      setState(() {
                        validateUser(tokenController.text).then((_) {
                          Navigator.pushNamed(context, "/login");
                        }).onError((e, trace) {
                          setState(() {
                            feedbackText = "Token inválido";
                          });
                        });
                      });
                    }),
                  ]),
            )),
      ),
    ]);
  }
}
