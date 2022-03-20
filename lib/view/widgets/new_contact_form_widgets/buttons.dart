import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:the_hub/controller/supplier_controller.dart';
import 'package:the_hub/view/screens/additonal_newcontact_data.dart';

import 'confirmation_alert_widget.dart';
class ButtonsWidgets{
  BuildContext  context;
  bool val;
  var width;
  var height;
  ThemeData theme;

  ButtonsWidgets({
    required this.width, required this.height, required this.context,required this.val,
    required this.theme
  });

  Widget saveButton({formKey1,formKey2,
    String? mobile,
    String? name,

    String? alternateContactNumber,

  String? landLiner,
  String? email,
  String? shippingAddress,
  String? tax,
  String? openingBalance,
  String? address_1,
  String? address_2,
    String?city,
    String?state,
    String?country,
    String?zip_Or_postal,
    String?pay_term_type

  }){

    return Container(
      width: width*0.43,
      height: height * 0.08,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color?>(theme.backgroundColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                )
            )),

        onPressed: (){
          print("in button issss$email,$landLiner,$zip_Or_postal,$country,$mobile,$alternateContactNumber,$shippingAddress,");
          // SupplierHelper.addSupplier(
          //   zip_Or_postal: zip_Or_postal,
          //   state: state,
          //    country: country,
          //   city: city,
          //   email: email,
          //   mobile: mobile,
          //   address1: address_1,
          //   address2: address_2,
          //   alternate_number: alternateContactNumber,
          //    landline: landLiner,
          //   opening_balance: openingBalance,
          //   pay_term: pay_term_type,
          //   shipping_address: shippingAddress,
          //   tax_number: tax
          // );
          // checkValidate(){
          //    {
          //     // print(emailController.text);
          //     // print(passwordController.text);
            //}
          if(val){
            if (formKey1.currentState.validate()&&formKey2.currentState.validate()){
              //Alert(context,width,height );
              Alert(
                  context,width,height,openingBalance: openingBalance,pay_term_type: pay_term_type,zip_Or_postal: zip_Or_postal,
                  state: state,country: country,city: city,tax: tax,address_2: address_2,address_1: address_1,landLiner: landLiner,
                  shippingAddress: shippingAddress,alternateContactNumber: alternateContactNumber,email: email,mobile: mobile,name: name
              );
            }
          }
             else {
            Alert(
              context,width,height,openingBalance: openingBalance,pay_term_type: pay_term_type,zip_Or_postal: zip_Or_postal,
            state: state,country: country,city: city,tax: tax,address_2: address_2,address_1: address_1,landLiner: landLiner,
            shippingAddress: shippingAddress,alternateContactNumber: alternateContactNumber,email: email,mobile: mobile,name: name
          );
          }
        }, child: Text("Save",

          style: TextStyle(
              fontSize: width *0.05,
              fontWeight: FontWeight.w600
          )),),
    );

  }
  Widget moreInfoButton({formKey1,formKey2,
    String? mobile,
    String? name,
    String? alternateContactNumber,
    String? landLiner,
    String? email,
    String? shippingAddress,
  }){
    return Container(
      width: width*0.43,
      height: height * 0.08,

      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color?>(theme.primaryColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide(color: theme.backgroundColor)
                  )
              )),
          onPressed: () {
            if (formKey1.currentState.validate()&&formKey2.currentState.validate()){
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AdditionalNewContactData(theme:theme,
                      name: name,
                      mobile: mobile,
                      alternativeNum: alternateContactNumber,
                      shippngAddress: shippingAddress,
                      landline: landLiner,
                      email: email,
                    )),
              );
            }

          },
          child: RichText(
            text: TextSpan(
                children: [
                  TextSpan(
                      text: "More Info",
                      style: TextStyle(color: theme.backgroundColor,
                          fontSize: width *0.05,
                          fontWeight: FontWeight.w600
                      )
                  ),
                  WidgetSpan(child: Icon(Icons.arrow_right_alt, size: width *0.055,color: theme.backgroundColor,),)
                ]
            ),
          )
      ),
    );
  }
  Widget backButton(){
    return Container(
      width: width*0.43,
      height: height * 0.08,

      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color?>(theme.primaryColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide(color: theme.backgroundColor)
                  )
              )),
        onPressed: () {
          Navigator.pop(context);
        },
          child: RichText(
            text: TextSpan(
                children: [
                  WidgetSpan(child: Icon(Icons.arrow_back_sharp, size: width *0.055,color: theme.backgroundColor,),),
                  TextSpan(
                      text: "Back",
                      style: TextStyle(color: theme.backgroundColor,
                          fontSize: width *0.05,
                          fontWeight: FontWeight.w600
                      )
                  ),

                ]
            ),
          )
      ),
    );
  }

}