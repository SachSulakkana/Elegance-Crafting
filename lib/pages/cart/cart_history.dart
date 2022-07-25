import 'dart:convert';

import 'package:first_project/base/no_data_page.dart';
import 'package:first_project/controller/cartController.dart';
import 'package:first_project/extras/Dimentions.dart';
import 'package:first_project/extras/app_constants.dart';
import 'package:first_project/extras/colors.dart';
import 'package:first_project/models/CartModel.dart';
import 'package:first_project/routes/route_helper.dart';
import 'package:first_project/widgets/AppIcon.dart';
import 'package:first_project/widgets/largeText.dart';
import 'package:first_project/widgets/smallText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CartHistory extends StatelessWidget {
  final  String dreamimage="assets/image/Dream Catchers/8-1.jpeg";
  const CartHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var getCartHistoryList = Get.find<CartController>()
        .getCartHistoryList().reversed.toList();

    Map<String, int> cartItemsPerOrder = Map();

    for(int i=0;i<getCartHistoryList.length;i++){
      if(cartItemsPerOrder.containsKey(getCartHistoryList[i].time)){
        cartItemsPerOrder.update(getCartHistoryList[i].time!,(value)=>++value);
      }else{
        cartItemsPerOrder.putIfAbsent(getCartHistoryList[i].time!,()=>1);
      }
    }

    List<int> carItemsPerOrderToList(){
      return cartItemsPerOrder.entries.map((e)=>e.value).toList();
    }
    List<String> carOrderTimeToList(){
      return cartItemsPerOrder.entries.map((e)=>e.key).toList();
    }

    List<int> itemsPerOrder = carItemsPerOrderToList();

    var listCounter=0;
    Widget timeWidget(int index){
      var outputDate = DateTime.now().toString();
     if (index<getCartHistoryList.length){
     DateTime parseDate = DateFormat("yyyy-MM-dd HH:mm:ss").parse(getCartHistoryList[listCounter].time!);
     var inputDate = DateTime.parse(parseDate.toString());
     var outputFormat = DateFormat("yyyy/MM/dd  hh:mm a");
      outputDate = outputFormat.format(inputDate);
    }
      return largeText(text: outputDate);
    }
    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(

        children: [
//----------------------------top bar-------------------------------------------

          Container(
            height: Dimentions.height20*5,
            color: AppColors.mainColor,
            width: double.maxFinite,
            padding: EdgeInsets.only(top: Dimentions.height45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                largeText(text: "Purchase Items History",color: Colors.white,),
//------------------------------------------------------------Add More----------
                GestureDetector(
                  onTap: (){
                    Get.toNamed(RouteHelper.getCartScreen());
                  },
//------------------------------------------------------------------------------
                  child: AppIcon(
                      icon: Icons.shopping_cart_outlined,
                      iconcolor: Colors.white,
                      bgcolor: AppColors.navipink,
                  ),
                ),
              ],
            ),
          ),

//----------------------------Body Bar------------------------------------------
          GetBuilder<CartController>(builder: (_cartController){
          return _cartController.getCartHistoryList().length>0?
          Expanded(child: Container(
              margin: EdgeInsets.only(
                top: Dimentions.height10*2,
                left: Dimentions.width20,
                right: Dimentions.width20,
              ),
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context, child: ListView(
                children: [
                  for(int i=0; i<cartItemsPerOrder.length; i++)
                    Container(
                      //color: AppColors.naviwhite,
                      height: Dimentions.height20*6,
                      margin: EdgeInsets.only(bottom: Dimentions.height20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          timeWidget(listCounter),

                          SizedBox(height: Dimentions.height10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Wrap(
                                direction: Axis.horizontal,
                                children: List.generate(itemsPerOrder[i], (index){
                                  if(listCounter<getCartHistoryList.length){
                                    listCounter++;
                                  }
                                  return index<=2?Container(
                                    height: Dimentions.height20*4,
                                    width: Dimentions.width20*4,
                                    margin: EdgeInsets.only(right: Dimentions.width10/2),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(Dimentions.radius15/2),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        // image: NetworkImage(
                                        //   AppConstants.BASE_URL+AppConstants.UPLOAD_URL+getCartHistoryList[listCounter-1].img!,
                                        // ),
                                        image: AssetImage(
                                          dreamimage,
                                        )
                                      ),
                                    ),
                                  ):Container();
                                }
                                ),
                              ),
                              Container(
                                height: Dimentions.height20*4,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    smallText(text: "Total ",color: AppColors.titleColor,),
                                    largeText(text: itemsPerOrder[i].toString() + " items",color: AppColors.titleColor,),
                                    GestureDetector(
                                      onTap: (){
                                        var orderTime = carOrderTimeToList();
                                        //print("Order Timessss " + orderTime[i].toString());
                                        Map<int,CartModel> moreOrder ={};
                                        for (int j=0;j<getCartHistoryList.length;j++){
                                          if (getCartHistoryList[j].time==orderTime[i]){
                                            moreOrder.putIfAbsent(getCartHistoryList[j].id!, () =>
                                                CartModel.fromJson(jsonDecode(jsonEncode(getCartHistoryList[j])))
                                            );

                                          }
                                        }
                                        Get.find<CartController>().setItems = moreOrder;
                                        Get.find<CartController>().addToCartList();
                                        Get.toNamed(RouteHelper.getCartScreen());
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(horizontal: Dimentions.height10,vertical: Dimentions.height5),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(Dimentions.radius15/3),
                                          border: Border.all(width: 1,color: AppColors.navipink),
                                        ),
                                        child: smallText(text: "  add more",color: AppColors.navipink,),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],

                          ),
                        ],
                      ),

                    )
                ],
              ),)
          ))
              :SizedBox(
            height: MediaQuery.of(context).size.height/1.5,
              child: const Center(
                child: NoDataPage(text: "You didn't buy anything !",
                  imgPath: "assets/image/Resourses/empty_box.jpg",
                ),
              )
          );
          }),

        ],
      ) ,
    );
  }
}
