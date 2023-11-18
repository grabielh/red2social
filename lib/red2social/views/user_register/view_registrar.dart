// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:red2social/red2social/infraestructura/service_firebase/services_firebase_login.dart';
import 'package:red2social/red2social/views/home/view_home.dart';

class ViewRegistrarUser extends StatefulWidget {
  const ViewRegistrarUser({super.key});

  @override
  State<ViewRegistrarUser> createState() => _ViewLoginState();
}

class _ViewLoginState extends State<ViewRegistrarUser> {
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _correo = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final FirebaseAuthServices authServices = FirebaseAuthServices();

  @override
  void dispose() {
    super.dispose();
    _correo.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(5),
        width: 500,
        height: 900,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 10),
          child: Card(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  _buildIconUser(context),
                  _buildInput(context, _correo, _password, _userName),
                  _buildButton(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIconUser(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 20),
      width: 200,
      height: 200,
      child: const Icon(
        Icons.verified_user,
        size: 100,
        color: Colors.green,
      ),
    );
  }

  Widget _buildInput(BuildContext context, TextEditingController correo,
      TextEditingController password, TextEditingController userName) {
    return Column(
      children: [
        Container(
          margin:
              const EdgeInsets.only(top: 20, left: 40, right: 40, bottom: 40),
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(5),
                child: Icon(Icons.people),
              ),
              Container(
                width: 250,
                padding: const EdgeInsets.all(5),
                child: TextField(
                  controller: userName,
                  decoration: InputDecoration(
                      labelText: 'userName',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  keyboardType: TextInputType.text,
                ),
              )
            ],
          ),
        ),
        Container(
          margin:
              const EdgeInsets.only(top: 40, left: 40, right: 40, bottom: 40),
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(5),
                child: Icon(Icons.people),
              ),
              Container(
                width: 250,
                padding: const EdgeInsets.all(5),
                child: TextField(
                  controller: correo,
                  decoration: InputDecoration(
                      labelText: 'Correo',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin:
              const EdgeInsets.only(top: 40, left: 40, right: 40, bottom: 40),
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(5),
                child: Icon(Icons.people),
              ),
              Container(
                width: 250,
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

  Widget _buildButton(BuildContext context) {
    return Column(
      children: [
        Container(
          padding:
              const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
          width: 400,
          child: ElevatedButton(
              onPressed: _singUp, child: const Text('Registrar User')),
        ),
        Container(
          padding: const EdgeInsets.all(5),
          width: 400,
          child: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Regresar')),
        ),
      ],
    );
  }

  void _singUp() async {
    String correo = _correo.text.trim();
    String password = _password.text.trim();
    User? user = await authServices.signUpWithEmailAndPassaword(
        context, correo, password);
    if (user != null) {
      print('User registrado Correctamente!');
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreens(),
          ));
    } else {
      print('Error no se registro el usuario');
    }
  }
}
