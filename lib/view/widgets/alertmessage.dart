import 'package:flutter/material.dart';

Alertmessage(BuildContext context,String errormesg,ThemeData themeData,double width,double height){
  showDialog(
      context: context,
      builder: (context) {
    return AlertDialog(
        title: const Text("Warning !"),
  content:  Padding(
    padding:  EdgeInsets.symmetric(horizontal: width*.03),
    child: Text(errormesg),
  ),
  actions: [
    Container(
      width: width*.35,
      height: height*.045,
      child: ElevatedButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: const Text(
            'try again ',
            style: TextStyle(color: Colors.white),
          ),
          style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(35))),
            backgroundColor:
            MaterialStateProperty.all(themeData.backgroundColor),
          )),
    )

  ]
    );
});}