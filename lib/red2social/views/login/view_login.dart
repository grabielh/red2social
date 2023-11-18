// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:red2social/red2social/infraestructura/service_firebase/services_firebase_login.dart';
import 'package:red2social/red2social/views/home/view_home.dart';
import 'package:red2social/red2social/views/registrar/view_registrar.dart';

class ViewLogin extends StatefulWidget {
  const ViewLogin({super.key});

  @override
  State<ViewLogin> createState() => _ViewLoginState();
}

class _ViewLoginState extends State<ViewLogin> {
  final TextEditingController _correo = TextEditingController();
  final TextEditingController _password = TextEditingController();
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
          padding: const EdgeInsets.all(8.0),
          child: Card(
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
      ),
    );
  }

  Widget _buildIconUser(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 20),
      width: 200,
      height: 200,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 40),
            child: const Icon(
              Icons.verified_user,
              size: 100,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 40),
            child: Text(
              'Login red2 Social',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )
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
              const EdgeInsets.only(top: 40, left: 40, right: 40, bottom: 40),
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(5),
                child: Icon(Icons.people),
              ),
              Container(
                width: 200,
                padding: const EdgeInsets.all(5),
                child: TextField(
                  controller: user,
                  decoration: const InputDecoration(labelText: 'Correo'),
                  keyboardType: TextInputType.emailAddress,
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
                width: 200,
                padding: const EdgeInsets.all(5),
                child: TextField(
                  controller: password,
                  decoration: const InputDecoration(labelText: 'Password'),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                ),
              )
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
              child: const Text('Inicias sesion')),
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
      print('Credenciales correctas Bienvenid !!');
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreens(),
          ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Ingrese datos validos!')));
    }
  }
}
