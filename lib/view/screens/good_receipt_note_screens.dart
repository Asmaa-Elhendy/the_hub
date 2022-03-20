import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:the_hub/controller/exper_api.dart';
import 'package:the_hub/controller/supplier_controller.dart';
import 'package:the_hub/controller/theme_controller.dart';
import 'package:the_hub/view/screens/scan_and_display.dart';
import 'package:the_hub/view/widgets/businesslocation_dropbox.dart';
import 'package:the_hub/view/widgets/datepicker.dart';
import 'package:the_hub/view/widgets/drawer_page.dart';
import 'package:the_hub/view/widgets/purchaseorder_textfield.dart';
import 'package:the_hub/view/widgets/receiptnote_textfield.dart';
import 'package:the_hub/view/widgets/supplier_textfield.dart';
import 'package:get/get.dart';



class GoodReceiptNote extends StatefulWidget {

  @override
  _GoodReceiptNoteState createState() => _GoodReceiptNoteState();
}

class _GoodReceiptNoteState extends State<GoodReceiptNote> {

  var _formkey = GlobalKey<FormState>();
  String _fileName = '...';
  List<String>  businessLocationsNames=[];


  getbusinessLocationName()async{
   List<String>  business_locations_names=  await  ExperApi.GetBusinessLocationsNames();
   businessLocationsNames=business_locations_names;
     setState(() {

     });
  }

  @override
  void initState() {
    super.initState();
  getbusinessLocationName();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var _formkey_purchaseOrder = GlobalKey<FormState>();


    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus;
          currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },

        child: GetBuilder<ThemeController>(
          init: ThemeController(),
          builder:(themecontroller){
            return Scaffold(
        //      drawer: DrawerPage(themeController:themecontroller ,),
              appBar: AppBar(
                titleSpacing: width*.02,
                title: Image.asset("assets/images/logo1.png",
                  height: 40,
                  width: 40,
                ),
                actions: [
                  Icon(Icons.account_circle_rounded,
                    size: 40,
                  )
                ],
              ),
              backgroundColor: Colors.grey[200],
              body: SingleChildScrollView(
                child: Container(
                  width: width,
                    height: height-height*.12,
                  child: Stack(
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(top: height* 0.02),
                        child: Center(
                          child: Column(
                            children: [
                              Text("Good Receipt Note",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 21,
                                    fontWeight: FontWeight.w400
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.symmetric(vertical: height*0.01,horizontal: width * 0.03),
                                child: Container(
                                  //width: double.infinity,

                                //  height: height*.76,
                                  padding: EdgeInsets.only(top: height*0.01,left: width * 0.04,right: width *  0.04),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 3,
                                          blurRadius: 5,
                                          //offset: Offset(0, 3), // changes position of shadow
                                        ),
                                      ],
                                      color: Colors.white
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Supplier:*",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey[700]
                                        ),
                                      ),
                                      Form(
                                          key: _formkey,

                                          child: SupplierDropbox(theme:themecontroller.selectedTheme)),
                                      SizedBox(height: height * .025,),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                                text: "Business Location :  ",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.grey[700])
                                            ),
                                            // TextSpan(
                                            //   text: " to add",
                                            //   style: TextStyle(color: Colors.black)
                                            // ),
                                            WidgetSpan(
                                              child: Icon(Icons.announcement, size: 18,color: Colors.cyan,),
                                            ),
                                          ],
                                        ),
                                      ),
                                      BusinessLocatioDropBox(business_locations_names: businessLocationsNames,),
                                      SizedBox(height: height * .025,),
                                      Text("Purchase Order: ",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey[700]
                                        ),
                                      ),
                                      Form(
                                        child: PurchaseOrderTextField(),

                                      ),
                                      SizedBox(height: height * .025,),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                                text: "Supplier Delivery Note Ref No: ",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.grey[700])
                                            ),
                                            // TextSpan(
                                            //   text: " to add",
                                            //   style: TextStyle(color: Colors.black)
                                            // ),
                                            WidgetSpan(
                                              child: Icon(Icons.announcement, size: 18,color: Colors.cyan,),
                                            ),
                                          ],
                                        ),
                                      ),
                                      ReceiptNoteTextField(),

                                      SizedBox(height: height * .025,),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                                text: "Attach Document ",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.grey[700])
                                            ),
                                            // TextSpan(
                                            //   text: " to add",
                                            //   style: TextStyle(color: Colors.black)
                                            // ),
                                            WidgetSpan(
                                              child: Icon(Icons.announcement, size: 18,color: Colors.cyan,),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: width*0.035),
                                        height: height*0.06,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.grey,
                                            width: 0.5,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                          children: [
                                            Expanded(child:Text(_fileName)),
                                            Container(
                                              margin: EdgeInsets.only(left: 8),
                                              decoration: BoxDecoration(
                                                border: Border(left: BorderSide(color: Colors.grey)),
                                              ),
                                              child: IconButton(
                                                  onPressed: () async{
                                                    final result = await FilePicker.platform.pickFiles();
                                                    if(result == null) {
                                                      return;
                                                    }
                                                    final file = result.files.first;
                                                    final f = File("${file.path}");
                                                    int sizeInBytes = f.lengthSync();
                                                    double sizeInMb = sizeInBytes / (1024 * 1024);
                                                    if (sizeInMb > 5){
                                                      print("this file too big");

                                                      return;
                                                      // This file is Longer the
                                                    }

                                                    openFile(file);
                                                    final newFile = await saveFile(file);
                                                    print("from path:${file.path!}");
                                                    print("to path:${newFile.path }");
                                                    setState(() {
                                                      _fileName = file.name;
                                                    });
                                                  },
                                                  icon: Icon(Icons.add_circle,
                                                    size: MediaQuery.of(context).size.width * 0.05,
                                                    color: themecontroller.selectedTheme.backgroundColor ,
                                                  ) ),
                                            ),
                                          ],
                                        ),

                                      ),
                                      Text("Max File Size : 5mb",
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.grey[600]
                                        ),
                                      ),
                                      SizedBox(height: height * .025,),

                                      Text("Order Date:",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey[700]
                                        ),
                                      ),
                                      DatePicker(),
                                      SizedBox(height: height * .02,),
                                    ],
                                  ),
                                ),
                              ),

                            //  SizedBox(height: height * .05,),
                            ],
                          ),
                        ),
                      ),
                      Positioned(top:height*.82,child:  Padding(
                        padding:  EdgeInsets.symmetric(horizontal: width*.34),
                        child: FlatButton(onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            Get.to(ScanAndDisplay(theme: themecontroller.selectedTheme,));
                          }

                        },
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text: "Next",
                                    style: TextStyle(
                                        fontSize: width*.065,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey[700])
                                ),
                                WidgetSpan(
                                  child: Icon(Icons.arrow_forward, size: 25,color: Colors.grey[800],),
                                ),
                              ],
                            ),
                          ),),
                      ),)
                    ],
                  ),
                ),
              ),
            );}
          ,
        ),
      ),
    );
  }

  void openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }

  Future<File> saveFile(PlatformFile file) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final newFile = File("${appStorage.path}/${file.name}");
    return File(file.path!).copy(newFile.path);

  }
  Widget snackbarWidget(){
    return SnackBar(
      content: Text('Yay! A SnackBar!'),
      backgroundColor: (Colors.black12),
      duration: Duration(seconds: 4),
    );
  }
}

