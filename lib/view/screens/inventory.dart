import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:the_hub/model/inventory_item.dart';
import 'package:the_hub/view/widgets/card_inventory.dart';
import 'dart:io';

import 'package:the_hub/view/widgets/inventory_alerts.dart';

import 'list_and_scan.dart';

class Inventory extends StatefulWidget {
ThemeData theme;
Inventory({required this.theme});

  @override
  State<Inventory> createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
List<InventoryItem> inventorylist=[];
  String barcodevalue='-1';
  bool isvalueread=false;
  TextEditingController textcontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return SafeArea(
      child: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus;
            currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }},
          child:  Scaffold(
            //   drawer: DrawerPage(themeController:themecontroller),
            appBar: AppBar(
              centerTitle: true,
              title: Text('Inventory'),

            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: width,
                    height: height*.15,
                    color: widget.theme.primaryColor,
                    child: Stack(
                      children: [
                        Padding(
                          padding:  EdgeInsets.symmetric(vertical:height*.04,horizontal: width*.05),
                          child: Container(
                            width: width*.9,
                            height: height*.09,
                            color: Colors.white,
                            child:  TextField(
                               controller: textcontroller,
                              textAlignVertical: TextAlignVertical.center,
                              style: TextStyle(overflow: TextOverflow.visible,fontSize: width*.045),
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.search),
                                border: InputBorder.none,
                                hintText: "Enter Product Name/SKU/Scan bar code",
                                hintStyle: TextStyle(color: Colors.grey,fontSize: width*.032),
                                //  contentPadding: EdgeInsets.all(5),
                                suffixIcon: InkWell(
                                  onTap: ()async{
                                    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
                                        "#ff6666",
                                        "CANCEL",
                                        false,
                                        ScanMode.BARCODE);
                                    if(!mounted) return;
                                    setState(() {
                                    barcodevalue= barcodeScanRes;
                                    barcodevalue=='-1'?textcontroller.text='':textcontroller.text=barcodevalue;
                                    barcodevalue=='-1'?isvalueread=false:isvalueread=true;
                                    print('asmaa ${barcodeScanRes}');
                                    });
                           //check موجود ولا لا في الداتابيز

                                 isvalueread? Alertinventory(context,width,height,widget.theme,barcodevalue,addInventoryItem):Container();
                                  },
                                  child: Image.asset("assets/images/barcodenew.png",),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height*.7,
                    child: ListView.builder(
                        itemCount: inventorylist.length,
                        itemBuilder: (context,int index){
                          return CardInventory(width:width,height:height,barcodevalue:inventorylist[index].barcodevalue);
                        })
                  )

                ],
              ),
            ),
          )

      ),
    );
  }
addInventoryItem(InventoryItem item){
  setState(() {
    inventorylist.add(item);
  });
}

}

