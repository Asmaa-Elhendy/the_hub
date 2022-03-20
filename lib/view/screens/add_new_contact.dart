import 'dart:math';
import 'package:flutter/material.dart';
import 'package:the_hub/view/widgets/new_contact_form_widgets/buttons.dart';
import 'package:the_hub/view/widgets/new_contact_form_widgets/radiobutton.dart';
import 'package:the_hub/view/widgets/new_contact_form_widgets/textfield.dart';

class AddNewContact extends StatefulWidget {
   AddNewContact({Key? key,required this.theme}) : super(key: key);
   ThemeData theme;
  static const String AddContact='add new contact';

  @override
  State<AddNewContact> createState() => _AddNewContactState();
}

class _AddNewContactState extends State<AddNewContact> {
  final mobileController = TextEditingController();

   final alternateContactNumberController = TextEditingController();

   final landLineController = TextEditingController();

   final emailController = TextEditingController();

   final shippingAddressController = TextEditingController();
   String mobile ="";
   String alternativeNum="";
   String email="";
   String landLine="";
   String shippiingAdress="";



   final formKey = GlobalKey<FormState>();

   final formKey2 = GlobalKey<FormState>();

   double id = Random().nextDouble();
   @override
   void initState() {
     mobileController.addListener(updateMobile);
     emailController.addListener(updateEmail);
     alternateContactNumberController.addListener(updateAltern);
     landLineController.addListener(updateLandline);
     shippingAddressController.addListener(updateShipping);

    super.initState();
  }

