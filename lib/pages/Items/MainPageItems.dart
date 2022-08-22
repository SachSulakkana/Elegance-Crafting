import 'package:first_project/extras/Dimentions.dart';
import 'package:first_project/extras/app_constants.dart';
import 'package:first_project/pages/HomePage/MainPage.dart';
import 'package:first_project/widgets/AppIcon.dart';
import 'package:first_project/widgets/app_column.dart';
import 'package:first_project/widgets/expandeble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/PopularProductController.dart';
import '../../controller/cartController.dart';
import '../../extras/colors.dart';
import '../../routes/route_helper.dart';
import '../../widgets/largeText.dart';
import '../../widgets/smallText.dart';
import '../cart/cartSreen.dart';

class MostViewedDetails extends StatelessWidget {
  final int pageId;
  final String page;
  const MostViewedDetails({Key? key, required this.pageId,required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int GreetingPrice = 1350;
    var product= Get.find<PopularProductController>().popularProductLists[pageId];

    Get.find<PopularProductController>().initCraft(product,Get.find<CartController>());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //----------------------------Background Image------------------------
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height:Dimentions.mostviweditems,

              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    AppConstants.BASE_URL+AppConstants.UPLOAD_URL+product.img!
                  ),
                ),
              ),
            ),
          ),
          //----------------------------Upper Icons-----------------------------
          Positioned(
            top: Dimentions.height30,
            left: Dimentions.width20,
            right: Dimentions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(onTap:(){
                 if(page=="cartpage"){
                   Get.toNamed(RouteHelper.getCartScreen());
                 }else{
                   Get.toNamed(RouteHelper.getInitial());
                 }
          },
          child:
                AppIcon(icon: Icons.arrow_back_ios)
                ),

                GetBuilder<PopularProductController>(builder: (controller){
                  return GestureDetector(
                    onTap: (){
                      if (controller.totalItems>=1)
                      Get.toNamed(RouteHelper.getCartScreen());
                    },
                    child: Stack(
                      children :[
                        AppIcon(icon: Icons.shopping_cart_outlined,),
                        controller.totalItems>=1?
                        Positioned(
                            right: 0,top: 0,

                                child: AppIcon(icon: Icons.circle,size: 20,iconcolor: Colors.transparent, bgcolor: Colors.red, )):
                          Container(),
                        Get.find<PopularProductController>().totalItems>=1?
                        Positioned(
                            right: 4,top: 3,
                            child: largeText(text: Get.find<PopularProductController>().totalItems.toString(),
                            size:12,color: Colors.white,
                            ),
                        ) :
                        Container()
                      ],
                    ),
                  );
                },
                ),
              ],
            ),
          ),
          //----------------------------Title Widgets---------------------------
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimentions.mostviweditems-20,
              child: Container(
              padding: EdgeInsets.only(left: Dimentions.width20,right: Dimentions.width20,top: Dimentions.height20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimentions.radius20),
                  topLeft: Radius.circular(Dimentions.radius20),
                ),
                color: Colors.white

              ),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(
                        text:product.name!,
                    ),
                    SizedBox(height: Dimentions.height20,),
                    largeText(text: "Description",),
                    SizedBox(height: Dimentions.height20,),
                    //--------------------------------Expandables---------------------------
                     Expanded(
                         child: SingleChildScrollView(
                             child: ExpandableText(
                                 text:product.description!,
                             )
                         )
                     ),
                  ],
                ),
              )
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder:(popularProduct){
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(
                left: Dimentions.width20*2.5,
                right: Dimentions.width20*2.5,
                top: Dimentions.height10,
                bottom: Dimentions.height10,

              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      popularProduct.quantity(false);
                    },
                    child: AppIcon(
                      iconSize: Dimentions.iconSize24, iconcolor:Colors.black, bgcolor:AppColors.bottomBgColor, icon: Icons.remove,
                    ),
                  ),

                  largeText(
                    text:"Q "+popularProduct.cartItems.toString()+" | "+ "Rs.${product.price! * popularProduct.cartItems}",

                    color: AppColors.blackColor,
                    size: Dimentions.font26,
                  ),
                  GestureDetector(
                    onTap: (){
                      popularProduct.quantity(true);
                    },
                    child: AppIcon(
                      iconSize: Dimentions.iconSize24,
                      iconcolor:Colors.black,
                      bgcolor:AppColors.bottomBgColor,
                      icon: Icons.add,
                    ),
                  ),

                ],
              ),
            ),
            Container(
              height: Dimentions.bottomHeight,
              padding: EdgeInsets.only(top: Dimentions.height30,bottom: Dimentions.height30,left: Dimentions.width20,right: Dimentions.width20),
              decoration: BoxDecoration(
                  color: AppColors.bottomBgColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimentions.radius20*2),
                    topRight: Radius.circular(Dimentions.radius20*2),

                  )
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: Dimentions.height20,bottom: Dimentions.height20,left: Dimentions.width20,right: Dimentions.width20),
                    child: GestureDetector(
                      onTap:(){
                        popularProduct.addItem(product);
                      } ,

                    child: largeText(text: "Add to Cart",color: Colors.white,)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimentions.radius20,),
                      color: AppColors.mainColor,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: Dimentions.height20,bottom: Dimentions.height20,left: Dimentions.width20,right: Dimentions.width20),
                    child: largeText(text: "Customize",color: Colors.white,),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimentions.radius20,),
                      color: AppColors.mainColor,
                    ),
                  ),
                ],
              ),

            ),

          ],
        );
      },
      ),
    );
  }
}
