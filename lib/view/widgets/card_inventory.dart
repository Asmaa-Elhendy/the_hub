import 'package:flutter/material.dart';

class CardInventory extends StatelessWidget {
 double width;
 double height;
 String barcodevalue;
 CardInventory({required this.width,required this.height,required this.barcodevalue});

  @override
  Widget build(BuildContext context) {
    return    Container(
        height: height * .17,
        width: width * .5,
        child: Card(
          margin: EdgeInsets.symmetric(
              horizontal: width * .13,
              vertical: height * .011),
          elevation: 4,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width*.08,vertical: height*.02),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('name',style: TextStyle(fontSize: 16),),
                    Text('$barcodevalue',style:TextStyle(fontSize: 16),)
                  ],),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Current stock',style:TextStyle(fontSize: 16),),
                    Text('value',style:TextStyle(fontSize: 16),)
                  ],)
              ],
            ),
          ),
        ));
  }
}
