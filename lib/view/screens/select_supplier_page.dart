import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:the_hub/view/screens/good_receipt_note_screens.dart';
import 'package:get/get.dart';
import '../../controller/supplier_controller.dart';
import '../widgets/access_alert.dart';
import '../widgets/button.dart';
import 'add_new_contact.dart';

List items = [];
TextEditingController supplierController = TextEditingController();

class SelectSupplierPage extends StatefulWidget {
  SelectSupplierPage({required this.theme});
  ThemeData theme;
  @override
  State<SelectSupplierPage> createState() => _SelectSupplierPageState();
}

class _SelectSupplierPageState extends State<SelectSupplierPage> {





  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus;
          currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
            backgroundColor: widget.theme.backgroundColor,
            body: SingleChildScrollView(
                child: Container(
                    width: width,
                    height: height - height * 0.04,
                    color: widget.theme.backgroundColor,
                    child: Stack(children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: height * .1,
                            left: width * .4,
                            right: width * .4),
                        child: Image.asset(
                          "assets/images/logo.png",
                          color: Colors.white,
                        ),
                      ),
                      Positioned(
                          top: height * .34,
                          child: Container(
                              width: width,
                              height: height * .6,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                              child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width * .04),
                                  child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: height * .05,bottom: height*.075),
                                          child: const Text(
                                            'Select supplier',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 21,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              bottom: height * .02),
                                          child: Text(
                                            "Suppliers:",
                                            style: TextStyle(
                                                color: Colors.grey[600],
                                                fontSize: 17),
                                          ),
                                        ),
                                        SupplierDropbox(theme:widget.theme,addnew: false,),
                                        InkWell(
                                          onTap: (){
                                            //permission to add supplier yes->add supplier , no->alert
                                            bool permission_add_supplier=true;
                                            //list of items of suppliers
                                            print('asmaa**********');
                                            print(supplierController.text);
                                            bool isexist=items.contains(supplierController.text);
                                       isexist?Get.to(GoodReceiptNote(/*supplier*/already_select_supplier: true,)):
                                            permission_add_supplier==true? Get.to(AddNewContact(theme :widget.theme)):
                                            AceesssAlert(context, width , height,widget.theme,"you don\'t have access to add supplier")
                                            ;
                                           //
                                          },
                                          child: Center(
                                            child: Padding(
                                              padding:  EdgeInsets.symmetric(vertical: height*.05),
                                              child: CustomButton(theme: widget.theme,title: 'Go',),
                                            ),
                                          ),
                                        )



                                      ]))
                          ))
                    ])))),
      ),
    );
  }

}

class SupplierDropbox extends StatefulWidget {

  ThemeData theme;
  bool addnew;
  SupplierDropbox({Key? key,required this.theme,this.addnew=true}) : super(key: key);

  @override
  _SupplierDropboxState createState() => _SupplierDropboxState();
}

class _SupplierDropboxState extends State<SupplierDropbox> {



  // getSuppliers_names();
  getitem() async{
    items = await SupplierHelper.getSupplier();
  }


  @override
  void initState() {
    super.initState();
    SupplierHelper.getSupplier();
    //items= getSuppliers_names();
    getitem();

    print("itttt $items");
    // items=[];
    // items = getSuppliers_names();

  }
  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return
      TypeAheadFormField(direction: AxisDirection.up,
        textFieldConfiguration: TextFieldConfiguration(
          onTap: (){
            SupplierHelper.getSupplier();
            setState(() {
              //items = getSuppliers_names();
              getitem();
              print("supp $items");

            });
          },
          controller: supplierController,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
              contentPadding:
              EdgeInsets.only(
                  left: 8.0,
                  bottom: 8.0,
                  top: 8.0),
              isDense: true,

              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),

              prefixIcon: Container(
                margin: EdgeInsets.only(right: 8),
                decoration: const BoxDecoration(
                  border: Border(right: BorderSide(color: Colors.grey)),
                ),
                child: Icon(
                  Icons.person,
                  color: Colors.grey[700],
                  size: MediaQuery.of(context).size.width * 0.07,
                ),
              ),
              labelText: 'Please Select'),
        ),
        suggestionsCallback: (pattern) {
          return items.where((element) =>
              element.toLowerCase().contains(pattern.toLowerCase()));
        },
        itemBuilder: (_, ittem) => ListTile(
          title: Text(ittem.toString()),
        ),
        onSuggestionSelected: ( val) {
          setState(() {
            supplierController.text = val.toString() ;
          });
        },
        getImmediateSuggestions: true,
        hideSuggestionsOnKeyboardHide: false,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please select ';
          }
        },
      );
  }}