import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:the_hub/controller/local_storage.dart';
import 'package:the_hub/controller/login_controller.dart';
import 'package:the_hub/controller/theme_controller.dart';
import 'package:the_hub/view/screens/good_receipt_note_screens.dart';
import 'package:the_hub/view/screens/inventory.dart';
import 'package:the_hub/view/screens/login.dart';
import 'package:the_hub/view/widgets/themes.dart';


class DrawerPage extends StatelessWidget {
  ThemeController themeController;
  DrawerPage({required this.themeController});
  //ApisHelper ob = new ApisHelper();
  GetStorage storage =GetStorage();
  Future get token async{
    return await storage.read('token');
  }


  @override
  Widget build(BuildContext context) {
    LocalStorage localStorage = LocalStorage();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width * .7,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
                top: height * .06, left: width * .03, bottom: height * .04),
            child:  RichText(
                text:const TextSpan(
                    children: [
                      WidgetSpan(child: Icon(Icons.settings,size: 20,color: Colors.black54,)),
                      TextSpan(
                        text: '  Settings  ',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),
                      )
                    ]
                )


            ),
          ),
          const Divider(
            thickness: 2,
          ),
          SizedBox(
            height: height * 0.01,
          ),
          TextButton(

            onPressed: (){   Navigator.pop(context);
            Get.to(GoodReceiptNote());

            },
            child: RichText(
                text:  TextSpan(children: [
                  WidgetSpan(child: SizedBox(width: width*.02,)),
                  WidgetSpan(child: Icon(Icons.add,size: width*.06,)),
                  WidgetSpan(child: SizedBox(width: width*.06,)),
                  TextSpan(
                    text: "Good Receipt Note",

                    style: TextStyle(fontSize: width*0.05, fontWeight: FontWeight.w500,color: Colors.black),

                  ),
                ])),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          ExpansionTile(
            title:  Row(
              children: [
                Icon(Icons.color_lens,color: themeController.selectedTheme.backgroundColor,),
                SizedBox(width: width*.063,),
                Text('Change Themes',style: TextStyle(fontSize: width*0.05 ,fontWeight: FontWeight.w500,color: Colors.black),)
              ],
            ),children: [
            ListTile(
              leading: const Icon(
                Icons.format_paint,
                color: Colors.blue,
              ),
              title: const Text('blue',
                  style: TextStyle(fontSize: 16, color: Colors.blue)),
              onTap: () {
                Get.changeTheme(blue);
                themeController.toggleTheme(blue);
                localStorage.saveToDisk('blue');
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.format_paint,
                color: Colors.pink,
              ),
              title: const Text(
                'pink',
                style: TextStyle(fontSize: 16, color: Colors.pink),
              ),
              onTap: () {
                Get.changeTheme(pink);
                themeController.toggleTheme(pink);
                localStorage.saveToDisk('pink');
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.format_paint,
                color: Colors.green,
              ),
              title: const Text(
                'green',
                style: TextStyle(fontSize: 16, color: Colors.green),
              ),
              onTap: () {
                Get.changeTheme(green);
                themeController.toggleTheme(green);
                localStorage.saveToDisk('green');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.format_paint,
                color: Colors.red[600],
              ),
              title: Text(
                'red',
                style: TextStyle(fontSize: 16, color: Colors.red[600]),
              ),
              onTap: () {
                Get.changeTheme(red);
                themeController.toggleTheme(red);
                localStorage.saveToDisk('red');
              },
            ),
          ],
            // child: Padding(
            //   padding:  EdgeInsets.only(left: width*0.03),
            //   child:
            // ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          TextButton(

            onPressed: (){
              Navigator.pop(context);
              Get.to(Inventory(theme: themeController.selectedTheme));
            },
            child: RichText(
                text:  TextSpan(children: [
                  WidgetSpan(child: SizedBox(width: width*.027,)),
                  WidgetSpan(child: Icon(Icons.inventory,size: 20,)),
                  WidgetSpan(child: SizedBox(width: width*.08,)),
                  TextSpan(
                    text: "Inventory ",

                    style: TextStyle(fontSize: width*.05, fontWeight: FontWeight.w500,color: Colors.black),

                  ),
                  TextSpan(
                    text: "     closed",

                    style: TextStyle(fontSize: 15, color: Colors.red),

                  ),
                ])),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          TextButton(

            onPressed: (){
              //try{
              Navigator.pop(context);
              Helper.logout();

              storage.write("token", "0");
              //ob.sava("0");
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => Login(theme: themeController.selectedTheme,)),
              );



              //}catch(e){
              //     print("errorrr $e");
              //   }
            },
            child: RichText(
                text:  TextSpan(children: [
                  WidgetSpan(child: SizedBox(width: width*.027,)),
                  WidgetSpan(child: Icon(Icons.logout,size: 20,)),
                  WidgetSpan(child: SizedBox(width: width*.08,)),
                  TextSpan(
                    text: "Logout ",

                    style: TextStyle(fontSize: width*.05, fontWeight: FontWeight.w500,color: Colors.black),

                  ),
                ])),
          )
        ],
      ),
    );
  }


}