import 'package:flutter/material.dart';
import 'package:obamahome/auth/controller.dart';
import 'package:bcrypt/bcrypt.dart';

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
  bool showConfirmPassword = true;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  void displayPassword() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  void displayConfirmPassword() {
    setState(() {
      showConfirmPassword = !showConfirmPassword;
    });
  }

  void signUpUser() {
    String hashedPassword =
        BCrypt.hashpw(passwordController.text, BCrypt.gensalt());
    bool senhaCorreta =
        BCrypt.checkpw(passwordConfirmController.text, hashedPassword);

    if (senhaCorreta) {
      newUser(nameController.text, emailController.text,
              passwordController.text)
          .then((val) {
        if (val) {
          Navigator.pushNamed(context, "/validar-cadastro");
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content:
                    Text("Erro ao cadastrar usuário. Verifique os dados.")),
          );
        }
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                "Erro ao cadastrar usuário. As senhas digitadas são diferentes.")),
      );
    }
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
                  child:
                      Image.asset("assets/images/icons/icone.png", width: 150),
                ),
                formFieldNoHide(context, "Nome", nameController),
                SizedBox(height: 10),
                formFieldNoHide(context, "E-mail", emailController),
                // for (var passwordField in passwordFields) ...{
                //   SizedBox(height: 10),
                //   formFieldHidden(context, passwordField, showPassword,
                //       displayPassword, passwordController),
                // },
                SizedBox(height: 20),
                Text(
                    "A senha precisa ter pelo menos uma letra maiúscula, um número e um caractere especial."),
                SizedBox(height: 20),
                formFieldHidden(context, passwordFields[0], showPassword,
                    displayPassword, passwordController),
                SizedBox(height: 10),
                formFieldHidden(context, passwordFields[1], showConfirmPassword,
                    displayConfirmPassword, passwordConfirmController),
                Padding(
                  padding: const EdgeInsets.only(top: 35),
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // children: [
                  //   // GoogleSigninButton(),
                  // ],
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
