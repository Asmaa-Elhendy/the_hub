import 'package:flutter/material.dart';
import 'package:the_hub/view/widgets/new_contact_form_widgets/buttons.dart';
import 'package:the_hub/view/widgets/new_contact_form_widgets/payterm_dropbox.dart';
import 'package:the_hub/view/widgets/new_contact_form_widgets/textfield.dart';
class AdditionalNewContactData extends StatefulWidget {
  static ValueNotifier<String> selectedValue =ValueNotifier("");


  String? mobile;
    String? alternativeNum;
    String? landline;
    String? email;
    String? shippngAddress;

   AdditionalNewContactData({Key? key,required this.theme,this.email,this.mobile,this.alternativeNum,this.landline,this.shippngAddress}) : super(key: key);
   ThemeData theme;

  @override
  State<AdditionalNewContactData> createState() => _AdditionalNewContactDataState();
}

class _AdditionalNewContactDataState extends State<AdditionalNewContactData> {
  final taxeController = TextEditingController();

  final openingBalanceController = TextEditingController();

  final address_1Controller = TextEditingController();

   final address_2Controller = TextEditingController();

    final cityController = TextEditingController();

    final countryController = TextEditingController();

    final zipController = TextEditingController();

    final stateController = TextEditingController();

    String state ="";
    String city="";
    String zip="";
    String country="";
    String tax="";
    String address1="";
    String address2="";
    String oppeniingBalance="";
    String ?payTerm;

    @override
    void initState() {
      taxeController.addListener(updateTax);
      countryController.addListener(updateCountry);
      cityController.addListener(updateCity);
      stateController.addListener(updateState);
      zipController.addListener(updateZip);
      address_1Controller.addListener(updateAddress1);
      address_2Controller.addListener(updateAddress2);
      openingBalanceController.addListener(updateOpening);
      AdditionalNewContactData.selectedValue.value = AdditionalNewContactData.selectedValue.value;
      update_PayTerm();


    super.initState();
  }

