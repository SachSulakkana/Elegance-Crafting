import 'package:first_project/widgets/LoginText.dart';
import 'package:first_project/widgets/largeText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../extras/Dimentions.dart';
import '../../extras/colors.dart';
import 'SignInPage.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var contactController = TextEditingController();
    var nameController = TextEditingController();
    var signupImeages=[
      "assets/image/Resourses/google.png",
      "assets/image/Resourses/instagram.png",
      "assets/image/Resourses/facebook.png",
    ];
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
                SizedBox(height: Dimentions.height20,),
              //---------------Contact Number-------------------
                AppTextField(textController: contactController,
                  hintText: "Contact Number",
                  icon: Icons.phone, ),
                SizedBox(height: Dimentions.height20,),
//------------------------------------user name------------------------
                AppTextField(textController: nameController,
                  hintText: "User Name",
                  icon: Icons.person_rounded, ),
                SizedBox(height: Dimentions.height20,),
//---------------------------Register--------------------------------------
                Container(
                  width: Dimentions.ScreenWidth/2,
                  height: Dimentions.ScreenHeight/13,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimentions.radius30),
                    color: AppColors.mainColor,
                  ),
                  child: Center(
                    child: largeText(
                      text: "Sign up",
                      size: Dimentions.font20+Dimentions.font20/2,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: Dimentions.height10,),
                RichText(
                  text: TextSpan(
                      recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>SignInPage(),transition: Transition.fade),
                  text: "Have an Account already ?",
                  style: TextStyle(
                    color:Colors.grey[500],
                    fontSize: Dimentions.font20/1.25,
                  )
                ),
               ),
                SizedBox(height: Dimentions.ScreenHeight*0.05,),
//----------------------------using Social media---------------------
                RichText(
                  text: TextSpan(
                      recognizer: TapGestureRecognizer()..onTap=()=>Get.back(),
                      text: "Sign up with",
                      style: TextStyle(
                        color:Colors.grey[500],
                        fontSize: Dimentions.font20/1.5,
                      )
                  ),
                ),
                SizedBox(height: Dimentions.ScreenHeight*0.03,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.transparent,
                      child: Container(
                        height: Dimentions.height10*10,
                        width: Dimentions.width10*10,
                        child: Image.asset(
                            "assets/image/Resourses/google.png",
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.transparent,
                      child: Container(
                        height: Dimentions.height10*10,
                        width: Dimentions.width10*10,
                        child: Image.asset(
                          "assets/image/Resourses/instagram.png",
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.transparent,
                      child: Container(
                        height: Dimentions.height10*10,
                        width: Dimentions.width10*10,
                        child: Image.asset(
                          "assets/image/Resourses/facebook.png",
                        ),
                      ),
                    ),
                  ],
                )
                // Wrap(
                //   children:
                //     List.generate(3, (index) => CircleAvatar(
                //       radius: Dimentions.radius30,
                //       backgroundImage: AssetImage(
                //         "assets/image/Resourses/google.png",
                //       ),
                //     ),
                //     ),
                // )
              ],
            ),
        ),
      ),

    );
  }
}
