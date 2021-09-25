import 'package:flutter/material.dart';
import 'package:smart_patch/CommunityScreen.dart';
import 'package:smart_patch/HomeScreen.dart';
import 'package:smart_patch/ProfileScreen.dart';
import 'package:smart_patch/Responses.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Patch',
      theme: ThemeData( 
        primarySwatch: Colors.red,
      ),
      home: HomeScreen(), 
      //home: ProfileScreen(),
      //home: CommunityScreen(),
    );
  }
}