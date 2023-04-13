// ignore_for_file: file_names, avoid_print

import 'package:aqualotl/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../constants/image_strings.dart';

class OTP extends StatelessWidget {
  const OTP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          const Image(
            image: AssetImage(splash),
            height: 100,
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //const SizedBox(height: 100,),
                Text(
                  "Code\nVerification",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Enter the verification code sent at emailPlaceholder@email.com",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(
                  height: 40,
                ),
                OtpTextField(
                  numberOfFields: 6,
                  fillColor: lBgColor,
                  filled: true,
                  textStyle:
                      const TextStyle(color: lSubTextColor, fontSize: 23),
                  onSubmit: (code) {
                    print("OTP is => $code");
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: Theme.of(context).elevatedButtonTheme.style,
                      onPressed: () {},
                      child: const Text("Next")),
                ),
              ]),
        ],
      ),
    ));
  }
}
