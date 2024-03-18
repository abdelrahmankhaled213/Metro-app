import 'package:flutter/material.dart';
import 'package:metro_app/Core/Theming/textstyles.dart';
class CustomButton extends StatelessWidget {
 String? text;
 Function() ?onclick;
 Color?color;
CustomButton({
   this.text,
  this.onclick,
  this.color
});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(onPressed:onclick, child:
      Text(text!,style: OurStyle.w400black,),
        style: ButtonStyle(

          elevation:  MaterialStateProperty.all(10),
          backgroundColor: MaterialStateProperty.all(color),
      animationDuration: const Duration(seconds: 3),
        ),
      ),
    );
  }
}
