// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:red2social/red2social/infraestructura/service_firebase/services_firebase_login.dart';
import 'package:red2social/red2social/views/home/view_home.dart';
import 'package:red2social/red2social/views/user_register/view_registrar.dart';

class ViewLogin extends StatefulWidget {
  const ViewLogin({super.key});

  @override
  State<ViewLogin> createState() => _ViewLoginState();
}

class _ViewLoginState extends State<ViewLogin> {
  final TextEditingController _userName = TextEditingController(text: 'Zac');
  final TextEditingController _correo =
      TextEditingController(text: 'alfrellack@gmail.com');
  final TextEditingController _password = TextEditingController(text: '123456');
  final FirebaseAuthServices authServices = FirebaseAuthServices();

  @override
  void dispose() {
    _correo.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginFirebase = Provider.of<FirebaseAuthServices>(context);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(5),
        width: 500,
        height: 900,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 10),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _buildIconUser(context),
                _buildInput(context, _correo, _password),
                _buildButton(context, loginFirebase),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIconUser(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
      width: 200,
      height: 200,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 40),
            child: const Icon(
              Icons.verified_user,
              size: 100,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInput(BuildContext context, TextEditingController user,
      TextEditingController password) {
    return Column(
      children: [
        Container(
          margin:
              const EdgeInsets.only(top: 10, left: 40, right: 40, bottom: 40),
          child: Row(
            children: [
              Container(
                width: 300,
                padding: const EdgeInsets.all(5),
                child: TextField(
                  controller: _userName,
                  decoration: InputDecoration(
                      labelText: 'userName',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  keyboardType: TextInputType.emailAddress,
                ),
              )
            ],
          ),
        ),
        Container(
          margin:
              const EdgeInsets.only(top: 10, left: 40, right: 40, bottom: 40),
          child: Row(
            children: [
              Container(
                width: 300,
                padding: const EdgeInsets.all(5),
                child: TextField(
                  controller: user,
                  decoration: InputDecoration(
                      labelText: 'Correo',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  keyboardType: TextInputType.emailAddress,
                ),
              )
            ],
          ),
        ),
        Container(
          margin:
              const EdgeInsets.only(top: 30, left: 40, right: 40, bottom: 40),
          child: Row(
            children: [
              Container(
                width: 300,
                padding: const EdgeInsets.all(5),
                child: TextField(
                  controller: password,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildButton(BuildContext context, loginFirebase) {
    return Column(
      children: [
        Container(
          padding:
              const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
          width: 400,
          child: ElevatedButton(
              onPressed: () {
                _singUp(loginFirebase);
              },
              child: const Text('Iniciar sesion')),
        ),
        Container(
          padding: const EdgeInsets.all(5),
          width: 400,
          child: TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ViewRegistrarUser(),
                    ));
              },
              child: const Text('Crear User')),
        ),
      ],
    );
  }

  void _singUp(FirebaseAuthServices loginFirebase) async {
    String correo = _correo.text.trim();
    String password = _password.text.trim();
    User? user = await authServices.signInWithEmailAndPassword(
        context, correo, password);
    if (user != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Color.fromARGB(226, 255, 255, 255),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle,
                size: 30,
                color: Colors.green,
              ),
              Text(
                'Bienvenido !',
                style: TextStyle(color: Colors.green),
              )
            ],
          ),
        ),
      );
      await Future.delayed(const Duration(seconds: 2));
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreens(),
        ),
      );
    }
  }
}
