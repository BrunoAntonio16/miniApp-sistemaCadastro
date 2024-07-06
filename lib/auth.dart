import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quickalert/quickalert.dart';


class AuthService {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void showAlertSucess(BuildContext context) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      title: 'Sucesso',
      text: "Login realizado com sucesso",
    );
  }

  Future<String?> cadUser({
    required String email,
    required String senha,
    required String confirmaSenha,
    required String nome,
  }) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: senha,
      );
      await userCredential.user!.updateDisplayName(nome);
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return "O usuário já foi cadastrado...";
      }
    }
  }

  Future<String?> logUser({
    required String email,
    required String senha,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: senha,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == 'unknown-error') {
        return "Email ou senha invalidos";
      }
      // if(e.code == 'user-not-found' || e.code == 'wrong-password') {
      //   return "Email ou senha invalidos";
      // }else {
      //   return "Ocorreu um erro...";
      // }
    }
  }

  // logUser({
  //   required String email,
  //   required String senha,
  // }) async {
  //     await _firebaseAuth.signInWithEmailAndPassword(
  //       email: email,
  //       password: senha,
  //     );
  //     return null;
  //   }


  logout() async {
    return _firebaseAuth.signOut();
  }
}