   @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    updateFunc(){
      setState(() {
        AdditionalNewContactData.selectedValue.value = AdditionalNewContactData.selectedValue.value;
      });
    }
    ButtonsWidgets buttonOpject =
        new ButtonsWidgets(context: context,val: false, width: width, height: height,theme: widget.theme);
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
            appBar: AppBar(
              title: Text("Add New Contact"),
              actions: [
                Icon(
                  Icons.account_circle_rounded,
                  size: 40,
                )
              ],
            ),
            backgroundColor: Colors.grey[200],
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                  vertical: height * 0.02, horizontal: width * 0.03),
              child: Column(
                children: [
                  Container(
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
                    Text("Tax Number",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey[700]
                      ),
                    ),
                    AddContactTextField(
                      controller: taxeController,
                      labelTextContent: "Enter Tax Number",
                      icon: Icons.info_outlined,
                    ),
                    SizedBox(height: height * .025,),
                    Text("Opening Balance",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey[700]
                      ),
                    ),
                    AddContactTextField(
                      controller: openingBalanceController,
                      labelTextContent: "Enter Opening Balance ",
                      icon: Icons.money_sharp,
                    ),
                    SizedBox(height: height * .025,),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "Pay Term  ",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[700])
                          ),

                          WidgetSpan(
                            child: Icon(Icons.announcement, size: 18,color: Colors.cyan,),
                          ),


                        ],
                      ),
                    ),
                    PayTermDropBox(
                        update: updateFunc,
                    ),

                    SizedBox(height: height * .025,),
                  ]
              )
                  ),
                  SizedBox(height: height * .025,),
                  Container(
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
                          Text("Address Line 1",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey[700]
                            ),
                          ),
                          AddContactTextField(
                            controller: address_1Controller,
                            labelTextContent: "Enter Address Line 1",
                          ),
                          SizedBox(height: height * .025,),
                          Text("Address Line 2",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey[700]
                            ),
                          ),
                          AddContactTextField(
                            controller: address_2Controller,
                            labelTextContent: "Enter Address Line 2",
                          ),
                          SizedBox(height: height * .03,),
                      GridView.count(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                        childAspectRatio: 3/1.5,
                        crossAxisCount: 2,//0.82
                        crossAxisSpacing: 6,
                        children: [

                             AddContactTextField(
                              controller: cityController,
                              labelTextContent: "City",
                               icon: Icons.location_on,
                            ),
                          AddContactTextField(
                            controller: stateController,
                            labelTextContent: "State",
                            icon: Icons.location_on,

                          ),
                          AddContactTextField(
                            controller: countryController,
                            labelTextContent: "Country",
                            icon:
                            "assets/images/earth.png",
                          ),
                          AddContactTextField(

                            controller: zipController,
                            labelTextContent: "Zip/Postal code",
                            icon: "assets/images/zip-code.png",
                          ),
                        ],
                      )
                        ]
                    )

                  ),
                  SizedBox(height: height * .04,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buttonOpject.backButton(),
                      buttonOpject.saveButton(
                        mobile: widget.mobile,
                        landLiner: widget.landline,
                        email: widget.email,
                        alternateContactNumber: widget.alternativeNum,
                        shippingAddress: widget.shippngAddress,
                        // address_1: address_1Controller!=null?address_1Controller.text:null,
                        // address_2: address_2Controller!=null?address_2Controller.text:null,
                        // tax: taxeController!=null?taxeController.text:null,
                        // openingBalance: openingBalanceController!=null?openingBalanceController.text:null,
                        // pay_term_type: PayTermDropBox.selectedValue,
                        // city: cityController!=null?cityController.text:null,
                        // country: countryController!=null?countryController.text:null,
                        // state: stateController!=null?stateController.text:null,
                        // zip_Or_postal: zipController!=null?zipController.text:null
                        address_1: address_1Controller.text==""?null:address1,
                        address_2: address_2Controller.text==""?null:address2,
                        tax: taxeController.text==""?null:tax,
                        city: cityController.text==""?null:city,
                        country: countryController.text==""?null:country,
                        state: stateController.text==""?null:state,
                        zip_Or_postal: zipController.text==""?null:zip,
                        pay_term_type:AdditionalNewContactData.selectedValue.value,
                        openingBalance: openingBalanceController.text==""?null:oppeniingBalance,







                      ),

                    ],)


                ],
              ),
            )),
      ),
    );
  }

  void updateTax() {
      setState(() {
        if(taxeController.text!=""){
          tax=taxeController.text;
        }else{
          tax="";
        }
      });
  }

  void updateCountry() {
      setState(() {
        if(countryController.text!=""){
          country=countryController.text;
        }
        else{
          country="";
        }
      });
  }

  void updateCity() {
      setState(() {
        if(cityController.text!=""){
          city = cityController.text;
        }else{
          city="";
        }
      });
  }

  void updateState() {
      setState(() {
        if(stateController.text!=""){
          state = stateController.text;
        }else{
          state = "";
        }
      });
  }

  void updateZip() {
      setState(() {
        if(zipController.text!=""){
          zip = zipController.text;
        }else{
          zip = "";
        }
      });
  }

  void updateAddress1() {
      setState(() {
        if(address_1Controller.text!=""){
          address1 = address_1Controller.text;
        }else{
          address1 = "";
        }

      });
  }

  void updateAddress2() {
      setState(() {
        if(address_2Controller.text!=""){
          address2 = address_2Controller.text;
        }else{
          address2 = "";
        }
      });
  }

  void updateOpening() {
      setState(() {
        if(openingBalanceController.text!=""){
          oppeniingBalance = openingBalanceController.text;
        }else{
          oppeniingBalance = "";
        }
      });
  }

  void update_PayTerm() {
      setState(() {
        payTerm = AdditionalNewContactData.selectedValue.value;
        // if(AdditionalNewContactData.selectedValue.value==""){
        //   payTerm = null;
        // }else{
        //   payTerm = AdditionalNewContactData.selectedValue.value;
        // }
      });
  }
}
