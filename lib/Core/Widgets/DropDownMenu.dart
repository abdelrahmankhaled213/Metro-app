import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metro_app/Features/MetroHomeScreen/Data/metro%20_lines.dart';
class CustomDropMenuItem extends StatelessWidget {
var selecteditem="please select".obs;
double?circularsize;
void Function(String?)?onchanged;
Widget selected;
 CustomDropMenuItem({
   required this.circularsize,
   required this.onchanged,
   required this.selected
});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: DropdownButton(

        elevation: 20,
        borderRadius: BorderRadius.circular(circularsize!),
        items: MetroLines.alllines.map(
                (e) =>
                    DropdownMenuItem(
                      value: e,
                        child: Text(e,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    )
      )
      ).toList(),

        onChanged: onchanged,
        underline: const SizedBox(height: 3),
        hint:Padding(
          padding: const EdgeInsets.only(left: 5),
          child:selected
        ),
        isExpanded: true,
      ),
    );
  }
}
