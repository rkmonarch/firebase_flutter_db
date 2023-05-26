import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_flutter_db/widgets/resource/ui_helper.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),

      ),
      body: Column(
        children: [
          TextFormField(

          ),
          TextFormField(

          ),

          ElevatedButton(
            onPressed: ()async{
              final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: "emailAddress@gmail.com",
    password: "password",
  );
  lg.wtf(credential);
              // await FirebaseFirestore.instance.collection('users').add({
              //   'name': 'John Doe',
              //   'age': 30,
              //   'email': ''
              // });
            }, child:const Text("Press Me"),),
        ],
      ),
    );
  }
}