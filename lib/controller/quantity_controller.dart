import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_hub/model/item_model.dart';

class QuantityController extends GetxController{

  void increment(Item item){
    item.quantity++;
    update();
  }

  void decrement(Item item){
   if(item.quantity>0){
     item.quantity--;
   }
    update();
  }



}