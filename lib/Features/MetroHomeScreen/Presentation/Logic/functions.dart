import 'dart:math';
import'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import 'package:metro_app/Features/MetroHomeScreen/Data/metro%20_lines.dart';
import 'package:url_launcher/url_launcher.dart';
Future< void> getLocation(String dest)async{
  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.

  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    Get.snackbar("metro","location service is disabled");
    return;
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      Get.snackbar("metro",'Location permissions are denied');
      return;
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.

    Get.snackbar("metro",'Location permissions are permanently denied, we cannot request permissions.');
    return;
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.


  final myloc= await Geolocator.getCurrentPosition();

  // distance_from_my_loc_to_nearststation=calculateDistance(myloc.latitude, myloc.longitude, typedloc[index].latitude, typedloc[index].longitude);
  // gamed.value+="\n the distance from your current location to the $name Station ${distance_from_my_loc_to_nearststation.toInt()} km";

  // gamed.value="${myloc.latitude}--${myloc.longitude}";
  final uri=Uri.parse('geo:0,0?q=+${dest}مصر+,محطة مترو ');
  launchUrl(uri);
}
double calculateDistance(lat1, lon1, lat2, lon2){
  var p = 0.017453292519943295;
  var a = 0.5 - cos((lat2 - lat1) * p)/2 +
      cos(lat1 * p) * cos(lat2 * p) *
          (1 - cos((lon2 - lon1) * p))/2;
  return 12742 * asin(sqrt(a));
}
String ticketPrice(int startindex, int endindex,int ticketprice,String price) {
  if (0<startindex - endindex && startindex - endindex>=9 )
    ticketprice = 5;
  else if (startindex - endindex > 9 && startindex - endindex <= 16)
    ticketprice = 7;
  else if (startindex - endindex>17&&startindex - endindex < 25)
    ticketprice = 10;
  else {
    ticketprice = 10;
  }
  price = "ticket price $ticketprice eg";
  return price;
}
void selectedOrNot(RxString valuechosenstart,RxString valuechosenend,Rx<double> h){
  if(valuechosenstart.value=="please select"||valuechosenend.value=="please select"){
    h.value=0;
    Get.snackbar("error", "please select");
    return;
  }
}
void selectedInFirstEqualSecond(RxString valuechosenstart,RxString valuechosenend,Rx<double> h,Rx<String> result){
  if(valuechosenstart.value==valuechosenend.value){
    result.value="";
    h.value=0;
    Get.snackbar("metro", "please enter the destination right");
    return;
  }
}
void sendNotificationOpeningOnMap(RxString valuechosenend){
  Get.snackbar("metro", "click here to see the trip on map",onTap: (snack) {
    getLocation(valuechosenend.value);
  },
  );
}
bool isfoundmorethanonce(String midpoint,int counter,List<String>finaltrip){
  for(var i=0;i<finaltrip.length;i++){
    if( finaltrip[i]==midpoint){
      counter++;
    }
  }
  if(counter>1){
    return true;
  }
  return false;
}
void checkMetroLines({
  required List<String>finaltrip,
  required int counter,
  required List<String> sublist2,
  required RxString valuechosenstart,
  required RxString valuechosenend,
  required int startindex,
  required int endindex,
  required int nostation,
  required RxString valueChosenStart,
  required RxString valueChosenEnd,
  required String price,
  required RxString result,
  required int ticketprice,
  required List<String>sublist1
}
    ){
  if(MetroLines.line1.contains(valuechosenstart.value)&&MetroLines.line1.contains(valuechosenend.value)){
    normalLines(
        valuechosenstart: valueChosenStart
        ,no_stations: nostation,
        whichline: MetroLines.line1,startindex: startindex,endindex: endindex
        ,valuechosenend: valueChosenEnd,price:price ,result: result,sublist1: sublist1,ticketprice:ticketprice );
  }
  else if(MetroLines.line2.contains(valuechosenstart.value)&&MetroLines.line2.contains(valuechosenend.value)){
    normalLines(no_stations: nostation, whichline: MetroLines.line2, startindex: startindex, endindex: endindex, valuechosenstart: valuechosenstart, valuechosenend: valuechosenend, result: result, sublist1: sublist1, ticketprice: ticketprice, price: price);
  }
  else if(MetroLines.line3.contains(valuechosenstart.value)&&MetroLines.line3.contains(valuechosenend.value))
    normalLines(no_stations: nostation, whichline: MetroLines.line3, startindex: startindex, endindex: endindex, valuechosenstart: valuechosenstart, valuechosenend: valuechosenend, result: result, sublist1: sublist1, ticketprice: ticketprice, price: price);
  else if(MetroLines.line1.contains(valuechosenstart.value)&&MetroLines.line2.contains(valuechosenend.value)){
    mergeLines(
        sublist2:sublist2 ,
        finaltrip: finaltrip,
        counter:counter ,
        startindex: startindex,
        endindex: endindex,
        valuechosenend: valueChosenEnd,
        valuechosenstart: valueChosenStart,
        price: price,
        sublist1: sublist1,
        ticketprice:ticketprice ,
        firstlinechosen:MetroLines.line1 ,
        result: result,
        secondliinechosen:  MetroLines.line2,
        midpoint: "Al Shohadaa");
  }
  else if(MetroLines.line1.contains(valuechosenstart.value)&&MetroLines.line3.contains(valuechosenend.value))
    mergeLines(
        sublist2:sublist2 ,
        finaltrip: finaltrip,
        counter:counter ,
        startindex: startindex,
        endindex: endindex,
        valuechosenend: valueChosenEnd,
        valuechosenstart: valueChosenStart,
        price: price,
        sublist1: sublist1,
        ticketprice:ticketprice ,
        firstlinechosen:MetroLines.line1 ,
        result: result,
        secondliinechosen:  MetroLines.line3,
        midpoint: "Ain Shams");

  else if(MetroLines.line2.contains(valuechosenstart.value)&&MetroLines.line3.contains(valuechosenend.value))
    mergeLines(
        sublist2:sublist2 ,
        finaltrip: finaltrip,
        counter:counter ,
        startindex: startindex,
        endindex: endindex,
        valuechosenend: valueChosenEnd,
        valuechosenstart: valueChosenStart,
        price: price,
        sublist1: sublist1,
        ticketprice:ticketprice ,
        firstlinechosen:MetroLines.line2 ,
        result: result,
        secondliinechosen:  MetroLines.line3,
        midpoint: "Ataba");
  else if(MetroLines.line3.contains(valuechosenstart.value)&&MetroLines.line1.contains(valuechosenend.value))
    mergeLines(
        sublist2:sublist2 ,
        finaltrip: finaltrip,
        counter:counter ,
        startindex: startindex,
        endindex: endindex,
        valuechosenend: valueChosenEnd,
        valuechosenstart: valueChosenStart,
        price: price,
        sublist1: sublist1,
        ticketprice:ticketprice ,
        firstlinechosen:MetroLines.line3 ,
        result: result,
        secondliinechosen:  MetroLines.line1,
        midpoint: "Ain Shams");
  else if(MetroLines.line3.contains(valuechosenstart.value)&&MetroLines.line2.contains(valuechosenend.value))
    mergeLines(
        sublist2:sublist2 ,
        finaltrip: finaltrip,
        counter:counter ,
        startindex: startindex,
        endindex: endindex,
        valuechosenend: valueChosenEnd,
        valuechosenstart: valueChosenStart,
        price: price,
        sublist1: sublist1,
        ticketprice:ticketprice ,
        firstlinechosen:MetroLines.line3 ,
        result: result,
        secondliinechosen:  MetroLines.line2,
        midpoint: "Ataba");
  else
    mergeLines(
        sublist2:sublist2 ,
        finaltrip: finaltrip,
        counter:counter ,
        startindex: startindex,
        endindex: endindex,
        valuechosenend: valueChosenEnd,
        valuechosenstart: valueChosenStart,
        price: price,
        sublist1: sublist1,
        ticketprice:ticketprice ,
        firstlinechosen:MetroLines.line2 ,
        result: result,
        secondliinechosen:  MetroLines.line1,
        midpoint: "Al Shohadaa");
}

