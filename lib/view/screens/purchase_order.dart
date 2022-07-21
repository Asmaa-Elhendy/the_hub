import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_hub/controller/theme_controller.dart';
import 'package:the_hub/view/screens/good_receipt_note_screens.dart';
import 'package:the_hub/view/screens/list_and_scan.dart';
import 'package:the_hub/view/screens/scan_and_display.dart';
import 'package:the_hub/view/screens/select_supplier_page.dart';
import 'package:the_hub/view/widgets/button.dart';

import '../widgets/access_alert.dart';
import '../widgets/purchaseorder_textfield.dart';

class PurchaseOrder extends StatefulWidget {
  const PurchaseOrder({Key? key}) : super(key: key);

  @override
  State<PurchaseOrder> createState() => _PurchaseOrderState();
}

class _PurchaseOrderState extends State<PurchaseOrder> {
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return GetBuilder<ThemeController>(
      init: ThemeController(),
     builder: (themecontroller){
        return GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus;
            currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Scaffold(
            body: SingleChildScrollView(
              child: Container(
                width: width,
                height: height,
                color: themecontroller.selectedTheme.backgroundColor,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                        left: width*.03,
                        top: height*.05,
                        child: IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,size: width*.07,),onPressed: (){Get.back();},)),
                    Positioned(
                     top: height*.1,
                      child: Image.asset("assets/images/logo.png",color: Colors.white,),
                    ),
                    Positioned(
                      top: height*.34,
                      child: Container(

                        width: width,
                        height: height*.7,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25) )
                        ),
                        child: Padding(
                          padding:   EdgeInsets.symmetric(horizontal: width*.04),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:  EdgeInsets.symmetric(vertical: height*.08),
                                child: Text('Type purchase order number',style: TextStyle(fontSize: width*.065,fontWeight: FontWeight.w500),),
                              ),
                              Text("Purchase Order: ",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey[700]
                                ),
                              ),
                              Form(
                                child: Container(
                                    decoration:BoxDecoration(
                                      borderRadius: BorderRadius.circular(21),
                                   border: Border.all(color: themecontroller.selectedTheme.backgroundColor,)
                              ),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(left: width*.04),
                                        border: InputBorder.none

                                      ),
                                )),

                              ),SizedBox(height: height*.05,),
                              InkWell(
                                  onTap: (){
                                    // go to with specified purchase order if exist
                                    Get.to(ListAndScan(theme: themecontroller.selectedTheme));
                                  },
                                  child: Center(child: CustomButton(theme: themecontroller.selectedTheme,title: 'Go',))),
                             SizedBox(height: height*.05,),
                              InkWell(
                                onTap: (){
                                  Get.to(GoodReceiptNote());
                                },
                                child: Column(
                                  children: [
                                    Center(child:
                                    Text.rich(
                                      TextSpan(
                                        text: '        If you don\'t know it ! ',
                                        style: TextStyle( color: themecontroller.selectedTheme.backgroundColor,fontWeight: FontWeight.w500
                                          ,),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: '\nTap to create good receipt note',
                                              style: TextStyle(
                                                color: themecontroller.selectedTheme.backgroundColor,fontWeight: FontWeight.w500,decoration: TextDecoration.underline
                                                ,),),
                                          ]))
                                    ),SizedBox(height: height*.02,),
                                    InkWell(
                                      onTap: (){
                                        //permission yes add grn without purchase-order -> add_supplier_page
                                        String permission ='yes';
                                         permission=='no'? 
                                         AceesssAlert(context,width,height,themecontroller.selectedTheme,"You don\'t have access to add GRN without purchase order")
                                        :Get.to(SelectSupplierPage(theme: themecontroller.selectedTheme,));
                                      },
                                      child: Text( 'Tab here If you don\'t have purchase order',
                                        style: TextStyle( color: themecontroller.selectedTheme.backgroundColor,fontWeight: FontWeight.w500,decoration: TextDecoration.underline
                                          ,),),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ),
        );
     },
    );
  }
}
