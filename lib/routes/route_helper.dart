import 'package:first_project/pages/HomePage/MainPage.dart';
import 'package:first_project/pages/HomePage/homepage.dart';
import 'package:first_project/pages/Items/MainPageItems.dart';
import 'package:first_project/pages/Items/RecommendedItems.dart';
import 'package:first_project/pages/cart/cartSreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../pages/SplashScreen.dart';

class RouteHelper{
  static const String spalshScreen = "/splash-screen";
  static const String initial="/";
  static const String popularCraft="/popular-craft";
  static const String recommendedCraft="/recommended-craft";
  static const String cartScreen = "/cart-screen";

  static String getSplashScreen()=>'$spalshScreen';
  static String getInitial()=>'$initial';
  static String getPopularCraft(int pageId, String page)=>'$popularCraft?pageId=$pageId&page=$page';
  static String getRecommendedCraft(int pageId, String page)=>'$recommendedCraft?pageId=$pageId&page=$page';
  static String getCartScreen()=>'$cartScreen' ;

  static List<GetPage> routes=[
    GetPage(name: spalshScreen, page: ()=>SplashScreen()),
    GetPage(name: initial, page: ()=>HomePage()),
    GetPage(name: popularCraft, page:(){
      var pageId=Get.parameters['pageId'];
      var page =Get.parameters["page"];
      return MostViewedDetails(pageId: int.parse(pageId!), page:page!);
    },
      transition: Transition.fadeIn,
    ),

    GetPage(name: recommendedCraft, page:(){
      var pageId=Get.parameters['pageId'];
      var page = Get.parameters["page"];
      return RecommendedItem(pageId: int.parse(pageId!),page:page!);
    },
      transition: Transition.fadeIn,
    ),
    GetPage(name: cartScreen, page:(){
      return CartScreen();
    },
      transition: Transition.fadeIn,
    )
  ];
}