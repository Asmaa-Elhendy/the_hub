import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_hub/model/item_model.dart';

class QuantityController extends GetxController{

  void increment(Item item){
    item.default_quantity++;
    update();
  }

  void decrement(Item item){
   if(item.default_quantity>0){
     item.default_quantity--;
   }
    update();
  }



}