import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:obamahome/auth/components/googleAuth.dart';

import '../../utils/app_theme.dart';

final googleSignInData = StateProvider<GoogleSignInAccount?>((ref) {
  return null;
});

class GoogleSigninButton extends ConsumerStatefulWidget {
  const GoogleSigninButton({super.key});

  @override
  _GoogleSigninButtonState createState() => _GoogleSigninButtonState();
}

class _GoogleSigninButtonState extends ConsumerState<GoogleSigninButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 170,
      child: ElevatedButton(
          onPressed: () async {
            var user = await LoginAPI.login();
            final newData = ref.read(googleSignInData);
            // newData.clear();
            var nameUser = newData!.displayName;
            var emailUser = newData.email;

            print(" userData => $user, $nameUser, $emailUser");
          },
          style: ButtonStyle(
            side: MaterialStatePropertyAll(
                BorderSide(width: 1, color: secondary)),
          ),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text("Google", style: textTheme.headlineSmall),
            SizedBox(width: 5),
            Icon(FontAwesomeIcons.google, color: Colors.red, size: 14)
          ])),
    );
  }
}
