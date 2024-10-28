import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_look/AssignmentHomePage.dart'; // Import the Door class

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false, // Optional: Hide the debug banner
      home: const Assignmenthomepage()
    ); // Use the Door widget
  }
}