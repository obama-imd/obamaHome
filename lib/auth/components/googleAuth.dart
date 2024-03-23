import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

const List<String> scopes = <String>['email', 'profile', 'openid'];

class LoginAPI {
  static final _googleSignIn = GoogleSignIn(
      scopes: scopes,
      clientId: const String.fromEnvironment(
          "14960925604-e49ehvf38cn8taja04ggvtlvt4n4mi2q.apps.googleusercontent.com"));
  static Future<GoogleSignInAccount?> login() async {
    final GoogleSignInAccount? account = await _googleSignIn.signInSilently();
    bool isAuthorized = account != null;
    if (kIsWeb && account != null) {
      isAuthorized = await _googleSignIn.canAccessScopes(scopes);
    }
    return (account);
  }

  static Future<void> signOut() async {
    await _googleSignIn.signOut();
  }
}
