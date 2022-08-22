import 'dart:math';

import 'package:first_project/extras/Dimentions.dart';
import 'package:first_project/widgets/AppIcon.dart';
import 'package:first_project/widgets/smallText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/PopularProductController.dart';
import '../../extras/colors.dart';
import '../../routes/route_helper.dart';
import '../../widgets/largeText.dart';
import '../Items/RecommendedItems.dart';

class CraftCatogary extends StatelessWidget {

  const CraftCatogary({Key? key,}) : super(key: key);
//-----------------------------------------------------------------------------------
  int get index => 1;
//------------------------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:
        Column(
          children: [
            //top bar-------------------------------------------------
            Column(
              children: [
                Container(
                  color: AppColors.mainColor,
                  padding: EdgeInsets.only(top: Dimentions.height30,left: Dimentions.height20,right: Dimentions.height20),
                  height: Dimentions.height20*6,
                  child: Positioned(
                      top: Dimentions.width30*3,
                      left: Dimentions.width20,
                      right: Dimentions.width20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Get.toNamed(RouteHelper.initial);
                            },
                            child: AppIcon(
                              icon: Icons.arrow_back_ios_new,
                              iconcolor:AppColors.navipink,
                              bgcolor: Colors.white,
                              iconSize: Dimentions.iconSize24,
                            ),
                          ),
                          SizedBox(width:Dimentions.width20*5,),

                          Container(
                            padding: EdgeInsets.only(bottom: Dimentions.height10,top: Dimentions.height10),
                            child: largeText(
                                overflow: TextOverflow.fade,
                                text: "Craft Items"
                            ),
                          ),
                          SizedBox(width:Dimentions.width20*5,),

                          GestureDetector(
                            onTap: (){
                              Get.toNamed(RouteHelper.initial);
                            },
                            child: AppIcon(
                              icon: Icons.home_outlined,
                              iconcolor:AppColors.navipink,
                              bgcolor: Colors.white,
                              iconSize: Dimentions.iconSize24,
                            ),
                          ),

                          // AppIcon(
                          //   icon: Icons.shopping_cart_outlined,
                          //   iconcolor:Colors.white,
                          //   bgcolor: AppColors.mainColor,
                          //   iconSize: Dimentions.iconSize24,
                          // ),
                        ],
                      ),
                    
                  ),
                ),

              ],
            ),
          //details-------------------------------------------------------------
      Expanded(child:
      SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.mainColor,
                    Colors.white,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
                borderRadius: BorderRadius.circular(Dimentions.radius20)
              ),

              child: Column(
                  children: [
                    SizedBox(height: Dimentions.height30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 10,
                                      spreadRadius: 3,
                                      offset: Offset(1, 10),
                                      color: Colors.grey.withOpacity(0.5),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(Dimentions.radius20),
                                  color: Colors.green,
                                  image:  DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      "assets/image/Paper Quilling Arts/2-1.jpg",
                                    ),
                                  )
                              ),
                              height: Dimentions.height20*8,
                              width: Dimentions.width20*8,
                              margin: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                            ),
                            largeText(text: "Two Loving Birds ",color: AppColors.titleColor),
                            smallText(text: "Rs. 4450.00",color: AppColors.navipink),
                            SizedBox(height: Dimentions.height10,),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 10,
                                      spreadRadius: 3,
                                      offset: Offset(1, 10),
                                      color: Colors.grey.withOpacity(0.5),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(Dimentions.radius20),
                                  color: Colors.green,
                                  image:  DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      "assets/image/String Arts/4-1.jpg",
                                    ),
                                  )
                              ),
                              height: Dimentions.height20*8,
                              width: Dimentions.width20*8,
                              margin: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                            ),
                            largeText(text: "Blue&Black Strin ...",color: AppColors.titleColor,),
                            smallText(text: "Rs. 3250.00",color: AppColors.navipink),
                            SizedBox(height: Dimentions.height10,),
                          ],
                        ),

                      ],
                    ),
                    Row(

                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 10,
                                      spreadRadius: 3,
                                      offset: Offset(1, 10),
                                      color: Colors.grey.withOpacity(0.5),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(Dimentions.radius20),
                                  color: Colors.green,
                                  image:  DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      "assets/image/Greeting Cards/1-1.jpg",
                                    ),
                                  )
                              ),
                              height: Dimentions.height20*8,
                              width: Dimentions.width20*8,
                              margin: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                            ),
                            largeText(text: "Red Hart Greeting ...",color: AppColors.titleColor,),
                            smallText(text: "Rs. 450.00",color: AppColors.navipink),
                            SizedBox(height: Dimentions.height10,),
                          ],
                        ),
