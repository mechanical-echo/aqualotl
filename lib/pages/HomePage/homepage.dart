import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _progressValue = 50.0;

  void _incrementProgressValue(double howMuch) {
    setState(() {
      _progressValue += howMuch;
    });
  }

  void _openAddDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add'),
          content: Text('Do you want to add 10% to the progress indicator?'),
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
                _incrementProgressValue(10);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aqualotl"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(
              value: _progressValue / 100,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _openAddDialog,
              child: Text('Add 10%'),
            ),
          ],
        ),
      ),
    );
  }
}
