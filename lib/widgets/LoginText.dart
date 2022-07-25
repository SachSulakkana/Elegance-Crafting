import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../extras/Dimentions.dart';
import '../extras/colors.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final IconData icon;
  const AppTextField({Key? key,
    required this.textController,
    required this.hintText,
    required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: Dimentions.height20,right: Dimentions.height20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Dimentions.radius20),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              spreadRadius: 3,
              offset: Offset(1, 5),
              color: Colors.grey.withOpacity(0.1),
            )
          ]
      ),
      child: TextField(
        controller: textController,
        decoration: InputDecoration(
          //hintText
          hintText: hintText,
          //prefixIcon
          prefixIcon:Icon(icon,color: AppColors.yellowColor,) ,
          //focusedBorder
          focusedBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimentions.radius30),
            borderSide: BorderSide(
              width: 1.0,
              color: Colors.white,
            ),
          ),
          //enabledBorder
          enabledBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimentions.radius30),
            borderSide: BorderSide(
              width: 1.0,
              color: Colors.white,
            ),
          ),
          //border
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimentions.radius30),
          ),
        ),
      ),
    );
  }
}
