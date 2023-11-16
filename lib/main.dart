import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:red2social/firebase_options.dart';
import 'package:red2social/red2social/infraestructura/service_firebase/services_firebase_login.dart';
import 'package:red2social/red2social/views/login/view_login.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const AppRedSolcial());
}

class AppRedSolcial extends StatelessWidget {
  const AppRedSolcial({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FirebaseAuthServices>(
          create: (context) => FirebaseAuthServices(),
        )
      ],
      child: const MaterialApp(
        home: ViewLogin(),
      ),
    );
  }
}
