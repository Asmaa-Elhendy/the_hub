import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:the_hub/controller/supplier_controller.dart';
import 'package:the_hub/controller/theme_controller.dart';
import 'package:the_hub/view/screens/purchase_order.dart';
import 'package:the_hub/view/widgets/drawer_page.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final _scaffoldKey =  GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return GetBuilder<ThemeController>(
      init: ThemeController(),
    builder:(themecontroller){

      return Scaffold(
        key: _scaffoldKey,
        drawer: DrawerPage(themeController:themecontroller ,),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black,size: 30),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Padding(padding: EdgeInsets.only(top: height*0.03,right: width*0.3),
              //   child: IconButton(
              //     onPressed: (){
              //       //DrawerPage(),
              //     },
              //     icon: Icon(Icons.menu),
              //   ),
              // ),
              Padding(padding: EdgeInsets.only(//top: height*0.001
                  left: width*0.1),
                child: Image.asset("assets/images/delivery-app-svg-clipart-md.png",height: height*0.6,width: width*.8,),
              ),
              SizedBox(height: height*0.03,),

              const Center(
                child:  Text("Welcome To Our Platform",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),



                ),
              ),
              SizedBox(height: height*0.04,),
              Text("We hope that Our platform makes",
                style: TextStyle(
                    color: Colors.black45,
                    fontWeight: FontWeight.w500,
                    fontSize: 15
                ),

              ),
              Text(" it easier for you to work.",
                style: TextStyle(
                    color: Colors.black45,
                    fontWeight: FontWeight.w500,
                    fontSize: 15
                ),

              ),


            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            SupplierHelper.getSupplier();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Form(
                      child: PurchaseOrder(),

                    )));

          },
          child: Icon(Icons.chevron_right,color: Colors.white,size: 35,),
          splashColor: Colors.white,
          backgroundColor: Colors.blue,
        ),
        //floatingActionButtonLocation: FloatingActionButtonLocation.,
      );
    },


    );
  }
}
