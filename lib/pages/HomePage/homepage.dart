// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, depend_on_referenced_packages, library_private_types_in_public_api

import 'package:aqualotl/constants/colors.dart';
import 'package:aqualotl/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';


class HomePage extends StatefulWidget{
   const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  // Widget slider = SleekCircularSlider(
  //             appearance: CircularSliderAppearance(
  //               startAngle: 90,
  //               customWidths: CustomSliderWidths(progressBarWidth: 10),
  //               customColors: CustomSliderColors(
  //                 dynamicGradient: true, 
  //                 dotColor: Colors.transparent 
  //                 ),
  //               size: 340,
  //               infoProperties: InfoProperties(
  //                 topLabelText: "Water level:",
                  
  //               )
  //             ),
  //             initialValue: 765,
  //             max: 765,
  //             min: 0,
  //             onChange: (double value) {
  //               print(value);
  //             });
  @override
  Widget build(BuildContext context){
    final litres = 765.0;
    final trackColors = [
      Colors.indigo.shade900,
      Colors.blueAccent,
      Colors.blueAccent.shade100
    ];
    double waterLevel = litres;
    return  Scaffold(
      body: Column(
        children: [
          // SizedBox(height: 100,),
          // SleekCircularSlider(
          //   max: litres,
          //   initialValue: 0,
          //   appearance: CircularSliderAppearance(
          //     size: 250,
          //     angleRange: 360,
          //     customWidths: CustomSliderWidths(progressBarWidth: 10),
          //     customColors: CustomSliderColors(progressBarColors: trackColors, dynamicGradient: true)
          //   ),
          //   min: 0,
          //   onChange: (value) {
          //     setState(() {
          //       waterLevel = value;
          //       WaterLevelBottle1(waterLevel, litres);
          //     });
          //     print("waterLevel = "+waterLevel.toString());
          //   },
          // ),
          Center(
            child:Stack(
            children: [
              Container(
                      width: 225,
                      height: 280,
                      child: Image(image: AssetImage(bottleBack)),
                    ),
              Container(
                width: 225,
                height: 300,
                  child: CustomPaint(
                  // foregroundPainter: WaterLevelBottle1(waterLevel,litres),
                ),
              ),
              Container(
                      width: 225,
                      height: 280,
                      child: Image(image: AssetImage(bottleFront)),
                    ),
            ],
          ),
        ),
         Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Slider(
              value: waterLevel,
              min: 0,
              max: litres,
              onChanged: (value) {
                setState(() {
                  waterLevel = value;
                });
              },
            ),
            SizedBox(height: 20),
            CustomPaint(
              painter: LinePainter(waterLevel),
              size: Size(double.infinity, 200),
            ),
          ],
        ),
      ],
    ),        
  );
}
  
}
  // class WaterLevelBottle1 extends CustomPainter {
  // final double waterLevel;
  // final double maxWaterLevel;
  // final double maxWaterLevelHeight = 241;
  

  // WaterLevelBottle1(this.waterLevel, this.maxWaterLevel);
  
  // @override
  // void paint(Canvas canvas, Size size) {
  //   final double waterHeight = (waterLevel/maxWaterLevel) * maxWaterLevelHeight;  
  //   final paint = Paint()
  //   ..color = Color.fromARGB(161, 46, 109, 255)
  //   ..strokeWidth = 5
  //   ..style = PaintingStyle.fill;
  //   /**
  //    * Rounded rect
  //    */
  //   var aRR = Offset(size.width * 1 / 3, size.height - waterHeight - 25);
  //   var bRR = Offset(size.width * 2 / 3, size.height * 11 / 12);
  //   final rectangle = Rect.fromPoints(aRR, bRR);
  //   final radius = Radius.circular(10);
  //   canvas.drawRRect(RRect.fromRectAndRadius(rectangle, radius), paint);
  // }
  
  // @override
  // bool shouldRepaint(WaterLevelBottle1 oldDelegate) {
  //   print("shouldRepaint = "+(oldDelegate.waterLevel != waterLevel).toString());
  //   return oldDelegate.waterLevel != waterLevel;
  // }

  // }

class LinePainter extends CustomPainter {
  final double lineLength;

  LinePainter(this.lineLength);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 5;

    Offset startPoint = Offset(size.width / 2 - lineLength / 2, size.height / 2);
    Offset endPoint = Offset(size.width / 2 + lineLength / 2, size.height / 2);

    canvas.drawLine(startPoint, endPoint, paint);
  }

  @override
  bool shouldRepaint(LinePainter oldDelegate) {
    return oldDelegate.lineLength != lineLength;
  }
}
