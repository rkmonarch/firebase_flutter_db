import 'package:firebase_flutter_db/screens/register_screen.dart';
import 'package:firebase_flutter_db/widgets/resource/app_colors.dart';
import 'package:firebase_flutter_db/widgets/resource/ui_helper.dart';
import 'package:firebase_flutter_db/widgets/responsive.dart';
import 'package:firebase_flutter_db/widgets/textfield.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: deviceWidth(context) * 0.05),
        child: Column(
          children: [
            vSpaceMedium(context),
         const   FlutterLogo(
          size: 250,
         ),
      vSpaceMedium(context),
      Textfield(controller: _emailController,lableText: "Email*",maxlines: 1,inputType: TextInputType.emailAddress,width: deviceWidth(context),),
     
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
                                                color: AppColors.background,
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
    );
  }
}