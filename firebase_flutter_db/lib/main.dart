import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_flutter_db/screens/register_screen.dart';
import 'package:flutter/material.dart';

void main()async {
 
  runApp(const MyApp());
   await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch:Colors.green
      ),
      home: const RegisterScreen()
    );
  }
}

