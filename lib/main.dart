import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:the_hub/controller/local_storage.dart';
import 'package:the_hub/controller/theme_controller.dart';
import 'package:the_hub/view/screens/good_receipt_note_screens.dart';
import 'package:the_hub/view/screens/scan_and_display.dart';
import 'package:the_hub/view/widgets/themes.dart';

void main() async{
  await GetStorage.init();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

GetStorage storage=GetStorage();
ThemeController themecontroller= Get.put(ThemeController());
  @override
  Widget build(BuildContext context) {

     storage.writeIfNull('themeName', 'blue');
    return SimpleBuilder(
      builder:(_){
    String themename= storage.read('themeName');

    ThemeData themeData= themename=='red'?red:themename=='green'?green:themename=='pink'?pink:themename=='blue'?blue:blue;
    themecontroller.toggleTheme(themeData);
        return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: themeData,

            home: AnimatedSplashScreen(

          duration: 1000,
          splash: Container(
            width: 150,
            height: 900,
            child: Image.asset("assets/images/logo-horz.png",
            //  fit: BoxFit.fill,

            ),
          ),
          nextScreen: GoodReceiptNote(),
          splashTransition: SplashTransition.fadeTransition,
          //pageTransitionType: PageTransition,
          backgroundColor: Colors.white,
          //curve: Curves.easeInQuad,
        ),
        );}
      ,
    );
  }
}

MaterialColor defaultblue = const MaterialColor(0xff2b80eb,
    {
      50 :  Colors.white,
      100 :  Colors.white,
      200 :  Colors.white,
      300 :  Colors.white,
      400 :  Colors.white,
      500 : Colors.white,
      600 :  Colors.white,
      700 :  Colors.white,
      800 :  Colors.white,
      900 :  Colors.white,});