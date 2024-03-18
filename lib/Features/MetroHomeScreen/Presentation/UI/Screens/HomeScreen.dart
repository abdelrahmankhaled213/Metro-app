import 'package:metro_app/Core/Theming/textstyles.dart';
import 'package:metro_app/Features/MetroHomeScreen/Presentation/Logic/functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metro_app/Core/Helpers/sqlhelper.dart';
import 'package:metro_app/Core/Theming/Colors/OurColors.dart';
import 'package:metro_app/Core/Widgets/DropDownMenu.dart';
import 'package:metro_app/Core/Widgets/OurCustomButton.dart';
import 'package:metro_app/Features/MetroHomeScreen/Presentation/UI/Widgets/CustomAnimatedContainer.dart';
class HomeScreen extends StatelessWidget {
var state=true.obs;
var visState=false.obs;
 var no_stations=0;
 String price="";
 int ticketprice=0;
  var startindex=0;
  var endindex=0;
  var counter=0;
  var valuechosenstart="please select".obs;
  var valuechosenend="please select".obs;
  var result="".obs;
  var h=0.0.obs;
 List<String>sublist1=[];
 List<String> sublist2=[];
   List<String>finaltrip=[];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomDropMenuItem(
              circularsize: 25,
              onchanged: (selecteditem){
                valuechosenstart.value=selecteditem!;
              },
              selected:
              Obx( ()=>
                  Text(valuechosenstart.value,style:OurStyle.w400black
              ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomDropMenuItem(
              circularsize: 25,
              onchanged: (selecteditem) {
                valuechosenend.value=selecteditem!;
              },
              selected: Obx(
                      ()=> Text(valuechosenend.value,style: OurStyle.w400black
                      )
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height/21
            ),
            CustomButton(
              color: OurColor.mainndrakgreenbutton,
              onclick: () async {
selectedOrNot(valuechosenstart, valuechosenend, h);
selectedInFirstEqualSecond(valuechosenstart, valuechosenend, h, result);
sendNotificationOpeningOnMap(valuechosenend);
checkMetroLines(
    finaltrip: finaltrip,
    counter: counter,
    sublist2: sublist2,
    valuechosenstart: valuechosenstart,
    valuechosenend: valuechosenend,
    startindex: startindex, endindex: endindex, nostation: no_stations,
    valueChosenStart: valuechosenstart,
    valueChosenEnd: valuechosenend,
    price: price,
    result: result, ticketprice: ticketprice, sublist1: sublist1);
                h.value=MediaQuery.of(context).size.height;
                visState.value=true;
                final id=await DataBaseHelper.insertData('''
                      INSERT INTO 'Metro'('from','to','trip')  
                      VALUES ('${valuechosenstart.value}','${valuechosenend.value}','${result.value}'); '''
                );
              },
              text: "go",
            ),
                    Expanded(
                      child: SingleChildScrollView(
                        child:CustomAnimatedContainer(result: result,h: h,)
                      ),
                    )
          ],
        ),
      ),
    );
  }
}