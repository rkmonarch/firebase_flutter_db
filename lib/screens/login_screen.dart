import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_flutter_db/screens/register_screen.dart';
import 'package:firebase_flutter_db/services/auth_methods.dart';
import 'package:firebase_flutter_db/widgets/button.dart';
import 'package:firebase_flutter_db/widgets/resource/app_colors.dart';
import 'package:firebase_flutter_db/widgets/resource/ui_helper.dart';
import 'package:firebase_flutter_db/widgets/responsive.dart';
import 'package:firebase_flutter_db/widgets/textfield.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
      final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: deviceWidth(context) * 0.05),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                vSpaceMedium(context),
             const   FlutterLogo(
              size: 250,
             ),
                vSpaceMedium(context),
                Textfield(controller: _emailController,lableText: "Email*",maxlines: 1,inputType: TextInputType.emailAddress,width: deviceWidth(context),),
                vSpaceMedium(context),
                Textfield(controller: _passwordController,lableText: "Password*",maxlines: 1,inputType: TextInputType.visiblePassword,width: deviceWidth(context),),
                vSpaceMedium(context),
               Button(
                text: "Login",
                ontap: (){
                if (_formKey.currentState!.validate()) {
            AuthMethods().logInUser(email: _emailController.text, password: _passwordController.text).then((value) {
                  lg.wtf(value);
                
                  var data =  FirebaseFirestore.instance.collection('users').doc('ThFiIkObh9X3giUheKNKFbvjD5E2').get().then((value) {
            lg.wtf(value.data());
                  });
                  
                  });
                }
               }),
                vSpaceMedium(context),
               Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                    const RegisterScreen()));
                                        },
                                        child: RichText(
                                          text:  TextSpan(
                                              text: 'New User?  ',
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                              children: [
                                                TextSpan(
                                                  text: 'SignUp',
                                                  style: TextStyle(
                                                    color: AppColors.black,
                                                    decoration:
                                                        TextDecoration.underline,
                                                  ),
                                                  //  recognizer: new TapGestureRecognizer()..onTap = () => print('Tap Here onTap'),
                                                )
                                              ]),
                                        ),
                                      ),
                                    ],
                                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}