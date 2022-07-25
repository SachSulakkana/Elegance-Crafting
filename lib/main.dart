import 'package:first_project/controller/PopularProductController.dart';
import 'package:first_project/controller/cartController.dart';
import 'package:first_project/extras/colors.dart';
import 'package:first_project/pages/Catogary/CraftCatogary.dart';
import 'package:first_project/pages/HomePage/ItemPage.dart';
import 'package:first_project/pages/HomePage/MainPage.dart';
import 'package:first_project/pages/Items/RecommendedItems.dart';
import 'package:first_project/pages/SplashScreen.dart';
import 'package:first_project/pages/account/accountPage.dart';
import 'package:first_project/pages/auth/SignInPage.dart';
import 'package:first_project/pages/auth/SignUp.dart';
import 'package:first_project/pages/cart/cartSreen.dart';
import 'package:first_project/routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:get/get.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'controller/recommended_product_controller.dart';
import 'helper/Dependencis.dart' as dep ;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(
    DevicePreview(
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // root of the application.
  @override
  Widget build(BuildContext context) {
     Get.find<CartController>().getCartData();

    return GetBuilder<PopularProductController>(builder:(_){
      return  GetBuilder <RecommendedProductController>(builder: (_){
        return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        title: 'Flutter Demo',

          initialRoute: RouteHelper.getSplashScreen(),
          getPages: RouteHelper.routes,
            //home: CraftCatogary(),

         );
        }
      );
    }
   );

  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:
      Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          ],
        ),
      ),
    );
  }
}

