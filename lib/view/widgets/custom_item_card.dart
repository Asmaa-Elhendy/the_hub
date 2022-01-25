import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_hub/controller/quantity_controller.dart';
import 'package:the_hub/model/item_model.dart';
import 'package:the_hub/view/widgets/themes.dart';


class CustomItemCard extends StatelessWidget {
   CustomItemCard({Key? key,required this.item,required this.selected_theme}) : super(key: key);
  final Item item;
  ThemeData selected_theme;

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Container(
      height: height*.2,
      width: width*.8,
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: width*.06,vertical: height*.011),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: height*.02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width*.08),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text(item.name),
                  Text(item.barcode)
                ],),
              ),
              GetBuilder<QuantityController>(
                init: QuantityController(),
                builder: ( controller) {
                  return  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: width*.08),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Current Stock: ${item.current_stock}'),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: (){
                                controller.decrement(item);
                              },
                              child: Container(
                                width: width*.075,height:height *.08,
                                decoration: BoxDecoration(shape: BoxShape.circle, color: selected_theme.backgroundColor,),
                                child: Center(
                                  child: Text('-',style: TextStyle(color: Colors.white,fontSize: width*.1),),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(1.0),
                              child: Text(item.default_quantity.toString()),
                            ),
                            InkWell(
                              onTap: (){
                                controller.increment(item);
                              },
                              child: Container(
                                width: width*.075,height:height *.08,
                                decoration: BoxDecoration(shape: BoxShape.circle, color: selected_theme.backgroundColor,),
                                child: Center(
                                  child: Text('+',style: TextStyle(color: Colors.white,fontSize: width*.07),),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],),
                  );
                },

              )

            ],
          ),
        ),
      ),
    );
  }
}
