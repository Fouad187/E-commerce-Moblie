import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final _Auth = FirebaseAuth.instance;

  Future<UserCredential> signUp(String email, String Password) async {
    final authresult = await _Auth.createUserWithEmailAndPassword(
        email: email, password: Password);
    return authresult;
  }

  Future<UserCredential> signIn(String email, String Password) async {
    final authresult = await _Auth.signInWithEmailAndPassword(
        email: email, password: Password);
    return authresult;
  }
}
