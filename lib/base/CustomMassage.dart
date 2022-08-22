import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/largeText.dart';

void ShowCustomMassage(String message,{bool isError = true,String title="Error"}){
Get.snackbar(title, message,
titleText: largeText(text: title,color: Colors.white,),
  messageText: Text(message,style: TextStyle(
    color: Colors.white,
  ),
  ),
  colorText: Colors.white,
  snackPosition: SnackPosition.TOP,
  backgroundColor: Colors.red,
);
}