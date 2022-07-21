import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import '../../model/inventory_item.dart';
import '../../model/item_model.dart';
import '../widgets/access_alert.dart';
import '../widgets/alert.dart';
import '../widgets/custom_item_card.dart';
import '../widgets/inventory_alerts.dart';


class ListAndScan extends StatefulWidget {
   ListAndScan({Key? key,required this.theme}) : super(key: key);
ThemeData theme;

  @override
  State<ListAndScan> createState() => _ListAndScanState();
}
List<Item> items=[
  Item(name: "Elmarai Full cream Milk (Bottle)", barcode: "556465", current_stock: 8,quantity: 10),
  Item(name: "pepsi", barcode: "5646216", current_stock: 19,quantity: 50),
  Item(name: "Dina farms", barcode: "5556", current_stock: 20,quantity: 77),
  Item(name: "ahmed tea", barcode: "545454", current_stock: 80,quantity: 150)
];
class _ListAndScanState extends State<ListAndScan> {
  int selectedValue = 1;
  String barcodevalue='-1';

  TextEditingController textcontroller=TextEditingController();


  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return  SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus;
          currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }},
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Add to good receipt'),
            actions: [
              InkWell(onTap: (){
                Alert(context,width,height,widget.theme);
           },
                child: IconButton(icon: Icon(Icons.add_shopping_cart,color: Colors.white,size: width*.08,),
                onPressed: (){
                  bool permission_add_new_product=true;
                  permission_add_new_product==true?
                  Alertinventory(context,width,height,widget.theme,barcodevalue,addInventoryItem)
                      :AceesssAlert( context, width ,  height,widget.theme, "you don\'t have access to add new product");
                },),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding:  EdgeInsets.only(top: height *.01),
                  child: radioButton(width),
                ),
                selectedValue==1?
                ListView.builder(shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context,int index){
                    if(index == items.length){
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

                  },
                  itemCount: items.length+1,
                ):Column(
                  children: [
                    Container(
                      // width: width,
                      // height: height*.15,
                      // color: widget.theme.primaryColor,
                      child: Stack(
                        children: [
                          Padding(
                            padding:  EdgeInsets.symmetric(vertical:height*.04,horizontal: width*.05),
                            child: Container(
                              width: width*.9,
                              height: height*.04,
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

                    SingleChildScrollView(
                        child:
                        Column(
                          children: [
                            Container(
                              width: width,
                                child: CustomItemCard(item:items[0],selected_theme: widget.theme,remove: (){},)),

                            MaterialButton(onPressed: () {


                            },minWidth: width*.5,
                              child: const Text('save',style: TextStyle(color: Colors.white,fontSize: 17),),
                              color:widget.theme.backgroundColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                            ),
                          ],
                        )
                    )


                  ],
                )

                // Expanded(child:
                // ListView(children: [
                //   selectedValue==1?
                //   CustomItemCard(item:items[0],selected_theme: widget.theme,):Text("gggg"),
                //
                //
                // ],))
                //

              ],

            ),
          ),
        ),
      ),
    );
  }

  Widget radioButton(double width) {
    return Container(
      padding: EdgeInsets.only(right: width*.031 ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
              Radio(
              value: 1,
              groupValue: selectedValue,
              onChanged: (int ?value){
            setState(() {
              selectedValue = value!;
              print("vv = $selectedValue");

            });
              },activeColor:Colors.blue
              ),
                Text('View all products',
                  style: TextStyle(
                      fontSize: width*0.041,
                      fontWeight: FontWeight.w400
                  ),

                ),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 2,
                  groupValue: selectedValue,
                  onChanged: (int ?value){
                    setState(() {
                      selectedValue = value!;
                      print("vv = $selectedValue");
                    });
                  },activeColor:Colors.blue
                ),
                Text('Scan product',
                  style: TextStyle(
                      fontSize: width*0.041,
                      fontWeight: FontWeight.w400
                  ),

                ),

              ],

            ),
          ],
        ),
      ),
    );
  }
  addInventoryItem(Item item){
    setState(() {
 items.add(item);
    });
  }
}
Alertinventory(BuildContext context,double width , double height,ThemeData themeData, barcode,Function additem) {
  showDialog(
      context: context,
      builder: (context) {
        TextEditingController textcontroller=TextEditingController();
        TextEditingController nametextcontroller=TextEditingController();
        TextEditingController addbarcodeController=TextEditingController();
        return AlertDialog(
          title: Center(child: Text("Add New Item")),
          content:SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: width*.02),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Padding(
                  //   padding:  EdgeInsets.symmetric(horizontal: width*.02),
                  //   child: Row(
                  //     children: [
                  //       Image.asset("assets/images/barcodenew.png",),
                  //       SizedBox(width: width*.05,),
                  //       Text('kk${barcode}')
                  //     ],
                  //   ),
                  // ),
                  TextFormField(
                    controller: addbarcodeController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(height*.026),
                      prefixIcon: InkWell(
                          onTap: ()async{
                            String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
                                "#ff6666",
                                "CANCEL",
                                false,
                                ScanMode.BARCODE);
                            addbarcodeController.text=barcodeScanRes;

                          },
                          child: Image.asset("assets/images/barcodenew.png",)),
                      hintText: "Scan || type barcode",hintStyle: TextStyle(fontSize: width*.038),

                    ),
                  ),
                  SizedBox(height: height*.01,),
                  TextFormField(
                    controller: nametextcontroller,

                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(height*.026),
                      prefixIcon: Icon(Icons.drive_file_rename_outline,color: Colors.black,size: width*.087,),
                      hintText: "Enter Name",
                        hintStyle: TextStyle(fontSize: width*.038),
                    ),
                  ),
                  SizedBox(height: height*.01,),
                  TextFormField(
                    controller: textcontroller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(height*.026),
                      prefixIcon: Icon(Icons.app_registration,color: Colors.black,size: width*.087,),
                      hintText: "Enter Quantity",
                        hintStyle: TextStyle(fontSize: width*.038),
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            InkWell(
              onTap: (){
                additem(Item(barcode: addbarcodeController.text, name: nametextcontroller.text, quantity: int.parse(textcontroller.text), current_stock: 0,));
                Navigator.pop(context);},
              child: Center(
                child: Container(
                  width: width*.3,
                  height: height*.06,
                  color: themeData.backgroundColor,
                  child: Center(child:Text('ADD',style: TextStyle(fontSize:17,color: Colors.white),)),
                ),
              ),
            )
          ],
        );
      });}