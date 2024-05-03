import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod/riverpod.dart';

const List<String> scopes = <String>['email', 'profile', 'openid'];

final googleName = StateProvider<List<String?>>((ref) {
  return [];
});
final googleEmail = StateProvider<List<String?>>((ref) {
  return [];
});
final googleBool = StateProvider<List<bool>>((ref) {
  return [false];
});

class LoginAPI {
  static final _googleSignIn = GoogleSignIn(
      scopes: scopes,
      clientId:
          "14960925604-e49ehvf38cn8taja04ggvtlvt4n4mi2q.apps.googleusercontent.com");
  static Future<void> login(WidgetRef ref) async {
    final googleLogin = await _googleSignIn.signIn();

    String? username = googleLogin!.displayName;
    String? useremail = googleLogin.email;
    bool user = await GoogleSignIn().isSignedIn();

    final newName = ref.read(googleName);
    final newEmail = ref.read(googleEmail);
    final newLogin = ref.read(googleBool);

    newName.add(username!);
    newEmail.add(useremail);
    newLogin.add(user);
  }

  static Future<void> signOut() async {
    await _googleSignIn.signOut();
  }
}
