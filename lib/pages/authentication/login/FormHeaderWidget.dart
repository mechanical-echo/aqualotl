
// ignore_for_file: file_names

import 'package:flutter/material.dart';


class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });
  final String image, title, subtitle;

  @override
  Widget build(BuildContext context) {
  final Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(image: AssetImage(image), height: size.height * 0.2,),
        Text(title, style: Theme.of(context).textTheme.displayLarge),
        Text(subtitle, style: Theme.of(context).textTheme.displayMedium),
      ],
      
    );
  }
}
