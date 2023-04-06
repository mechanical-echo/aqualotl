import 'package:aqualotl/constants/colors.dart';
import 'package:aqualotl/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:water_bottle/water_bottle.dart';
import 'Widgets/AddWaterDialog.dart';

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
  int currentWaterLevel = 0;
  final maxWaterLevel = 2700;
  double progress = 0;
  double _progressValue = 0.0;

  void _incrementProgressValue(int howMuch) {
    setState(() {
      currentWaterLevel += howMuch;
      print(currentWaterLevel.toString() + "/" + maxWaterLevel.toString());
      print(currentWaterLevel / maxWaterLevel);
      _progressValue = (currentWaterLevel / maxWaterLevel);
      if (_progressValue > 1) {
        _progressValue = 1;
        currentWaterLevel = maxWaterLevel;
      }
      print(_progressValue);
    });
  }

  void _openInputDialog() {
    String inputValue = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter a value'),
          content: TextFormField(
            onChanged: (value) {
              inputValue = value;
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Enter a value to add',
            ),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                int? valueToAdd = int.tryParse(inputValue);
                _incrementProgressValue(valueToAdd!);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _openAddDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add'),
          content: Text('Please, choose how much water must be added:'),
          actions: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          IconButton(
                              onPressed: () {
                                _incrementProgressValue(250);
                                Navigator.of(context).pop();
                              },
                              icon: const Image(
                                image: AssetImage(glass),
                              )),
                          Text(
                            "250ml  ",
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                              onPressed: () {
                                _incrementProgressValue(300);
                                Navigator.of(context).pop();
                              },
                              icon: const Image(
                                image: AssetImage(cup),
                              )),
                          Text(
                            "300ml  ",
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                              onPressed: () {
                                _incrementProgressValue(500);
                                Navigator.of(context).pop();
                              },
                              icon: const Image(
                                image: AssetImage(measuring),
                              )),
                          Text(
                            "500ml  ",
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                _openInputDialog();
                                //_incrementProgressValue();
                              },
                              icon: const Image(
                                image: AssetImage(edit),
                              )),
                          Text(
                            "Other..",
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          TextButton(
                            child: Text('Cancel'),
                            style: Theme.of(context).textButtonTheme.style,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            /** 
            TextButton(
              child: Text('Add'),
              onPressed: () {
                _incrementProgressValue();
                Navigator.of(context).pop();
              },
            ),*/
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final phoneW = MediaQuery.of(context).size.width;
    final phoneH = MediaQuery.of(context).size.height;
    progress = currentWaterLevel / maxWaterLevel;

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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  WelcomeBox(phoneW: phoneW, phoneH: phoneH),
                  const Divider15(),
                  ProgressCircle(phoneH: phoneH, progress: _progressValue),
                ],
              ),
            ),
            const Divider15Vertical(),
            /**
             * TIP OF THE DAY AND BUTTON
             */
            Row(
              children: [
                const Divider25(),
                const TipOfTheDay(),
                const Divider15(),
                Container(
                  width: MediaQuery.of(context).size.width - 50 - 200 - 15,
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade200,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: _openAddDialog,
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
                ),
              ],
            ),
            const Divider15Vertical(),
            /**
             * AXOLOTL IMAGE
             */
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: FooterImage(),
            ),
          ],
        ),
      ),
    );
  }
}

class Divider15Vertical extends StatelessWidget {
  const Divider15Vertical({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 15,
    );
  }
}

class FooterImage extends StatelessWidget {
  const FooterImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

class TipOfTheDay extends StatelessWidget {
  const TipOfTheDay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

class Divider25 extends StatelessWidget {
  const Divider25({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 25,
    );
  }
}

class Divider15 extends StatelessWidget {
  const Divider15({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 15,
    );
  }
}

class ProgressCircle extends StatelessWidget {
  const ProgressCircle({
    super.key,
    required this.phoneH,
    required this.progress,
  });

  final double phoneH;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: phoneH * 0.22,
      height: phoneH * 0.22,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey.shade200),
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: SizedBox(
          child: Stack(
            fit: StackFit.expand,
            children: [
              CircularProgressIndicator(
                value: progress,
                backgroundColor: Colors.grey,
                color: lAccentColor,
                strokeWidth: 15,
              ),
              Center(
                child: Text(
                  ((progress * 100).toStringAsFixed(0) + "%"),
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WelcomeBox extends StatelessWidget {
  const WelcomeBox({
    super.key,
    required this.phoneW,
    required this.phoneH,
  });

  final double phoneW;
  final double phoneH;

  @override
  Widget build(BuildContext context) {
    return Container(
      //--------------------------box---------------------------
      width: phoneW * 0.35,
      height: phoneH * 0.22,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey.shade200),
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
    );
  }
}
