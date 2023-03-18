import 'package:aqualotl/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class LinePainter extends CustomPainter {
  final double lineLength;
  final double maxLitres = 765;
  final double maxSize = 241;
  LinePainter(this.lineLength);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paintFill = Paint()
      ..color = Color.fromRGBO(33, 150, 243, .63)
      ..strokeWidth = 5
      ..style = PaintingStyle.fill;
      Paint paintFillwhite = Paint()
      ..color = Color.fromRGBO(255, 255, 255, .4)
      ..strokeWidth = 5
      ..style = PaintingStyle.fill;
      
    Paint paintLine = Paint()
    ..color = lAccentColor
    ..strokeWidth = 5
    ..style = PaintingStyle.stroke;
    /**
     * background lines 
     */
    var arc1 = Path();
    arc1.moveTo(size.width * 1 / 4, size.height * 1.5 / 12);
    arc1.arcToPoint(
      Offset(size.width * 3 / 4, size.height * 1.5 / 12),
      radius: Radius.circular(150),
      clockwise: false,
    );
    canvas.drawPath(arc1, paintLine);
    var arc2 = Path();
    arc2.moveTo(size.width * 1 / 4, size.height * 10.8 / 12);
    arc2.arcToPoint(
      Offset(size.width * 3 / 4, size.height * 10.8 / 12),
      radius: Radius.circular(150),
      clockwise: true,
    );
    canvas.drawPath(arc2, paintLine);

    /**
     * recatngles
     */
    double waterLevel = lineLength/maxLitres * maxSize;
    
    Offset startPoint = Offset(size.width * 1 / 4, size.height-waterLevel-25);
    Offset endPoint = Offset(size.width * 3 / 4, size.height * 11/12);
    
    var rect = Rect.fromPoints(startPoint, endPoint);
    var rectLine = Rect.fromPoints(Offset(size.width * 1 / 4, size.height * 1.3 / 12), endPoint);
    
    var cap = Rect.fromPoints(
      Offset(size.width * 4/9, size.height * 0.8 /12),
      Offset(size.width * 5/9, size.height * 1.3/12)
    );

    /**
     * wave
     */
    var maxHeight = size.height-waterLevel-25;
    var c = Offset(size.width * 1 / 3 + size.height * 1/24, size.height-waterLevel-25 + size.height * 1/12);
    var c2 = Offset(size.width * 1 / 3 + size.height * 1/24, size.height-waterLevel-25 + size.height * 1/12);
    canvas.drawCircle(c,size.width * 1 / 9, paintFill);
    canvas.drawCircle(c2,size.width * 1 / 9, paintFill);
    
    canvas.drawRRect(RRect.fromRectAndRadius(rect, const Radius.circular(10)), paintFill);
    canvas.drawRRect(RRect.fromRectAndRadius(rectLine, const Radius.circular(10)), paintLine);
    canvas.drawRRect(RRect.fromRectAndRadius(cap, const Radius.circular(3)), paintLine);
  }

  @override
  bool shouldRepaint(LinePainter oldDelegate) {
    return oldDelegate.lineLength != lineLength;
  }
}


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _lineLength = 200;

  @override
  Widget build(BuildContext context) {
    final litres = 765.0;
    double userLevel = 380.0;
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Center(
              child: SleekCircularSlider(
                appearance: CircularSliderAppearance(
                  size: 350,
                  startAngle: 90,
                  angleRange: 180,
                  
                  customWidths: CustomSliderWidths(
                    progressBarWidth: 20,
                  ),
                  infoProperties: InfoProperties(
                    mainLabelStyle: const TextStyle(
                      fontSize: 78,
                      fontFamily: 'TiltWarp',
                      color: lAccentColor
                    ),
                    bottomLabelText: "Water",
                    modifier: (percentage) {
                      return percentage.toStringAsFixed(0)+" ml";
                    },
                  ),
                ),
                initialValue: userLevel,
                min: 0,
                max: litres,
                onChange: (value) {
                  print(value);
                  setState(() {
                    _lineLength = value;
                  });
                },
              ),
            ),
            Center(
              child: CustomPaint(
                painter: LinePainter(_lineLength),
                size: Size(225, 300),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
