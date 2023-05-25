import 'package:cloud_firestore/cloud_firestore.dart';
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
      appBar: AppBar(),
      body: Column(
        children: [
          TextFormField(

          ),
          TextFormField(

          ),

          ElevatedButton(
            onPressed: ()async{
              await FirebaseFirestore.instance.collection('users').add({
                'name': 'John Doe',
                'age': 30,
                'email': ''
              });
            }, child:const Text("Press Me"),),
        ],
      ),
    );
  }
}