import 'package:aqualotl/constants/colors.dart';
import 'package:aqualotl/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:water_bottle/water_bottle.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final plainBottleRef = GlobalKey<WaterBottleState>();
  final sphereBottleRef = GlobalKey<SphericalBottleState>();
  final triangleBottleRef = GlobalKey<TriangularBottleState>();
  var waterLevel = 0.5;
  var selectedStyle = 0;
  @override
  Widget build(BuildContext context) {
    final plain = WaterBottle(
        key: plainBottleRef,
        waterColor: Colors.blue.shade300,
        bottleColor: Colors.lightBlue.shade300,
        capColor: Colors.blueGrey.shade200);
    final bottle = Center(
      child: Container(
        width: 140,
        height: 170,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: plain,
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title:
            Text("AQUALOTL", style: Theme.of(context).textTheme.displayMedium),
        centerTitle: true,
        elevation: 0,
        leading: const Icon(Icons.menu, color: Colors.black),
        backgroundColor: Colors.transparent,
        actions: [
          Container(
            child: IconButton(
                onPressed: () {
                  //ICON BUTTON ONPRESSED-----------------------------------
                },
                icon: const Icon(Icons.person_sharp)),
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 40,
            ),
            /**
             * Welcome box and Bottle
             */
            Row(
              children: [
                const SizedBox(width: 25),
                /**
                 * Welcome box
                 */
                Container(
                  width: 140,
                  height: 170,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade200),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Welcome!",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                            "To change water level, use '+' button below the bottle",
                            style: Theme.of(context).textTheme.bodySmall,
                            textAlign: TextAlign.center),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                bottle,
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            /**
             * TIP OF THE DAY AND BUTTON
             */
            Row(
              children: [
                // DIVIDER
                const SizedBox(
                  width: 25,
                ),
                //TEXTBOX
                Container(
                  width: 200,
                  height: 140,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "TIP OF THE DAY:",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                //DIVIDER
                const SizedBox(
                  width: 15,
                ),
                //BUTTON AND TEXT
                Container(
                  width: MediaQuery.of(context).size.width - 50 - 200 - 15,
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade200,
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      // TEXT 1
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 15),
                                        child: Text(
                                          "Please, choose how much water should be added:",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      //Buttons
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
                        ),
                        Text(
                          "Click to \nadd water",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            /**
             * AXOLOTL IMAGE
             */
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                width: MediaQuery.of(context).size.width - 50,
                height: 260,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(25),
                  child: Image(image: AssetImage(splash)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
