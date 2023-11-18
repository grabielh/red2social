import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:red2social/firebase_options.dart';
import 'package:red2social/red2social/infraestructura/service_firebase/services_firebase_login.dart';
import 'package:red2social/red2social/views/login/view_login.dart';
import 'package:red2social/red2social/views/themes/theme_notifer.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const AppRedSolcial());
}

class AppRedSolcial extends StatefulWidget {
  const AppRedSolcial({super.key});

  @override
  State<AppRedSolcial> createState() => _AppRedSolcialState();
}

class _AppRedSolcialState extends State<AppRedSolcial> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FirebaseAuthServices>(
          create: (context) => FirebaseAuthServices(),
        ),
        ChangeNotifierProvider<ThemeNotifier>(
          create: (context) => ThemeNotifier(),
        ),
      ],
      child: Consumer<ThemeNotifier>(
        builder: (context, themeNotifier, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: themeNotifier.isDarkMode
                  ? const ColorScheme.highContrastDark(primary: Colors.amber)
                  : const ColorScheme.highContrastLight(
                      secondary: Colors.black, primary: Colors.amber),
            ),
            home: const ViewLogin(),
          );
        },
      ),
    );
  }
}
