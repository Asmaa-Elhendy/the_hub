import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_hub/model/inventory_item.dart';




EditAlertinventory(BuildContext context,double width , double height,ThemeData themeData, barcode,String quantity) {
  showDialog(
      context: context,
      builder: (context) {
        TextEditingController textcontroller=TextEditingController();
        TextEditingController nametextcontroller=TextEditingController();
        textcontroller..text=quantity;
        return AlertDialog(
          title: Column(
            children: [
              Center(child: Text("Edit Item")),
            ],
          ),
          content:SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: width*.02),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: width*.02),
                    child: Row(
                      children: [
                        Image.asset("assets/images/barcodenew.png",),
                        SizedBox(width: width*.05,),
                        Text('kk${barcode}')
                      ],
                    ),
                  ), SizedBox(height: height*.01,),
                  TextFormField(
                    controller: nametextcontroller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(height*.026),
                      prefixIcon: Icon(Icons.drive_file_rename_outline,color: Colors.black,size: width*.087,),
                      hintText: "Enter Name",   //name from api

                    ),
                  ),
                  SizedBox(height: height*.01,),
                  TextFormField(
                    controller: textcontroller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(height*.026),
                      prefixIcon: Icon(Icons.app_registration,color: Colors.black,size: width*.087,),


                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            GestureDetector(
              onTap: (){Navigator.pop(context);},
              child: Center(
                child: Container(
                  width: width*.3,
                  height: height*.06,
                  color: themeData.backgroundColor,
                  child: Center(child:Text('Edit',style: TextStyle(fontSize:17,color: Colors.white),)),
                ),
              ),
            )
          ],
        );
      });}

canedit(BuildContext context,double width , double height,ThemeData themeData, barcode,String quantity) {
  showDialog(
      context: context,
      builder: (context) {
        TextEditingController textcontroller=TextEditingController();
        return AlertDialog(
          title: Column(
            children: [
              Center(child: Text("Item added before !")),
            ],
          ),
          content:Text('Do you want to edit it ?'),
          actions: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        InkWell(
          onTap: (){
            Navigator.pop(context);
            EditAlertinventory(context,width,height,themeData,barcode,quantity);
          },
          child: Container(
            width: width*.3,
            height: height*.05,
            color: themeData.backgroundColor,
            child: Center(child:Text('Yes',style: TextStyle(fontSize:17,color: Colors.white),)),
          ),
        ),
        InkWell(
          onTap: (){Navigator.of(context).pop();},
          child: Container(
            width: width*.3,
            height: height*.05,
            color: themeData.backgroundColor,
            child: Center(child:Text('No',style: TextStyle(fontSize:17,color: Colors.white),)),
          ),
        )
      ],)
          ],
        );
      });}
