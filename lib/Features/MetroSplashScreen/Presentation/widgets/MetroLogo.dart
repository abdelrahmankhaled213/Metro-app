import 'package:flutter/material.dart';

class MetroLogo extends StatelessWidget {
  const MetroLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        height: 400,
        decoration:  BoxDecoration(
          shape: BoxShape.circle,
          color:  Colors.white,
          image: DecorationImage(
            image: AssetImage(
              "assets/images/img_2.png",
            ),
          ),
        ),
      ),
    );
  }
}
