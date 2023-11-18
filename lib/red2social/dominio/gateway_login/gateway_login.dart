import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class LoginGateway {
  Future<User?> signUpWithEmailAndPassaword(
      BuildContext context, String correo, String password);
  Future<User?> signInWithEmailAndPassword(
      BuildContext context, String correo, String password);
}
