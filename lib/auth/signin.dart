import 'package:flutter/material.dart';
import 'package:obamahome/auth/controller.dart';

import '../components/mainButton.dart';
import '../templates/template_basic_col.dart';
import 'components/formFields.dart';
import 'components/googleSignInButton.dart';

List<String> passwordFields = ["Senha", "Confirmar senha"];

class SignInPageView extends StatefulWidget {
  const SignInPageView({super.key});

  @override
  State<SignInPageView> createState() => _SignInPageViewState();
}

class _SignInPageViewState extends State<SignInPageView> {
  GlobalKey signInKey = GlobalKey<FormState>();
  bool showPassword = true;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void displayPassword() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TemplateColumn(children: [
      Padding(
        padding: const EdgeInsets.only(top: 120, bottom: 90),
        child: Form(
            key: signInKey,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 350),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, bottom: 30),
                  child: Image.asset("assets/images/icone.png", width: 150),
                ),
                formFieldNoHide(context, "Nome", nameController),
                SizedBox(height: 10),
                formFieldNoHide(context, "E-mail", emailController),
                for (var passwordField in passwordFields) ...{
                  SizedBox(height: 10),
                  formFieldHidden(context, passwordField, showPassword,
                      displayPassword, passwordController),
                },
                Padding(
                  padding: const EdgeInsets.only(top: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      mainButton(context, "Cadastrar", null, () {
                        setState(() {
                          newUser(nameController.text, emailController.text,
                                  passwordController.text)
                              .whenComplete(() {
                            Navigator.pushNamed(context, "/validar-cadastro");
                          });
                        });
                      }),
                      GoogleSigninButton(),
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
