import 'package:firebase_flutter_db/widgets/button.dart';
import 'package:firebase_flutter_db/widgets/resource/ui_helper.dart';
import 'package:firebase_flutter_db/widgets/responsive.dart';
import 'package:firebase_flutter_db/widgets/textfield.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Register Screen"),
        elevation: 1.5,
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: deviceWidth(context)*0.05),
        child: Column(
          children: [
            vSpaceMedium(context),
            Textfield(controller: _emailController, maxlines: 1, inputType: TextInputType.emailAddress, lableText: "Email*", width: deviceWidth(context)),
            vSpaceMedium(context),
            Textfield(controller: _passwordController, maxlines: 1, inputType: TextInputType.visiblePassword, lableText: "Password*", width: deviceWidth(context)),
            vSpaceMedium(context),
            Button(
              text: "Register",
              ontap: ()async{
                
              },
            )
          ],
        ),
      ),
    );
  }
}