//deletable-----------------------------------------------------------------
                        GestureDetector(
                          onTap: (){
                            Get.toNamed(RouteHelper.getRecommendedCraft(index,"home"));
                          },
//-----------------------------------------------------------------------------------
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 10,
                                        spreadRadius: 3,
                                        offset: Offset(1, 10),
                                        color: Colors.grey.withOpacity(0.5),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(Dimentions.radius20),
                                    color: Colors.green,
                                    image:  DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        "assets/image/Dream Catchers/8-1.jpeg",
                                      ),
                                    )
                                ),
                                height: Dimentions.height20*8,
                                width: Dimentions.width20*8,
                                margin: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                              ),
                              largeText(text: "Dream catcher",color: AppColors.titleColor,),
                              smallText(text: "Rs. 1250.00",color: AppColors.navipink),
                              SizedBox(height: Dimentions.height10,),
                            ],
                          ),
                        ),

                      ],
                    ),
                    Row(

                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 10,
                                      spreadRadius: 3,
                                      offset: Offset(1, 10),
                                      color: Colors.grey.withOpacity(0.5),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(Dimentions.radius20),
                                  color: Colors.green,
                                  image:  DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      "assets/image/String Arts/1-1.jpg",
                                    ),
                                  )
                              ),
                              height: Dimentions.height20*8,
                              width: Dimentions.width20*8,
                              margin: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                            ),
                            largeText(text: "Circular String Art",color: AppColors.titleColor,),
                            smallText(text: "Rs. 3350.00",color: AppColors.navipink),
                            SizedBox(height: Dimentions.height10,),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 10,
                                      spreadRadius: 3,
                                      offset: Offset(1, 10),
                                      color: Colors.grey.withOpacity(0.5),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(Dimentions.radius20),
                                  color: Colors.green,
                                  image:  DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      "assets/image/Dream Catchers/2-4.jpeg",
                                    ),
                                  )
                              ),
                              height: Dimentions.height20*8,
                              width: Dimentions.width20*8,
                              margin: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                            ),
                            largeText(text: "Pink And Blue ...",color: AppColors.titleColor,),
                            smallText(text: "Rs. 950.00",color: AppColors.navipink),
                            SizedBox(height: Dimentions.height10,),
                          ],
                        ),

                      ],
                    ),
                    Row(

                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 10,
                                      spreadRadius: 3,
                                      offset: Offset(1, 10),
                                      color: Colors.grey.withOpacity(0.5),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(Dimentions.radius20),
                                  color: Colors.green,
                                  image:  DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      "assets/image/Greeting Cards/3-1.jpg",
                                    ),
                                  )
                              ),
                              height: Dimentions.height20*8,
                              width: Dimentions.width20*8,
                              margin: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                            ),
                            largeText(text: "Happy Birth ...",color: AppColors.titleColor,),
                            smallText(text: "Rs. 350.00",color: AppColors.navipink),
                            SizedBox(height: Dimentions.height10,),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 10,
                                      spreadRadius: 3,
                                      offset: Offset(1, 10),
                                      color: Colors.grey.withOpacity(0.5),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(Dimentions.radius20),
                                  color: Colors.green,
                                  image:  DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      "assets/image/Paper Quilling Arts/3-1.jpg",
                                    ),
                                  )
                              ),
                              height: Dimentions.height20*8,
                              width: Dimentions.width20*8,
                              margin: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                            ),
                            largeText(text: "Dog Paper Qui ...",color: AppColors.titleColor,),
                            smallText(text: "Rs. 4250.00",color: AppColors.navipink),
                            SizedBox(height: Dimentions.height10,),
                          ],
                        ),

                      ],
                    ),
                    Row(

                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 10,
                                      spreadRadius: 3,
                                      offset: Offset(1, 10),
                                      color: Colors.grey.withOpacity(0.5),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(Dimentions.radius20),
                                  color: Colors.green,
                                  image:  DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      "assets/image/String Arts/7-1.jpg",
                                    ),
                                  )
                              ),
                              height: Dimentions.height20*8,
                              width: Dimentions.width20*8,
                              margin: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                            ),
                            largeText(text: "Lady Bug String...",color: AppColors.titleColor,),
                            smallText(text: "Rs. 3350.00",color: AppColors.navipink),
                            SizedBox(height: Dimentions.height10,),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 10,
                                      spreadRadius: 3,
                                      offset: Offset(1, 10),
                                      color: Colors.grey.withOpacity(0.5),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(Dimentions.radius20),
                                  color: Colors.green,
                                  image:  DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      "assets/image/Greeting Cards/4-1.jpg",
                                    ),
                                  )
                              ),
                              height: Dimentions.height20*8,
                              width: Dimentions.width20*8,
                              margin: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                            ),
                            largeText(text: "Happy Birth Day...",color: AppColors.titleColor,),
                            smallText(text: "Rs. 350.00",color: AppColors.navipink),
                            SizedBox(height: Dimentions.height10,),
                          ],
                        ),

                      ],
                    ),
                    Row(

                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 10,
                                      spreadRadius: 3,
                                      offset: Offset(1, 10),
                                      color: Colors.grey.withOpacity(0.5),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(Dimentions.radius20),
                                  color: Colors.green,
                                  image:  DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      "assets/image/Dream Catchers/9-1.jpeg",
                                    ),
                                  )
                              ),
                              height: Dimentions.height20*8,
                              width: Dimentions.width20*8,
                              margin: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                            ),
                            largeText(text: "White Dream cat...",color: AppColors.titleColor,),
                            smallText(text: "Rs. 13s50.00",color: AppColors.navipink),
                            SizedBox(height: Dimentions.height10,),
                          ],
                        ),


                      ],
                    ),



                  ],
                ),
            ),
          ),
         ),
          ],
        ),
    );
  }
}
