import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:red2social/red2social/views/login/view_login.dart';
import 'package:red2social/red2social/views/themes/theme_notifer.dart';

class HomeScreens extends StatelessWidget {
  const HomeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
            color: Colors.amber), // Cambia el color del icono del Drawer aquí
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                  top: 60, left: 20, right: 20, bottom: 20),
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
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.amber), // Define el borde
                borderRadius:
                    BorderRadius.circular(8.0), // Ajusta el radio del borde
              ),
              width: 300,
              margin: const EdgeInsets.only(top: 5),
              child: TextButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ViewLogin(),
                    ),
                  );
                },
                child: const Text(
                  'inLogin',
                  style: TextStyle(color: Colors.amber),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: IconButton(
          onPressed: () {
            themeNotifier.toggleTheme();
          },
          icon: const Icon(Icons.nights_stay)),
    );
  }
}
