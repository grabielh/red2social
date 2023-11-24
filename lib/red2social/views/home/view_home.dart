import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:red2social/red2social/views/home/home_options/view_add_optiontwo/view_add_optiontwo.dart';
import 'package:red2social/red2social/views/home/home_options/view_home_optionone/view_home_optionone.dart';
import 'package:red2social/red2social/views/home/home_options/view_people_optionthree/view_people_optionthree.dart';
import 'package:red2social/red2social/views/user_login/view_login.dart';
import 'package:red2social/red2social/views/themes/theme_notifer.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({super.key});

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  bool modeDarkLuz = true;
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Views '),
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.amber),
      ),
      //Menu de opciones !
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
                border: Border.all(color: Colors.amber),
                borderRadius: BorderRadius.circular(8.0),
              ),
              width: 300,
              margin: const EdgeInsets.only(top: 5),
              child: TextButton(
                onPressed: () {
                  _showIsLoggingOut(context);
                },
                child: const Text(
                  'inLogin',
                  style: TextStyle(color: Colors.amber),
                ),
              ),
            ),
            const Gap(100),
            Switch(
              value: modeDarkLuz,
              onChanged: (value) {
                setState(() {
                  modeDarkLuz = !modeDarkLuz;
                });
                themeNotifier.toggleTheme();
              },
            )
          ],
        ),
      ),
      //body ... Contenido principal Views !
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Card(
          child: Column(
            children: [
              SizedBox(
                height: 50,
                child: BottomNavigationBar(
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.person,
                        size: 20,
                      ),
                      label: 'Contactos',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.group,
                        size: 20,
                      ),
                      label: 'Grupos',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.stacked_line_chart,
                        size: 20,
                      ),
                      label: 'Galeria',
                    ),
                  ],
                  currentIndex: _currentIndex,
                  onTap: (index) {
                    setState(() {
                      _currentIndex = index;
                      _pageController.animateToPage(index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut);
                    });
                  },
                ),
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: const SizedBox(
                        width: 380,
                        height: 700,
                        child: ViewHomeOptiontwo(),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: const SizedBox(
                        width: 380,
                        height: 700,
                        child: ViewHomeOptionthree(),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: const SizedBox(
                        width: 380,
                        height: 700,
                        child: ViewHomeOptionone(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _showIsLoggingOut(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return const AlertDialog(
        content: Row(
          children: [
            CircularProgressIndicator(),
            SizedBox(width: 20),
            Text('Cerrando sesión...'),
          ],
        ),
      );
    },
  );

  Future.delayed(const Duration(seconds: 2), () {
    FirebaseAuth.instance.signOut().then((_) {
      Navigator.of(context).pop(); // Cierra el diálogo de carga

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ViewLogin()),
      );
    }).catchError((error) {
      print("Error al cerrar sesión: $error");
      Navigator.of(context)
          .pop(); // Cierra el diálogo de carga en caso de error
    });
  });
}
