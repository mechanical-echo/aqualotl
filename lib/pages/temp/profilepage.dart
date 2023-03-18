// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../../main.dart';
class ProfilePage extends StatefulWidget{
  const ProfilePage({Key? key}) : super(key: key);
  
  @override
  State<StatefulWidget> createState() => _ProfilePageState();

}

class _ProfilePageState extends State<ProfilePage>{
  final methods m = methods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade50,
        elevation: 0,
        title: Text('ProfilePage', style: TextStyle(fontSize: 40, fontFamily: 'TiltNeon', color: Colors.blue)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(
                  width: 12, height: 120,
                  
                )
              ],
            )
          ),
      ),
      backgroundColor: Colors.blueGrey.shade50,
      bottomNavigationBar: CurvedNavigationBar(
        index: 3,
        backgroundColor: Colors.blueGrey.shade50,
        color: Colors.white,
        animationDuration: Duration(milliseconds: 300),

        onTap: (index){
          m.openPage(index, context);
        },
        items: [
        Icon(Icons.battery_0_bar),
        Icon(Icons.gamepad),
        Icon(Icons.water_drop_outlined),
        Icon(Icons.person_outlined),
        Icon(Icons.settings),
      ],
      ),
        
    );
  }
}
/*
class _ProfilePageState extends State<ProfilePage>{
  final methods m =new methods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('ProfilePage', style: TextStyle(fontSize: 40, fontFamily: 'TiltNeon', color: Colors.blue)),
      ),

      backgroundColor: Colors.blueGrey.shade50,
      bottomNavigationBar: CurvedNavigationBar(
        index: 3,
        backgroundColor: Colors.blueGrey.shade50,
        color: Colors.white,
        animationDuration: Duration(milliseconds: 300),

        onTap: (index){
          m.openPage(index, context);
        },
        items: [
        Icon(Icons.battery_0_bar),
        Icon(Icons.gamepad),
        Icon(Icons.water_drop_outlined),
        Icon(Icons.person_outlined),
        Icon(Icons.settings),
      ],
      ),
    );
  }}
*/
