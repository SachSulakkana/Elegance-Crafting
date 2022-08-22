import 'package:first_project/base/no_data_page.dart';
import 'package:first_project/controller/PopularProductController.dart';
import 'package:first_project/controller/cartController.dart';
import 'package:first_project/controller/recommended_product_controller.dart';
import 'package:first_project/extras/Dimentions.dart';
import 'package:first_project/extras/app_constants.dart';
import 'package:first_project/extras/colors.dart';
import 'package:first_project/widgets/AppIcon.dart';
import 'package:first_project/widgets/largeText.dart';
import 'package:first_project/widgets/smallText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/route_helper.dart';


class  CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body:Stack(
        children: [
          Positioned(
              top: Dimentions.width30*2,
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
                      iconcolor:Colors.white,
                      bgcolor: AppColors.mainColor,
                      iconSize: Dimentions.iconSize24,
                    ),
                  ),
                  SizedBox(width:Dimentions.width20*5,),

                  GestureDetector(
                    onTap: (){
                      Get.toNamed(RouteHelper.initial);
                    },
                    child: AppIcon(
                      icon: Icons.home_outlined,
                      iconcolor:Colors.white,
                      bgcolor: AppColors.mainColor,
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
          )
          ),
          GetBuilder<CartController>(builder: (_cartController){
            return _cartController.getItems.length>0?Positioned(
                top: Dimentions.height20*5,
                left: Dimentions.width20,
                right: Dimentions.width20,
                bottom: 0,
                child: Container(
                  margin: EdgeInsets.only(top: Dimentions.height15),
                  //color: Colors.amber,
                  child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: GetBuilder<CartController>(builder: (cartController){

                        var _cartList = cartController.getItems  ;
                        return ListView.builder(
                            itemCount: _cartList.length,
                            itemBuilder: (_, index){
                              return Container(
                                width: double.maxFinite,
                                height: Dimentions.height20*5,
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                        var popularIndex = Get.find<PopularProductController>()
                                            .popularProductLists
                                            .indexOf(_cartList[index].product!);
                                        if (popularIndex>=0){
                                          Get.toNamed(RouteHelper.getPopularCraft(popularIndex,"cartpage"));

                                        }else{
                                          var recommendedIndex = Get.find<RecommendedProductController>()
                                              .recommendedProductLists
                                              .indexOf(_cartList[index].product!);
                                          if(recommendedIndex<0){
                                            Get.snackbar("History Craft", "Craft review is not available for History ",
                                              backgroundColor: AppColors.mainColor,
                                              colorText: Colors.white,
                                            );
                                          }else{
                                            Get.toNamed(RouteHelper.getRecommendedCraft(recommendedIndex, "cartpage"));
                                          }
                                        }
                                      },

                                      child: Container(
                                        width: Dimentions.height20*5,
                                        height: Dimentions.height20*5,
                                        margin: EdgeInsets.only(bottom: Dimentions.height10),
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.cover ,
                                            image: NetworkImage(AppConstants.BASE_URL+AppConstants.UPLOAD_URL+cartController.getItems[index].img!),
                                            //
                                          ),
                                          borderRadius: BorderRadius.circular(Dimentions.radius20),
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width:Dimentions.width10,),
                                    Expanded(
                                        child: Container(
                                          height: Dimentions.height20*5,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                             largeText(text:cartController.getItems[index].name!,color: Colors.black54,),
                                              largeText(text: "White Colour Dream Catcher",color: Colors.black54,),

                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  largeText(text:"Rs. "+ cartController.getItems[index].price.toString()+".00",color: Colors.redAccent,),
                                                  // largeText(text:"Rs.2450.00",color: Colors.redAccent,),

                                                  Container(
                                                    padding: EdgeInsets.only(top: Dimentions.height10,bottom: Dimentions.height10,left: Dimentions.width10,right: Dimentions.width10),

                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(Dimentions.radius20),
                                                      color: Colors.white,
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        GestureDetector(
                                                            onTap: (){
                                                              cartController.addItems(_cartList[index].product!, -1);
                                                              print("Redeuce");

                                                            },
                                                            child: Icon(Icons.remove,color: AppColors.signColor,)),
                                                        SizedBox(width: Dimentions.width10/2,),
                                                        largeText(text: _cartList[index].quantity.toString()),//popularProduct.cartItems.toString()),
                                                        SizedBox(width: Dimentions.width10/2,),
                                                        GestureDetector(
                                                            onTap: (){
                                                              cartController.addItems(_cartList[index].product!, 1);
                                                              print("tapped");
                                                            },
                                                            child: Icon(Icons.add,color: AppColors.signColor,)),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                    )
                                  ],
                                ),
                              );
                            });
                      },)
                  ),
                )):NoDataPage(text: "Your Cart is empty!");
          })
        ],
      ) ,
      bottomNavigationBar: GetBuilder<CartController>(builder:(cartController){

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            cartController.getItems.length>0?Container(
          height: Dimentions.bottomHeight,
          padding: EdgeInsets.only(top: Dimentions.height30,bottom: Dimentions.height30,left: Dimentions.width20,right: Dimentions.width20),
          decoration: BoxDecoration(
              color: AppColors.naviwhite,
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
                child: largeText(text:"Total Rs. " + cartController.totalAmount.toString()+".00",color: Colors.black,),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimentions.radius20,),

                ),
              ),
              GestureDetector(
                onTap: (){
                  print("check out");
                  cartController.addToHistory();

                },
                child: Container(
                  padding: EdgeInsets.only(top: Dimentions.height20,bottom: Dimentions.height20,left: Dimentions.width20,right: Dimentions.width20),
                  child: largeText(text: "Check Out",color: Colors.white,),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimentions.radius20,),
                    gradient: LinearGradient(
                      colors: [
                        AppColors.navipink,
                        Colors.grey,
                      ],

                    ),

                  ),
                ),
              ),
            ],
          ),

        ):Container(),


          ],
        );
      },
      ),
    );
  }
}
