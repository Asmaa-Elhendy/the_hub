import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_hub/controller/local_storage.dart';
import 'package:the_hub/model/item_model.dart';
import 'package:the_hub/view/widgets/themes.dart';

class   ThemeController extends GetxController{
  ThemeData selectedTheme =blue;
LocalStorage localStorage=LocalStorage();

void toggleTheme( ThemeData theme){
    selectedTheme=theme;
    update();
  }



}