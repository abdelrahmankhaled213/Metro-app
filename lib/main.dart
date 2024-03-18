import 'package:connection_notifier/connection_notifier.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:metro_app/Features/MetroSplashScreen/Presentation/Ui/metro_splashscreen.dart';
import 'package:sqflite/sqflite.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Metro app',
    home: MetroSplashScreen()
    );
  }
}