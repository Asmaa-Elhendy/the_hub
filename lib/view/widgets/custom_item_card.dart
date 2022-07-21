import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_hub/controller/quantity_controller.dart';
import 'package:the_hub/model/item_model.dart';
import 'package:the_hub/view/widgets/themes.dart';


class CustomItemCard extends StatelessWidget {
   CustomItemCard({required this.item,required this.selected_theme,required this.remove}) ;
   Item item;
  ThemeData selected_theme;
  Function remove;

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    bool permission_add_exceeded_quantity_than_lpo=true;
    int quantity = item.quantity;
    return Container(
      height: height*.22,
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
                padding: EdgeInsets.only(left: width*.08,right: width *.04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text(item.name),


                    Text(item.barcode),
                      //padding: EdgeInsets.only(right: width*.03),

                       InkWell(
                        onTap: remove(),
                        child: Icon(Icons.delete_forever,
                          color: Colors.red,
                        ),
                      ),
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
                              child: item.quantity>0?Container(
                                        width: width*.07,height:height *.07,
                                        decoration: BoxDecoration(shape: BoxShape.circle, color: selected_theme.backgroundColor,),
                                        child: Center(
                                          child: Text('-',style: TextStyle(color: Colors.white,fontSize: width*.1),)
                                        ),
                                      ):SizedBox(),

                            ),
                            Padding(
                                    padding: EdgeInsets.all(2.0),
                                    child: Text(
                                        item.quantity.toString(),
                                      style: TextStyle(
                                        color: item.quantity==0?Colors.red:Colors.black,
                                      ),
                                    ),
                                  ),

                            InkWell(
                              onTap: (){
                                controller.increment(item);
                              },
                              child: permission_add_exceeded_quantity_than_lpo==false?item.quantity==0 || item.quantity<quantity?
                                 Container(
                                        width: width*.07,height:height *.07,
                                        decoration: BoxDecoration(shape: BoxShape.circle, color: selected_theme.backgroundColor,),
                                        child: Center(
                                          child: Text('+',style: TextStyle(color: Colors.white,fontSize: width*.052),),
                                        ),
                                      ):

                                   SizedBox(): Container(
    width: width*.07,height:height *.07,
    decoration: BoxDecoration(shape: BoxShape.circle, color: selected_theme.backgroundColor,),
    child: Center(
    child: Text('+',style: TextStyle(color: Colors.white,fontSize: width*.052),),
    ),
    )

                            )



                          ],
                        )
                        // Row(
                        //   crossAxisAlignment: CrossAxisAlignment.center,
                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //   children: [
                        //     InkWell(
                        //       onTap: (){
                               // controller.decrement(item);
                        //       },
                        //       child: Container(
                        //         width: width*.075,height:height *.08,
                        //         decoration: BoxDecoration(shape: BoxShape.circle, color: selected_theme.backgroundColor,),
                        //         child: Center(
                        //           child: Text('-',style: TextStyle(color: Colors.white,fontSize: width*.1),),
                        //         ),
                        //       ),
                        //     ),
                        //     Padding(
                        //       padding: EdgeInsets.all(1.0),
                        //       child: Text(item.quantity.toString()),
                        //     ),
                        //     item.quantity == item.quantity?Container():
                        //     InkWell(
                        //       onTap: (){
                        //
                        //         controller.increment(item);
                        //       },
                        //       child: Container(
                        //         width: width*.075,height:height *.08,
                        //         decoration: BoxDecoration(shape: BoxShape.circle, color: selected_theme.backgroundColor,),
                        //         child: Center(
                        //           child: Text('+',style: TextStyle(color: Colors.white,fontSize: width*.07),),
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // )
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
