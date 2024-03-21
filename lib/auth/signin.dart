import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/bannerSuperior.dart';
import '../components/mainButton.dart';
import '../templates/template_basic_col.dart';
import '../utils/app_theme.dart';
import 'components/formFields.dart';

List<String> passwordFields = ["Senha", "Confirmar senha"];

class SignInPageView extends StatefulWidget {
  const SignInPageView({super.key});

  @override
  State<SignInPageView> createState() => _SignInPageViewState();
}

class _SignInPageViewState extends State<SignInPageView> {
  GlobalKey loginKey = GlobalKey<FormState>();
  bool showPassword = true;

  void displayPassword() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TemplateColumn(children: [
      BannerSuperior(context, "Cadastro"),
      Padding(
        padding: const EdgeInsets.only(top: 120),
        child: Form(
            key: loginKey,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 350),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, bottom: 30),
                  child: Image.network("assets/images/icone.png", width: 150),
                ),
                formFieldNoHide(context, "Nome"),
                SizedBox(height: 10),
                formFieldNoHide(context, "E-mail"),
                for (var passwordField in passwordFields) ...{
                  SizedBox(height: 10),
                  formFieldHidden(
                      context, passwordField, showPassword, displayPassword),
                },
                Padding(
                  padding: const EdgeInsets.only(top: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      mainButton(context, "Cadastrar", null, () {}),
                      Container(
                        height: 50,
                        width: 170,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              side: MaterialStatePropertyAll(
                                  BorderSide(width: 1, color: secondary)),
                            ),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Google",
                                      style: textTheme.headlineSmall),
                                  SizedBox(width: 5),
                                  Icon(FontAwesomeIcons.google,
                                      color: Colors.red, size: 14)
                                ])),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 35),
                  child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/login");
                      },
                      child: Text("Já está cadastrado?")),
                ),
              ]),
            )),
      ),
    ]);
  }
}
