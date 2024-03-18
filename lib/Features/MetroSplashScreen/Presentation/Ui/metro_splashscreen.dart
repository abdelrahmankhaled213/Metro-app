import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metro_app/Core/Theming/Colors/OurColors.dart';
import 'package:metro_app/Drawer.dart';
import 'package:metro_app/Features/MetroSplashScreen/Presentation/widgets/MetroLogo.dart';


class MetroSplashScreen extends StatefulWidget {
  @override
  State<MetroSplashScreen> createState() => _MetroSplashScreenState();
}

class _MetroSplashScreenState extends State<MetroSplashScreen> {
  @override
  void initState() {
    super.initState();
  Timer(
      Duration(
    seconds: 3
  ), () {
    Get.off(MainScreen(),transition: Transition.fadeIn);
  });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OurColor.mainndrakgreenbutton,
      body: MetroLogo()
    );
  }
}
