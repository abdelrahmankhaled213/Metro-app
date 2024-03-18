import 'package:get/get.dart';
import 'package:metro_app/Core/Theming/Colors/OurColors.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:flutter/material.dart';
import 'package:metro_app/Core/Helpers/sqlhelper.dart';

class HistoryScreen extends StatefulWidget {


  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DataBaseHelper.getData("SELECT * FROM 'Metro'"),
        builder: (context, snapshot) {
      if (snapshot.hasData) {
        return ListView.builder(
            shrinkWrap: true,
            itemCount:  snapshot.data!.length,itemBuilder: (context, index) {
            return Card(
              color: Colors.white,
              margin: const EdgeInsets.all(10),
              elevation: 10,
              child: ListTile(
                  leading: Text(
                      "${snapshot.data![index]['from']} to ${snapshot.data![index]
                          ['to']}", style: TextStyle(
                      color: OurColor.mainndrakgreenbutton,
                      fontWeight: FontWeight.w600
                  )
                  ),
                  // trailing: TextButton(onPressed: () {
                  //   Get.to(HistroyDetials(), arguments: snapshot.data![index]);
                  // }, child: Text("view", style: const TextStyle(
                  //     color: OurColor.mainndrakgreenbutton,
                  //     fontWeight: FontWeight.w600
                  // ),)
                  // )
                trailing: IconButton(icon: Icon(Icons.delete),onPressed: ()async{
                  setState(() {
            
                  });
                 int response= await DataBaseHelper.deleteData('''
                  DELETE FROM 'Metro' Where id =${snapshot.data![index]['id']}
                  ''');
            
                 if(response>=0){
                   Get.snackbar("deleted", "deleted sucessfully row no=${snapshot.data![index]['id']},${snapshot.data!.length}");
            
                 }
                 else{
                   Get.snackbar("error", "deleted unsucessfully");
                 }
                },),
              ),
            );
        }
            );
      }
      else{
        return Center(child: const CircularProgressIndicator(
          color: OurColor.mainndrakgreenbutton,
          backgroundColor:  Colors.transparent,
        ));
      }
    }
    );
  }
}
