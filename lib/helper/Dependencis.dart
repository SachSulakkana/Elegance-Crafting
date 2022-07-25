import 'package:first_project/controller/cartController.dart';
import 'package:first_project/data/repository/cartRepo.dart';
import 'package:first_project/extras/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controller/PopularProductController.dart';
import '../controller/recommended_product_controller.dart';
import '../data/api/api_client.dart';
import '../data/repository/popular_product_repo.dart';
import '../data/repository/recommended_product_repo.dart';

Future<void>init()async {
  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPreferences);
//For The API
  Get.lazyPut(()=>ApiClient(appBaseUrl: AppConstants.BASE_URL));

// for the repos
  Get.lazyPut(() =>PopularProductRepo(apiClient:Get.find()));
  Get.lazyPut(() =>RecommendedProductRepo(apiClient:Get.find()));
  Get.lazyPut(() =>CartRepo(sharedPreferences:Get.find()));

//for the controllers
  Get.lazyPut(() =>PopularProductController(popularProductRepo:Get.find()));
  Get.lazyPut(() =>RecommendedProductController(recommendedProductRepo:Get.find()));
  Get.lazyPut(() =>CartController(cartRepo:Get.find()));

}