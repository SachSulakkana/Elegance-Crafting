import 'package:first_project/widgets/LoginText.dart';
import 'package:first_project/widgets/largeText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../extras/Dimentions.dart';
import '../../extras/colors.dart';
import 'SignUp.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var contactController = TextEditingController();
    var nameController = TextEditingController();
    return Scaffold(

      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.mainColor,
                Colors.white,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: Dimentions.ScreenHeight*0.05,),
              //------------------------logo---------------
              Container(
                height:Dimentions.ScreenHeight*0.25,
                child: Center(
                  child: CircleAvatar(
                    radius:80,
                    backgroundImage: AssetImage(
                      "assets/image/Resourses/Logo.jpg",
                    ),
                  ),
                ),
              ),
              //------------WellCome-----------------------
              Container(
                margin: EdgeInsets.only(left: Dimentions.width20),
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome",
                      style: TextStyle(
                        fontSize: Dimentions.font20*3+Dimentions.font20/2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),Text(
                      "Sign in to your account !",
                      style: TextStyle(
                        fontSize: Dimentions.font20,
                        color: Colors.grey[500],
                      ),
                    )
                  ],
                ),
              ),
               SizedBox(height: Dimentions.height20,),
              //-------------------email-------------------
              AppTextField(textController: emailController,
                hintText: "E-mail",
                icon: Icons.email, ),
              SizedBox(height: Dimentions.height20,),
              //---------password---------------------
              AppTextField(textController: passwordController,
                  hintText: "Password",
                  icon: Icons.password_sharp
              ),
              SizedBox(height: Dimentions.height10,),
              Row(
                children: [
                  Expanded(child: Container(),
                  ),
                  RichText(
                    text: TextSpan(
                        text: "Sign in to your account",
                        style: TextStyle(
                          color:Colors.grey[500],
                          fontSize: Dimentions.font20/1.25,
                        )
                    ),
                  ),
                  SizedBox(width: Dimentions.width10,)
                ],
              ),
              SizedBox(height: Dimentions.ScreenHeight*0.05,),
              Container(
                width: Dimentions.ScreenWidth/2,
                height: Dimentions.ScreenHeight/13,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimentions.radius30),
                  color: AppColors.mainColor,
                ),
                child: Center(
                  child: largeText(
                    text: "Sign in",
                    size: Dimentions.font20+Dimentions.font20/2,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: Dimentions.ScreenHeight*0.05,),
//----------------------------using Social media---------------------
              RichText(
                text: TextSpan(
                    text: "Don\'t have an account? ",
                    style: TextStyle(
                      color:Colors.grey[500],
                      fontSize: Dimentions.font20,
                    ),
                  children: [
                    TextSpan(
                    recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>SignUpPage(),transition: Transition.fade),
                    text: "Create",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    color:AppColors.navipink,
                    fontSize: Dimentions.font20,
                     ),
                    )
                  ]
                ),
              ),
              SizedBox(height: Dimentions.ScreenHeight*0.03,),
            ],
          ),
        ),
      ),

    );
  }
}
