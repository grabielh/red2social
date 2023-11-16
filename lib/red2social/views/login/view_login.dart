import 'package:flutter/material.dart';
import 'package:red2social/red2social/views/registrar/view_registrar.dart';

class ViewLogin extends StatefulWidget {
  const ViewLogin({super.key});

  @override
  State<ViewLogin> createState() => _ViewLoginState();
}

class _ViewLoginState extends State<ViewLogin> {
  final TextEditingController _corre = TextEditingController();
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
                  _buildInput(context, _corre, _password),
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
            )
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
            onPressed: () {}, child: const Text('Inicias sesion')),
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
