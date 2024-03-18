import 'package:connection_notifier/connection_notifier.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:metro_app/Core/Theming/Colors/OurColors.dart';
import 'package:metro_app/Core/Widgets/OurCustomButton.dart';
import 'package:metro_app/Features/MetroHomeScreen/Data/Metro_lat_and_long.dart';
import 'package:metro_app/Features/MetroHomeScreen/Presentation/Logic/functions.dart';
import 'package:geocoding/geocoding.dart';
class NearStation extends StatelessWidget {
  late double distance_from_my_loc_to_nearststation;
  late String stationname;
var value="".obs;
late var result2;
var switchstate=false.obs;
var state2=true.obs;
var state=true.obs;
var h=0.0.obs;
late  String whichline ;
late var whichlist;
late int index;
late Position myloc;
var duration=0.0.obs;
var cont=TextEditingController();
var array=<String>[];
late double result;
var name="";
var isfinishedprogress=true.obs;
var initaldistance=50.0;
late List<Location>typedloc;
  @override
  Widget build(BuildContext context) {
    return ConnectionNotifier(
      connectionNotificationOptions: const ConnectionNotificationOptions(
        connectedBackgroundColor: Colors.transparent,
        height: 30,
      ),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width/1,
                    height: 50,
                    child: TextFormField(
                      controller:cont ,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                       cursorColor:  Colors.white,
                      decoration: InputDecoration(

                        focusedBorder: const OutlineInputBorder(
                           borderSide:  BorderSide(color: Colors.black)
                        ),
                        suffixIcon: IconButton(onPressed: ()async => cont.text="",icon: const Icon(Icons.clear)),
                        hintText: "type here",

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            style: BorderStyle.solid
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(color: OurColor.mainndrakgreenbutton,onclick: ()async {
                    if(switchstate.value==true){
                      Get.snackbar("metro", "please close the nearst location from your home");
                      return;
                    }
                    if(value.value.isEmpty){
                      state.value=false;
                      showDialog(
                        context: context, builder: (context) =>
                          Visibility(
                        visible: state.value,
                        child: const Center(
                          child: const CircularProgressIndicator(
                            backgroundColor: OurColor.mainndrakgreenbutton,
                            color: Colors.white
                            ,
                          ),
                        ),
                      ),);
                    }
                    h.value=MediaQuery.of(context).size.height/1.5;
                    state2.value=true;
                    initaldistance = 50.0;
                    if (cont.text == "") {
                      state.value=false;
                      Get.snackbar("error", "the textfield is empty");
                      value.value="";
                      h.value=0;
                      return ;
                    }
                    if (cont.text.length < 10) {
                      Get.snackbar("error", "the address is too short try again");
                      h.value=0;
                      state.value=false;
                      return ;
                    }

state.value=true;
                      typedloc = await locationFromAddress("${cont.text}مصر+");
// print(typedloc);
// print(typedloc.length);
List<Placemark>locationfromlatandlong=await placemarkFromCoordinates(typedloc[0].longitude, typedloc[0].longitude);
print(locationfromlatandlong);
                    if(typedloc==null||typedloc.isEmpty){
                      Get.snackbar("error!!!", "try again");
                      h.value=0.0;
                      return;
                    }
                    whichlist = <Stations>[];
                    for (int k = 0; k < 4; k++) {
                      initaldistance = 50.0;
                      if (k == 0) {
                        whichlist = Stations.line1;
                      }
                      if (k == 1) {
                        whichlist = Stations.line2;
                      }
                      if (k == 2) {
                        whichlist = Stations.line3;
                      }
                      if (k == 3) {
                        whichlist = Stations.stationlista;
                        // if (array[0] == array[1] ||  array[2] == array[1])
                        //   break;
                      }
                      for (int i = 0; i < whichlist.length; i++) {
                        index =
                            whichlist.indexOf(Stations.stationlista[0]);
              //distance from location you inserted to the station
                        result = calculateDistance(
                            typedloc[0].latitude, typedloc[0].longitude,
                            whichlist[i].lat,
                            whichlist[i].long);
                        if (result < initaldistance) {
                          initaldistance = result as double;
                          name = whichlist[i].stationname;
                          whichline = whichlist[i].whichline;
                        }
                      }
                      array.add(name);
                      // List<Placemark>placemark = await placemarkFromCoordinates(
                      //     typedloc[0].latitude, typedloc[0].longitude);
                    }
      if(array[0]==array[1]&&array[1]==array[2]&&array[2]==array[3]){
        value.value="";
        Get.snackbar("error", "please try again");
        h.value=0.0;
        state.value=false;
        array.clear();
        return;
      }
                  if(array==null||array.isEmpty||typedloc==null){
                    value.value="";
                    Get.snackbar("error", "please try again");
                    state.value=false;
                    array.clear();
                  }
                    else{
                      value.value = "\n \n line 1 the nearst station ${array[0]}  "
                          "\n \n line 2 the nearst station ${array[1]}  "
                          "\n \n line 3 the nearst station ${array[2]}  "
                          "\n \n all lines the nearst station ${array[3]}  ";
                      array.clear();
                      state.value = false;
                      state2.value=false;

                      // return CircularProgressIndicator();
                    // else {

                    }
                    }
                  ,text: "go",),
                  const SizedBox(height: 10),

Obx(
  ()=>  SingleChildScrollView(
   scrollDirection: Axis.horizontal,
    child: Row(
      children: [
       Switch(value: switchstate.value, onChanged: (v)async{
         switchstate.value=v;
         initaldistance=50;
      if(switchstate.value==true){
        h.value=200;
        myloc=await Geolocator.getCurrentPosition();
       // var distance2=100;
        for(int i=0;i<Stations.stationlista.length;i++){
     result2=  calculateDistance(myloc.latitude, myloc.longitude, Stations.stationlista[i].lat, Stations.stationlista[i].long);
    if(result2<initaldistance){
      initaldistance= result2 as double;
       stationname=Stations.stationlista[i].stationname;
    }
        }
        value.value="the nearst station from your location: $stationname";
      }
      else{
        h.value=0;
        value.value="";
      }
      },activeColor: OurColor.mainndrakgreenbutton,),
        Text("nearst station from your current location",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 16
        ),
        )
     ]
    ),
  ),
),
                  Obx(
                          ()=> AnimatedContainer(
                    duration: const Duration(seconds: 1),curve: Curves.ease,height: h.value,
                    padding: const EdgeInsets.only(
                        left: 12,
                        top: 12
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius:  BorderRadius.circular(20),
                        gradient: const LinearGradient(begin: Alignment.topRight,end: Alignment.topLeft,
                            colors: [
                              OurColor.mainndrakgreenbutton,
                              Colors.transparent
                            ]
                        )
                    ),
                    child:
                    Text(value.value,style: const TextStyle(
                        color: Colors.black,fontWeight: FontWeight.w600,
                        fontSize: 25

                    ),
                    ),
                  )
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


