import 'package:flutter/material.dart';

class ViewRegistrarUser extends StatefulWidget {
  const ViewRegistrarUser({super.key});

  @override
  State<ViewRegistrarUser> createState() => _ViewLoginState();
}

class _ViewLoginState extends State<ViewRegistrarUser> {
  final TextEditingController _user = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(5),
        width: 500,
        height: 900,
        color: Colors.redAccent,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  _buildIconUser(context),
                  _buildInput(context, _user, _password),
                  _buildButton(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildIconUser(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
    width: 200,
    height: 200,
    child: const Icon(
      Icons.verified_user,
      size: 100,
    ),
  );
}

Widget _buildInput(BuildContext context, TextEditingController user,
    TextEditingController password) {
  return Column(
    children: [
      Container(
        margin: const EdgeInsets.only(top: 40, left: 40, right: 40, bottom: 40),
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
                keyboardType: TextInputType.text,
              ),
            )
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.only(top: 40, left: 40, right: 40, bottom: 40),
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
            ),
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.only(top: 40, left: 40, right: 40, bottom: 40),
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
            const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
        width: 400,
        child: ElevatedButton(
            onPressed: () {}, child: const Text('Registrar User')),
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
