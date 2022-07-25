import 'package:first_project/extras/Dimentions.dart';
import 'package:first_project/extras/colors.dart';
import 'package:first_project/widgets/AppIcon.dart';
import 'package:first_project/widgets/largeText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountWidget extends StatelessWidget {
  AppIcon appIcon;
  largeText largetext;
  AccountWidget({Key? key,required this.appIcon,required this.largetext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.only(left: Dimentions.width20,
      top: Dimentions.width10,
      bottom: Dimentions.width10,),
      child: Row(
        children: [
          appIcon,
          SizedBox(width: Dimentions.width20,),
          largetext,
        ],
      ),
      decoration: BoxDecoration(
        color: AppColors.peowhite,
        boxShadow: [
          BoxShadow(
            blurRadius: 1,
            offset: Offset(0, 3),
            color: Colors.grey.withOpacity(0.2),
          ),
        ]
      ),
    );
  }
}
