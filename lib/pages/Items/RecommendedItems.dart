import 'package:first_project/controller/recommended_product_controller.dart';
import 'package:first_project/extras/Dimentions.dart';
import 'package:first_project/extras/app_constants.dart';
import 'package:first_project/extras/colors.dart';
import 'package:first_project/routes/route_helper.dart';
import 'package:first_project/widgets/AppIcon.dart';
import 'package:first_project/widgets/expandeble.dart';
import 'package:first_project/widgets/largeText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/PopularProductController.dart';
import '../../controller/cartController.dart';
import '../HomePage/MainPage.dart';
import '../cart/cartSreen.dart';

class RecommendedItem extends StatelessWidget {
  final  int pageId;
  final String page;
  const RecommendedItem({Key? key,required this.pageId,required this.page }) : super(key: key);

  @override
  Widget build(BuildContext context) {
//-------------------------------------------------
    final int priceCraft=1250;
//----------------------------------------------
    var product = Get.find<RecommendedProductController>().recommendedProductLists[pageId];
    Get.find<PopularProductController>().initCraft(product,Get.find<CartController>());
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 80,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(onTap:(){
                  if(page=="cartpage"){
                    Get.toNamed(RouteHelper.getCartScreen());
                  }else{
                    Get.toNamed(RouteHelper.getInitial());
                  }
              },
                   child: AppIcon(icon: Icons.clear),
                ),
                //AppIcon(icon: Icons.shopping_cart_outlined),
                GetBuilder<PopularProductController>(builder: (controller){
                  return GestureDetector(
                    onTap: (){
                      Get.toNamed(RouteHelper.getCartScreen());
                    },

                    child: Stack(
                      children :[
                        AppIcon(icon: Icons.shopping_cart_outlined,),
                        Get.find<PopularProductController>().totalItems>=1?
                        Positioned(
                            right: 0,top: 0,
                            child: AppIcon(icon: Icons.circle,size: 20,iconcolor: Colors.transparent, bgcolor: Colors.red, )):
                        Container(),
                        Get.find<PopularProductController>().totalItems>=1?
                        Positioned(
                          right: 4,top: 3,
                          child: largeText(text: Get.find<PopularProductController>().totalItems.toString(),
                            size:12,color: AppColors.naviwhite,
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
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
                child: Container(
                  child: Center(child: largeText(
                    size:Dimentions.font26,
                    // text: product.name!,
                    text: "Dream Catcher",
                  )),
                  width: double.maxFinite,
                  padding: EdgeInsets.only(top: Dimentions.width10/2,bottom: Dimentions.width10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimentions.radius20),
                      topRight: Radius.circular(Dimentions.radius20),
                    ),
                  ),

                ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 400,
            flexibleSpace: FlexibleSpaceBar(
              background:
                  //Image.network(AppConstants.BASE_URL+AppConstants.UPLOAD_URL+product.img!,
              Image.asset("assets/image/Dream Catchers/8-1.jpeg",
              width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  //child: ExpandableText(text:product.description!),
                  child: ExpandableText(
                    text:  "Nightmare will fade away with the sunrise with this dream catcher and it can give you a dreamy feeling. By hand, this dreamcatcher is purely woven with richly colored feathers and has the beauty of Art Deco, making the new element stunning to the eye. And it represents blessing, praying for peace and good luck. Made of feather and iron ring, it is durable and lightweight.The diameter of the mesh circle is 15cm, and the total length is 55cm.It can be used to decorate bedrooms, living rooms, lounges, offices, etc., and can also be used as a gift to family or friends and give them good wishes.",                                 ),
                  margin: EdgeInsets.only(
                    left: Dimentions.width20,
                    right: Dimentions.width20,
                    bottom: Dimentions.height10,
                  ),
                ),

              ],


            ),

          ),

        ],

      ),

      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (controller){
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
                controller.quantity(false);
                },
                child: AppIcon(
                iconSize: Dimentions.iconSize24,
                iconcolor:Colors.white,
                bgcolor:AppColors.mainColor,
                icon: Icons.remove,
                ),
                ),
                  //largeText(text:"Q  ${controller.cartItems} " + "| " + "Rs.${product.price!*controller.cartItems}",color: AppColors.blackColor,size: Dimentions.font26,),
                  largeText(text:"Q  ${controller.cartItems} " + "| " + "Rs.${priceCraft*controller.cartItems}",color: AppColors.blackColor,size: Dimentions.font26,),
                  GestureDetector(
                    onTap: (){
                      controller.quantity(true);
                    },
                    child: AppIcon(
                      iconSize: Dimentions.iconSize24,
                      iconcolor:Colors.white,
                      bgcolor:AppColors.mainColor,
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
                 GestureDetector(
                   onTap: (){
                     controller.addItem(product);
                   },
                   child:  Container(
                     padding: EdgeInsets.only(top: Dimentions.height20,bottom: Dimentions.height20,left: Dimentions.width20,right: Dimentions.width20),
                     child: largeText(text: "Add to Cart",color: Colors.white,),
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(Dimentions.radius20,),
                       color: AppColors.mainColor,
                     ),
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