   @override

  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    ButtonsWidgets buttonOpject = new ButtonsWidgets(context: context,val: true,width: width,height: height,theme:widget.theme);
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
              Icon(Icons.account_circle_rounded,
                size: 40,
              )
            ],
          ),
          backgroundColor: Colors.grey[200],
          body: SingleChildScrollView(
            padding:  EdgeInsets.symmetric(vertical: height*0.01,
                horizontal: width * 0.03),
            child: Column(
              children: [
             SizedBox(
               height: height*.73,
               child: ListView(
                 children: [
                   Container(
                     padding: EdgeInsets.only(left: width * 0.04,right: width *  0.04),
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
                       children: [
                         RadioButtonWidget(themeData:widget.theme),
                         //SizedBox(height: height * .025,),
                         Divider(
                           height: height*0.0003,
                           thickness: 0.8,
                           color: Colors.black,),
                         SizedBox(height: height * .025,),
                         Form(
                             autovalidateMode: AutovalidateMode.onUserInteraction,
                             key: formKey,                        child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text("Mobile",
                               style: TextStyle(
                                   fontSize: 14,
                                   fontWeight: FontWeight.w700,
                                   color: Colors.grey[700]
                               ),
                             ),

                             AddContactTextField(
                               controller: mobileController,
                               labelTextContent: "Mobile",
                               icon: Icons.phone_android_sharp,

                             ),
                             SizedBox(height: height * .025,),
                             //***************************
                             Text("Mobile",
                               style: TextStyle(
                                   fontSize: 14,
                                   fontWeight: FontWeight.w700,
                                   color: Colors.grey[700]
                               ),
                             ),

                             AddContactTextField(
                               controller: mobileController,
                               labelTextContent: "Mobile",
                               icon: Icons.phone_android_sharp,

                             ),
                             SizedBox(height: height * .025,),

                             Text("Alternate Contact Number",
                               style: TextStyle(
                                   fontSize: 14,
                                   fontWeight: FontWeight.w700,
                                   color: Colors.grey[700]
                               ),
                             ),
                             AddContactTextField(
                               controller: alternateContactNumberController,
                               labelTextContent: "Alternate Contact Number",
                               icon: Icons.phone,
                             ),
                             SizedBox(height: height * .025,),
                             Text("LandLine",
                               style: TextStyle(
                                   fontSize: 14,
                                   fontWeight: FontWeight.w700,
                                   color: Colors.grey[700]
                               ),
                             ),
                             AddContactTextField(
                               controller: landLineController,
                               labelTextContent: "LandLine",
                               icon: Icons.phone,
                             ),
                             SizedBox(height: height * .025,),
                             Text("Email",
                               style: TextStyle(
                                   fontSize: 14,
                                   fontWeight: FontWeight.w700,
                                   color: Colors.grey[700]
                               ),
                             ),
                             AddContactTextField(
                               controller: emailController,
                               labelTextContent: "Email",
                               icon: Icons.email,
                             ),
                             SizedBox(height: height * .025,),
                           ],
                         )
                         ),
                       ],
                     ),

                   ),
                   SizedBox(height: height * .014,),
                   Container(
                     padding: EdgeInsets.only(top: height*0.01,left: width * 0.04,right: width *  0.04),
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(15),
                         boxShadow: [
                           BoxShadow(
                             color: Colors.grey.withOpacity(0.5),
                             spreadRadius: 3,
                             blurRadius: 5,
                           ),
                         ],
                         color: Colors.white
                     ),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text("Shipping Address",
                           style: TextStyle(
                               fontSize: 14,
                               fontWeight: FontWeight.w500,
                               color: Colors.grey[700]
                           ),
                         ),
                         Form(
                           key: formKey2,
                           autovalidateMode: AutovalidateMode.onUserInteraction,
                           child: AddContactTextField(
                             controller: shippingAddressController,
                             labelTextContent: "Shipping Address",

                           ),
                         ),
                         SizedBox(height: height * .025,),

                       ],
                     ),

                   ),
                   SizedBox(height: height * .02,),
                 ],
               ),
             ),
                SizedBox(height: height * .02,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buttonOpject.moreInfoButton(formKey1: formKey,formKey2: formKey2,
                        mobile: mobileController.text==""?null:mobile,
                        email:emailController.text==""?null:email,
                        alternateContactNumber: alternateContactNumberController.text==""?null:alternativeNum,
                        shippingAddress: shippingAddressController.text==""?null:shippiingAdress,
                        landLiner: landLineController.text==""?null:landLine

                    ),
                    buttonOpject.saveButton(formKey1: formKey,formKey2: formKey2,
                        // ignore: unnecessary_null_comparison
                      //   mobile: mobileController!=null?mobileController.text:null,
                      // alternateContactNumber: alternateContactNumberController!=null?alternateContactNumberController.text:null,
                      // email: emailController!=null?emailController.text:null,
                      // shippingAddress: shippingAddressController!=null?shippingAddressController.text:null,
                      // landLiner: landLineController!=null?landLineController.text:null
                      mobile: mobileController.text==""?null:mobile,
                      email:emailController.text==""?null:email,
                      alternateContactNumber: alternateContactNumberController.text==""?null:alternativeNum,
                      shippingAddress: shippingAddressController.text==""?null:shippiingAdress,
                      landLiner: landLineController.text==""?null:landLine,
                      address_1: null,
                      address_2: null,
                      tax: null,
                      city: null,
                      country: null,
                      state: null,
                      zip_Or_postal: null,
                      pay_term_type: null,
                      openingBalance: null,


                    ),



                  ],)




              ],
            ),

          ),
        ),

      ),
    );
  }

  void updateMobile() {
     setState(() {
       if(mobileController.text!=""){
         mobile = mobileController.text;


       }else {
         mobile="";
       }
     });

  }

  void updateEmail() {
     setState(() {
       if(emailController.text!=""){
         email = emailController.text;
       }else{
         email = "";
       }

     });


  }

  void updateAltern() {
     setState(() {
       if(alternateContactNumberController.text!=""){
         alternativeNum=alternateContactNumberController.text;
       }else{
         alternativeNum="";
       }
     });
  }


  void updateLandline() {
     setState(() {
       if(landLineController.text!=""){
         landLine = landLineController.text;
       }else{
         landLine="";
       }
     });
  }

  void updateShipping() {
     setState(() {
       if(shippingAddressController.text!=""){
         shippiingAdress = shippingAddressController.text;
       }else{
         shippiingAdress="";
       }
     });
  }
}
