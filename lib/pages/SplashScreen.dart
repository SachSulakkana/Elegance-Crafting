import 'dart:async';


import 'package:first_project/extras/Dimentions.dart';
import 'package:first_project/routes/route_helper.dart';
import 'package:first_project/widgets/largeText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../controller/PopularProductController.dart';
import '../controller/recommended_product_controller.dart';
import '../extras/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

  late Animation<double> animation;
  late AnimationController controller;

  Future<void> _loadResource() async {
      await Get.find<PopularProductController>().getPopularProductList();
      await Get.find<RecommendedProductController>().getRecommendedProductList();
  }

  @override
  void initState(){
  super.initState();
  _loadResource();
    controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2)
    )..forward();

    animation= CurvedAnimation(parent: controller, curve: Curves.linear);

    Timer(
      Duration(seconds: 5),
        ()=>Get.offNamed(RouteHelper.getInitial())
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScaleTransition(scale: animation,
              child: Center(child: Image.asset  ( "assets/image/Resourses/Logo.png",width: Dimentions.splashimg,))
              ),
          SizedBox(
            width: 200.0,

            child: AnimatedTextKit(
              animatedTexts: [
                ColorizeAnimatedText(
                  'ELEGANCE',
                  textStyle:text.colorizeTextStyle,
                  colors: text.colorizeColors,
                ),
              ],
             ),
             ),
            ],
          ),
      ),
    );
  }
}

class text{
  static const colorizeColors = [
    Colors.pink,
    Colors.white,
    Colors.purple,

  ];
  static const colorizeTextStyle = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    fontFamily: 'Horizon',
  );
}
