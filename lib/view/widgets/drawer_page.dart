import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:the_hub/controller/local_storage.dart';
import 'package:the_hub/controller/theme_controller.dart';
import 'package:the_hub/view/widgets/themes.dart';

class DrawerPage extends StatelessWidget {
ThemeController themeController;
DrawerPage({required this.themeController});

  @override
  Widget build(BuildContext context) {
    LocalStorage localStorage=LocalStorage();
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Container(
      width: width*.7,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
           padding: EdgeInsets.only(top: height*.08,left: width*.06,bottom: height*.03),
            child: const Text('Change Theme',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          ),
          Divider(thickness: 2,),
          ListTile(
            leading: const Icon(Icons.format_paint,color: Colors.blue,),
            title: const Text('blue',style: TextStyle(fontSize: 16,color: Colors.blue)),
            onTap: (){
              Get.changeTheme(blue);
              themeController.toggleTheme(blue);
              localStorage.saveToDisk('blue');
            },
          ),
          ListTile(
            leading: const Icon(Icons.format_paint,color: Colors.pink,),
            title: const Text('pink',style: TextStyle(fontSize: 16,color: Colors.pink),),
            onTap: (){
              Get.changeTheme(pink);
              themeController.toggleTheme(pink);
              localStorage.saveToDisk('pink');
            },
          ) ,ListTile(
            leading: const Icon(Icons.format_paint,color: Colors.green,),
            title:const Text('green',style:  TextStyle(fontSize: 16,color: Colors.green),),
            onTap: (){

              Get.changeTheme(green);
              themeController.toggleTheme(green);
              localStorage.saveToDisk('green');
            },
          ), ListTile(
            leading: Icon(Icons.format_paint,color: Colors.red[600],),
            title: Text('red',style: TextStyle(fontSize: 16,color: Colors.red[600]),),
            onTap: (){
              Get.changeTheme(red);
              themeController.toggleTheme(red);
              localStorage.saveToDisk('red');
            },
          )
        ],
      ),
    );
  }
}
