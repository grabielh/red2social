// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:red2social/red2social/dominio/gateway_login/gateway_login.dart';

class FirebaseAuthServices extends ChangeNotifier implements LoginGateway {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<User?> signUpWithEmailAndPassaword(
      BuildContext context, String correo, String password) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: correo, password: password);

      return userCredential.user;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.white,
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.change_circle_sharp,
                size: 30,
                color: Colors.green, // Color del icono
              ),
              Text(
                'Complete los datos !',
                style: TextStyle(color: Colors.red),
              )
            ],
          ),
        ),
      );
    }
    return null;
  }

  @override
  Future<User?> signInWithEmailAndPassword(
      BuildContext context, String correo, String password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: correo, password: password);

      return userCredential.user;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.white,
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.change_circle_sharp,
                size: 30,
                color: Colors.green, // Color del icono
              ),
              Text(
                'Ingrese datos validos !',
                style: TextStyle(color: Colors.red),
              )
            ],
          ),
        ),
      );
    }
    return null;
  }
}
