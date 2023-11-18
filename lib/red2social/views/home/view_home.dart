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
      body: Container(
        margin: const EdgeInsets.only(top: 50),
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 400,
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ViewLogin(),
                        ));
                  },
                  child: const Text('inLogin')),
            ],
          ),
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
