import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:the_hub/view/screens/additonal_newcontact_data.dart';

import 'confirmation_alert_widget.dart';
class ButtonsWidgets{
  BuildContext  context;
  bool val;
  var width;
  var height;
  ThemeData theme;
  ButtonsWidgets({required this.width, required this.height, required this.context,required this.val,required this.theme});

  Widget saveButton({formKey1,formKey2}){

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
          // checkValidate(){
          //    {
          //     // print(emailController.text);
          //     // print(passwordController.text);
            //}
          if(val){
            if (formKey1.currentState.validate()&&formKey2.currentState.validate()){
              Alert(context,width,height );
            }
          }
             else
          Alert(context,width,height );
        }, child: Text("Save",

          style: TextStyle(
              fontSize: width *0.05,
              fontWeight: FontWeight.w600
          )),),
    );

  }
  Widget moreInfoButton({formKey1,formKey2}){
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
                    builder: (context) => AdditionalNewContactData(theme:theme)),
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