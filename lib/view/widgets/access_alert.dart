import 'package:flutter/material.dart';
import 'package:get/get.dart';

AceesssAlert(BuildContext context,double width , double height,ThemeData themeData,String content) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title:  Row(
            children: [
              Icon(Icons.error,color: Colors.red,),
              SizedBox(width: width*.02,),
              Text("Disable"),
            ],
          ),
          content:  Text(content),
          actions: [
            Container(
              width: width*.3,
              height: height*.045,
              child: ElevatedButton(
                  onPressed: (){Get.back();},
                  child: const Text(
                    'ok',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(35))),
                    backgroundColor:
                    MaterialStateProperty.all(themeData.backgroundColor),
                  )),
            )

          ],
        );
      });
}