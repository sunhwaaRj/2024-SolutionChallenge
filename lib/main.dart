import 'package:flutter/material.dart';
import 'package:abler_project/screens/home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:abler_project/firebase_options.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, snapshot) {
        return const MaterialApp(
          title: 'Abler',
          debugShowCheckedModeBanner: false,
          home: MyHomePage(),
        );
      },
    );
  }
}