void normalLines({
  required int no_stations,
  required List<String>whichline,
  required int startindex,
  required int endindex,
  required RxString valuechosenstart,
  required RxString valuechosenend,
  required RxString result,
  required List<String>sublist1,
  required int ticketprice,
  required String price}) {
  startindex=whichline.indexOf(valuechosenstart.value);
  endindex=whichline.indexOf(valuechosenend.value);
  no_stations=0;
  if(startindex<endindex){
    sublist1=  whichline.sublist(startindex,endindex+1);
    no_stations=endindex-startindex;
    result.value="$sublist1\n${no_stations} stations without ${whichline[endindex]}\n"
        "${no_stations+1} stations with ${whichline[endindex]}\n"
        "the expected time ${(endindex-startindex)*2}  min\n";
  }
  else{
    sublist1=whichline.sublist(endindex,startindex+1);
    no_stations=startindex-endindex;
    result.value="${sublist1.reversed.toList()}\n${no_stations} stations without ${whichline[endindex]}\n"
        "${no_stations+1} stations with ${whichline[endindex]}\n"
        "the expected time ${(startindex-endindex)*2}  min\n"
    ;
  }
  result.value+=ticketPrice(startindex,endindex,ticketprice,price);
}
void mergeLines({
  required List<String>firstlinechosen,
  required List<String>secondliinechosen,
  required String midpoint,
  required  RxString valuechosenstart,
  required RxString valuechosenend,
  required int startindex,
  required int endindex,
  required List<String>sublist1,
  required List<String>sublist2,
  required List<String>finaltrip,
  required RxString result,
  required int counter,
  required String price,
  required int ticketprice
}){
  startindex=firstlinechosen.indexOf(valuechosenstart.value);
  endindex=secondliinechosen.indexOf(valuechosenend.value);
  var mid1=firstlinechosen.indexOf(midpoint);
  var mid2=secondliinechosen.indexOf(midpoint);
  if(startindex<mid1&&endindex<mid2){
    sublist1=firstlinechosen.sublist(startindex,mid1+1);
    sublist2=secondliinechosen.sublist(endindex,mid2+1);
    finaltrip=sublist1+sublist2.reversed.toList();
    result.value="First trip ${sublist1}\n\n Second trip ${sublist2.reversed.toList()}\n\n";
  }
  else if(startindex>mid1&&endindex>mid2){
    sublist1=firstlinechosen.sublist(mid1,startindex+1);
    sublist2=secondliinechosen.sublist(mid2,endindex+1);
    finaltrip=sublist1.reversed.toList()+sublist2;
    result.value="First trip ${sublist1.reversed.toList()}\n\n Second trip ${sublist2}\n\n";
  }
  else if(startindex >mid1&&endindex<mid2){
    sublist1=  firstlinechosen.sublist(mid1,startindex+1);
    sublist2=secondliinechosen.sublist(endindex,mid2+1);
    finaltrip=sublist1.reversed.toList()+sublist2.reversed.toList();
    result.value="First trip ${sublist1.reversed.toList()}\n\n Second trip${sublist2.reversed.toList()}\n\n ";

  }
  else{
    sublist1=firstlinechosen.sublist(startindex,mid1+1);
    sublist2=secondliinechosen.sublist(mid2,endindex+1);
    finaltrip=sublist1+sublist2;
    result.value="First trip ${sublist1}\n\n Second trip${sublist2}\n\n ";
  }

  if(isfoundmorethanonce(midpoint,counter,finaltrip)==true){
    var whole_no_stations= finaltrip.indexOf(valuechosenend.value)-finaltrip.indexOf(valuechosenstart.value);
    finaltrip.remove(midpoint);
    result.value+=" Final trip $finaltrip\n";
    result.value+="$whole_no_stations stations \n the expected time ${whole_no_stations*2} min\n";
  }
  result.value+=ticketPrice(startindex, endindex,ticketprice,price);
}