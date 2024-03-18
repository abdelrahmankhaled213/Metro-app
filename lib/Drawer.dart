import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metro_app/Core/Theming/Colors/OurColors.dart';
import 'package:metro_app/Features/History/HistoryScreen.dart';
import 'package:metro_app/Features/MetroHomeScreen/Presentation/UI/Screens/HomeScreen.dart';
import 'package:metro_app/Features/MetroHomeScreen/NearstStation/Nearst%20Station.dart';
class MainScreen extends StatelessWidget {
  var icons=<Widget>[
    const Icon(Icons.home,color: OurColor.mainndrakgreenbutton),
   const Icon(Icons.near_me,color: OurColor.mainndrakgreenbutton),
    const Icon(Icons.history,color: OurColor.mainndrakgreenbutton,)
  ];
var i=0.obs;
  var screens=<Widget>[
    HomeScreen(),
    NearStation(),
    HistoryScreen()
  ];
  var text=<String>
  ["home","nearst station","histroy"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        shape: OutlineInputBorder( 
          borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.black)
        ),
        backgroundColor: Colors.white,
        child: SingleChildScrollView(
          child:  Container(
              child: SafeArea(
                child: Column(
                  children: [
                    Container(

                      padding: const EdgeInsets.only(top: 12),
                      height: 200,
                      width: double.infinity,
                      decoration:const BoxDecoration(
                        color: Colors.transparent,
                        image: DecorationImage(
                          filterQuality: FilterQuality.high,
                          image:AssetImage("assets/images/img_2.png"),
                          fit: BoxFit.cover,
                        ),

                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 400,
                      width: double.infinity,
                      child: ListView.separated(separatorBuilder: (context, index) => const SizedBox(height: 15),itemBuilder: (context,index)=>
                          InkWell(
                            onTap: (){
                              // if(screens[index] is HistoryScreen){
                              //   Get.snackbar("metro", "click on the trip for details");
                              // }
                                    i.value=index;
                                     Scaffold.of(context).closeDrawer();

                            },
                            child: Container(decoration: MagnifierDecoration(
                              opacity: 15,
                            ),
                              child: Card(
                                child: ListTile(
                                    leading: Text(text[index],style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                      fontSize: 20
                                    )
                                    ),
                                    trailing: icons[index]
                                ),
                              ),
                            ),
                          ),
                        itemCount: icons.length,
                      ),
                    ),


                  ],
                ),
              )
          ),
        ),
      ),
appBar: AppBar(
  centerTitle: true,
  leading: Builder(builder: (context) =>
IconButton( onPressed: (){
      return Scaffold.of(context).openDrawer();
    },icon: Icon(Icons.menu,color: Colors.black,)
),
  ),
   backgroundColor: OurColor.mainndrakgreenbutton,
  title: Text("Metro app",style: const TextStyle(
fontWeight: FontWeight.w400,
    color: Colors.black
  )
  ),

),
      body: Obx(() =>  screens[i.value]),
    );
  }

}
