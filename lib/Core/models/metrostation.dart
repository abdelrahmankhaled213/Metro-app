import 'package:flutter/cupertino.dart';

class Metro{
  final int id;
  final  String from;
  final String to;
  final  String trip;
  Metro({
    required this.id,
  required  this.from,
    required this.to,
    required this.trip
});
  factory Metro.fromJson(Map<String,dynamic>json)=>Metro(id: json['id'], from: json['from'], to: json['to'], trip: json['trip']);
   Map<String,dynamic> toJson(){
     return {
       'id':this.id,
       'from':this.from,
       'to':this.to,
       'trip':this.trip
     } ;
   }

}