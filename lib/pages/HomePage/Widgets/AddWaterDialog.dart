import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/image_strings.dart';
import '../homepage.dart';

class AddWaterDialog extends StatelessWidget {
  const AddWaterDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        //------------------------------------------DIALOG WINDOW WITH BUTTONS

        showDialog(
          context: context,
          builder: (context) => Dialog(
            alignment: Alignment.center,
            elevation: 2,
            child: Container(
              width: 200,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // TEXT 1
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    child: Text(
                      "Please, choose how much water should be added:",
                      style: Theme.of(context).textTheme.bodySmall,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  //Buttons
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Image(image: AssetImage(glass))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      icon: const Icon(
        Icons.add_box_outlined,
        color: lSubTextColor,
        size: 40,
      ),
    );
  }
}
