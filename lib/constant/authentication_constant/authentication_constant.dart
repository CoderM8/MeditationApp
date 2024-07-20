import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:io' show Platform;
import 'package:http/http.dart' as http;

import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class Authentication {
  String clientId() {
    if (Platform.isAndroid) {
      return "696617949622-a560euoalgh1f8ckqseas7o27h1the29.apps.googleusercontent.com";
    } else {
      return "696617949622-pv5ji67kpt0r2bstcru46hf5huega2m7.apps.googleusercontent.com";
    }
  }

  Future<UserCredential?> googleSignIn() async {
    GoogleSignIn googleSignIn = GoogleSignIn(
      // clientId: clientId(),
      scopes: ['email'],
    );
// GoogleSignIn googleSignIn =  GoogleSignIn.standard(scopes: ['email']);
    GoogleSignInAccount? googleSignInAccount;
    try {
      googleSignInAccount = await googleSignIn.signIn();
    } catch (e, t) {
      print('=-=-=-=-=-=-=-=-=-= $e =-=-==-=-=-==-=-==- $t');
    }

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

      final AuthCredential authCredential = GoogleAuthProvider.credential(idToken: googleSignInAuthentication.idToken, accessToken: googleSignInAuthentication.accessToken);

      UserCredential result = await FirebaseAuth.instance.signInWithCredential(authCredential);

      print('Hello user credential ${result.user}');

      return result;
    } else {
      return null;
    }
  }

  Future<UserCredential?> signInWithApple() async {
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
      final oAuthProvider = OAuthProvider('apple.com');
      final firebaseauth = oAuthProvider.credential(
        idToken: credential.identityToken,
        accessToken: credential.authorizationCode,
      );
      UserCredential authResult = await FirebaseAuth.instance.signInWithCredential(firebaseauth);
      final firebaseUser = authResult.user;
      print('Apple login successful! Family Name: ${firebaseUser?.email}');
      return authResult;
    } catch (error) {
      print('Error signing in with Apple: $error');
      // Handle error gracefully
      return null;
    }
  }
}
