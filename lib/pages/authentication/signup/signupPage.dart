// ignore_for_file: use_key_in_widget_constructors, file_names

import 'package:aqualotl/constants/sizes.dart';
import 'package:aqualotl/constants/strings.dart';
import 'package:flutter/material.dart';

import '../../../constants/image_strings.dart';
import '../login/FormHeaderWidget.dart';
import 'SignupFormWidget.dart';

class SignupPage extends StatelessWidget{
  const SignupPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              // ignore: prefer_const_constructors
              FormHeaderWidget(
                image: splash,
                title: signupTitle,
                subtitle: signupSub, 
                ),
                const SignupFormWidget(),
                Column(children: [
                  const Text("OR"),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: (){}, 
                      icon: Image(image: const AssetImage(GoogleLogo), height: MediaQuery.of(context).size.height * 0.05,),
                      label: const Text("Signup with Google"),
                      style: Theme.of(context).outlinedButtonTheme.style,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan( text: "Already have an Account? ", style: Theme.of(context).textTheme.bodySmall),
                          TextSpan( text: "Login".toUpperCase(), style: const TextStyle(color: Colors.blueAccent,fontFamily: 'TiltWarp', fontSize: 19)),
                        ]
                      )
                    )
                    )
                ],)
            ],
            ),
        ),
      )
    );
  }

}
