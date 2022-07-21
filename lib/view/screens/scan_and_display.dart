import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:the_hub/controller/local_storage.dart';
import 'package:the_hub/model/item_model.dart';
import 'package:the_hub/view/widgets/alert.dart';
import 'package:the_hub/view/widgets/custom_item_card.dart';

import '../../model/inventory_item.dart';
import '../widgets/inventory_alerts.dart';


class ScanAndDisplay extends StatefulWidget {
   ScanAndDisplay({Key? key,required this.theme}) : super(key: key);
ThemeData theme;
  @override
  _ScanAndDisplayState createState() => _ScanAndDisplayState();
}

class _ScanAndDisplayState extends State<ScanAndDisplay> {
 String barcodevalue='-1';
 TextEditingController textcontroller=TextEditingController();
 LocalStorage localStorage=LocalStorage();
    List<Item> items=[
      Item(name: "Elmarai Full cream Milk (Bottle)", barcode: "556465", current_stock: 8,quantity: 100),
      Item(name: "pepsi", barcode: "5646216", current_stock: 19,quantity: 50),
      Item(name: "Dina farms", barcode: "5556", current_stock: 20,quantity: 77),
      Item(name: "ahmed tea", barcode: "545454", current_stock: 80,quantity: 150)
    ];
@override

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
              title: Text('Add to good receipt'),
              actions: [
                InkWell(onTap: (){Alert(context,width,height,widget.theme);},
                  child: CircleAvatar(
                    radius: width*.06,
                    backgroundColor: Colors.grey[350],
                    child: Icon(Icons.person,color: Colors.white,size: width*.1,),
                  ),
                )
              ],
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
                                      var value= barcodeScanRes;
                                      barcodevalue=barcodeScanRes;
                                 barcodevalue=='-1'?textcontroller.text='': textcontroller.text=barcodevalue;
                                      print("asmaa ${value}");
                               //       barcodevalue=='-1'? Container():Alertinventory(context,width,height,widget.theme,barcodevalue,addInventoryItem);
                                      barcodevalue=='-1'? Container():canedit( context, width , height, widget.theme, barcodevalue, '4');
                                    });
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
                  SizedBox(height:height*.71,
                    child: ListView.builder(
                        itemCount: items.length+1,
                        itemBuilder: (context,int index){
                          if(index==items.length){
                            return  Center(
                              child: Row(mainAxisSize: MainAxisSize.min,
                                children: [
                                  MaterialButton(onPressed: () {


                                  },minWidth: width*.5,
                                    child: const Text('save',style: TextStyle(color: Colors.white,fontSize: 17),),
                                    color:widget.theme.backgroundColor,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                                  ),
                                ],
                              ),
                            );
                          }
                          return CustomItemCard(item:items[index],selected_theme: widget.theme,remove: (){},);

                        }),)
                ],
              ),
            ),
          )

      ),
    );
  }
 addInventoryItem(InventoryItem item){
   setState(() {

   });
 }
}
