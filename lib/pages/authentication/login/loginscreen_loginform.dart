
// ignore_for_file: prefer_const_constructors

import 'package:aqualotl/constants/colors.dart';
import 'package:aqualotl/pages/HomePage/homepage.dart';
import 'package:aqualotl/pages/forgot%20password/OTP.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/image_strings.dart';
import '../../../constants/strings.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });
  
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Form(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person_outline_outlined),
                labelText: "Email",
                hintText: "Email",
                border: OutlineInputBorder(),
                focusColor: lSubTextColor,
                fillColor: lSubTextColor,
                labelStyle: TextStyle(color: lSubTextColor),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 2.0, color: lSubTextColor))
              ),
            ),
            SizedBox(height: 30),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.fingerprint_sharp),
                labelText: "Password",
                hintText: "Password",
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: null,
                  icon: Icon(Icons.remove_red_eye_sharp),
                  ),
                labelStyle: TextStyle(color: lSubTextColor),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 2.0, color: lSubTextColor))
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight, 
              child: TextButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context, 
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    builder: (context) => Container(
                        height: height*0.7,
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //Text("Forgot your password?", style: Theme.of(context).textTheme.displayLarge,),
                            //const SizedBox(height: 10,),
                            Text(
                              "Forgot? No worries! You can restore access to your account easily using email", 
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            const SizedBox(height: 20,),
                            //ForgetPasswordButtonWidget(onTap: () {},)
                            Form(child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextFormField(
                                  decoration: InputDecoration(
                                    label: Text("Email"),
                                    hintText: "Email",
                                  ),
                                ),
                                const SizedBox(height: 25,),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Get.to(OTP());
                                    },
                                    style: Theme.of(context).elevatedButtonTheme.style, 
                                    child: Text("Next step"),
                                    ),
                                ),
                                const SizedBox(height: 25,),
                                Image(image: AssetImage(splash), width: width*0.5,)
                              ],
                            ))
                          ]
                        ),
                      
                    ),
                  );
                }, 
                child: Text("Forgot password"), 
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){
                  // Get.to(HomePage());
                  Navigator.pushReplacementNamed(context, '/home');
                },
                child: Text(login.toUpperCase()),
              ),
            ),
          ]
        ),
      ),
    );
  }
}

class ForgetPasswordButtonWidget extends StatelessWidget {
  const ForgetPasswordButtonWidget({
    super.key,
    required this.onTap
  });
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: lBgColor,
        ),
        child: Row(
          children: [
            const Icon(Icons.mail_outline_rounded, size: 60,),
            SizedBox(width: 20,),
            Column(
              children: [
                Text("Reset via Email", style: Theme.of(context).textTheme.bodySmall,),
                
              ],
              )
          ],
        ),
      ),
    );
  }
}