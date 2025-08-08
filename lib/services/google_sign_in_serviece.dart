import 'package:firebase_auth/firebase_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInService {
  static final GoogleSignInService _instance = GoogleSignInService._internal();

  factory GoogleSignInService() => _instance;

  GoogleSignInService._internal();

  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: [
    "email",
  ]);

  GoogleSignIn get googleSignIn => _googleSignIn;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> signIn() async {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    if (googleUser == null) {
      throw Exception('Google sign-in cancelled.');
    }

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final UserCredential userCredential =
        await _auth.signInWithCredential(credential);

    return userCredential;
  }

  Future signOut() async {
    await googleSignIn.signOut();
  }
}
