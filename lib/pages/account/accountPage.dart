import 'package:first_project/extras/Dimentions.dart';
import 'package:first_project/extras/colors.dart';
import 'package:first_project/widgets/AccountWidget.dart';
import 'package:first_project/widgets/largeText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/AppIcon.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: largeText(
          text:"Profile",
          size: 24,color: Colors.white,
        ),
      ),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: Dimentions.height20,),
        child: Column(
          children: [
            AppIcon(
                icon:Icons.person,
              bgcolor: AppColors.mainColor,
              size: Dimentions.height15*10,
              iconcolor: AppColors.peowhite,
              iconSize: Dimentions.height15*5,
            ),
            SizedBox(height: Dimentions.height30,),
            Expanded(child:
             SingleChildScrollView(
              child: Column(
                children: [
                  //Name
                  AccountWidget(
                    appIcon: AppIcon(
                      icon:Icons.person,
                      bgcolor: AppColors.navipink,
                      size: Dimentions.height10*5,
                      iconcolor: AppColors.peowhite,
                      iconSize: Dimentions.height5*5,
                    ),
                    largetext:largeText(text: "Sach Sulakkana",),
                  ),
                  SizedBox(height: Dimentions.height30,),
                  //Telephone Number
                  AccountWidget(
                    appIcon: AppIcon(
                      icon:Icons.phone_android,
                      bgcolor: Colors.orange,
                      size: Dimentions.height10*5,
                      iconcolor: AppColors.peowhite,
                      iconSize: Dimentions.height5*5,
                    ),
                    largetext:largeText(text: "071 9521069",),
                  ),
                  SizedBox(height: Dimentions.height30,),
                  //E-mail
                  AccountWidget(
                    appIcon: AppIcon(
                      icon:Icons.email_rounded,
                      bgcolor: Colors.lightBlueAccent,
                      size: Dimentions.height10*5,
                      iconcolor: AppColors.peowhite,
                      iconSize: Dimentions.height5*5,
                    ),
                    largetext:largeText(text: "Sachsulakkana@gmail.com",),
                  ),
                  SizedBox(height: Dimentions.height30,),
                  //Address
                  AccountWidget(
                    appIcon: AppIcon(
                      icon:Icons.location_on,
                      bgcolor: Colors.greenAccent,
                      size: Dimentions.height10*5,
                      iconcolor: AppColors.peowhite,
                      iconSize: Dimentions.height5*5,
                    ),
                    largetext:largeText(text: "Eneter Your Address here",),
                  ),
                  SizedBox(height: Dimentions.height30,),
                  //Message
                  AccountWidget(
                    appIcon: AppIcon(
                      icon:Icons.chat,
                      bgcolor: Colors.green,
                      size: Dimentions.height10*5,
                      iconcolor: AppColors.peowhite,
                      iconSize: Dimentions.height5*5,
                    ),
                    largetext:largeText(text: "Enter Your Massage Here!",),
                  ),
                  SizedBox(height: Dimentions.height30,),
                  AccountWidget(
                    appIcon: AppIcon(
                      icon:Icons.devices_other,
                      bgcolor: Colors.redAccent,
                      size: Dimentions.height10*5,
                      iconcolor: AppColors.peowhite,
                      iconSize: Dimentions.height5*5,
                    ),
                    largetext:largeText(text: "Any thing",),
                  ),
                  SizedBox(height: Dimentions.height30,),
                  //Message


                ],
              ),
            )
            ),



          ],
        ),
      ),

    );
  }
}
