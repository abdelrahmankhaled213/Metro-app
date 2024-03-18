import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metro_app/Core/Theming/Colors/OurColors.dart';

class CustomAnimatedContainer extends StatelessWidget {
 RxString result;
Rx<double>h;
CustomAnimatedContainer({
   required this.h,
  required this.result
});

  @override
  Widget build(BuildContext context) {
    return  Obx(
      () =>
       AnimatedContainer(
          curve: Curves.ease,
          height: h.value,
          duration: const Duration(
              seconds: 1
          ),

          padding: const EdgeInsets.only(
              left: 12,
              top: 12
          ),
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.topLeft,
                colors: [
                  OurColor.mainndrakgreenbutton,
                  Colors.transparent
                ],
              ),
              border:Border.all(color: Colors.black) ,
              borderRadius:  BorderRadius.circular(25)
          ),
          child: Text(result.value,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          )
      ),
    );
  }
}
