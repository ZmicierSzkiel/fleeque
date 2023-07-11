import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:fleeque/data/di/app_locator_impl.dart';
import 'package:fleeque/firebase_options.dart';
import 'package:fleeque/presentation/auth/initial/initial_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fleeque',
      theme: ThemeData(fontFamily: 'Montserrat'),
      home: const InitialScreen(),
    );
  }
}
