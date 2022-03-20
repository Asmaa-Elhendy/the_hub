
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class AddContactTextField extends StatelessWidget {
  TextEditingController controller;
  String labelTextContent;
  var icon;
  //bool? isImage = false;

  AddContactTextField({required this.controller,required this.labelTextContent,this.icon });




  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (labelTextContent == 'Email') {
          if (EmailValidator.validate(value!)) {
            return null;
          }
          if (value.length == 0) {
            return "* please enter Email";
          }
          return "* please enter valid Email";

        }else if(labelTextContent=='Mobile') {          //check 12 number
          RegExp phoneRegExp = new RegExp(
            r"^01[0125][0-9]{8}$",                 //phone_number: ^0.12.0+1

          );
          if (value!.length == 0) {
            return '* Please enter Mobile Number';
          }
          else if (!phoneRegExp.hasMatch(value)) {
            return '* Please enter valid Mobile number';
          }
          return null;
        }
        else {
          if (value == null || value.isEmpty) {
            return '* Please enter ${labelTextContent}';
          }
          return null;
        }
      },
        decoration: InputDecoration(
      contentPadding: EdgeInsets.only(left: 8.0, bottom: 8.0, top: 8.0),
      isDense: true,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
        ),
      ),
      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
      prefixIcon:icon == null?null: Container(
        margin: EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          border: Border(right: BorderSide(color: Colors.grey)),
        ),
        child:labelTextContent=="Country"||labelTextContent=="Zip/Postal code"? Image.asset(icon, color: Colors.black,
        ): Icon(
          icon,
          color: Colors.black,
          size: MediaQuery.of(context).size.width * 0.08,
        ),
      ),
      labelText: labelTextContent,

    ),
      keyboardType: labelTextContent == "Mobile"
          ? TextInputType.phone
          : TextInputType.text,


    );
  }
}
