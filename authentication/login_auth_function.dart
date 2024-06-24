import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_movie/utilities/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

//register form
signup(String email, String password) async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);

  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print(ErrorMessages.weakPassword);
    } else if (e.code == 'email-already-in-use') {
      print(ErrorMessages.emailAlreadyRegistered);
    }
  } catch (e) {
    print(e);
  }
}
//email login
signin(String email, String password) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print(ErrorMessages.invalidUser);
    } else if (e.code == 'wrong-password') {
      print(ErrorMessages.confirmPassword);
    }
  }
}