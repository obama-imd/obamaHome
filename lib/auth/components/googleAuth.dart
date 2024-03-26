import 'package:google_sign_in/google_sign_in.dart';

const List<String> scopes = <String>['email', 'profile', 'openid'];

class LoginAPI {
  static final _googleSignIn = GoogleSignIn(
      scopes: scopes,
      clientId:
          "14960925604-e49ehvf38cn8taja04ggvtlvt4n4mi2q.apps.googleusercontent.com");
  static Future<GoogleSignInAccount?> login() async {
    await _googleSignIn.signIn();
    // return (account);
  }

  static Future<void> signOut() async {
    await _googleSignIn.signOut();
  }
}
