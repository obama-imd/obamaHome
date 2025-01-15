import 'package:flutter/material.dart';
import 'package:obamahome/auth/controller.dart';
import 'package:obamahome/auth/forgotPassword.dart';
import 'package:obamahome/components/mainButton.dart';
import 'package:obamahome/templates/template_basic_col.dart';

import 'components/formFields.dart';
import 'components/googleSignInButton.dart';

class LoginPageView extends StatefulWidget {
  const LoginPageView({super.key});

  @override
  State<LoginPageView> createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<LoginPageView> {
  GlobalKey loginKey = GlobalKey<FormState>();
  bool showPassword = true;
  bool logged = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void displayPassword() {
    setState(() {
      showPassword = !showPassword;
    });
  }

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
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, bottom: 30),
                  child: Image.asset("assets/images/icone.png", width: 150),
                ),
                formFieldNoHide(context, "E-mail", emailController),
                SizedBox(height: 10),
                formFieldHidden(context, "Senha", showPassword, displayPassword,
                    passwordController),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 35),
                  child: ForgotPasswordView(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    mainButton(context, "Entrar", null, () {
                      setState(() {
                        fetchLogin(
                                emailController.text, passwordController.text)
                            .then((val) {
                          Navigator.pushNamed(context, "/");
                        }).onError((e, trace) {
                          Navigator.pushNamed(context, "/login");
                        });
                      });
                    }),
                    GoogleSigninButton(),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 35),
                  child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/cadastro");
                      },
                      child: Text("Cadastre-se")),
                ),
              ]),
            )),
      ),
    ]);
  }
}
