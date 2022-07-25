import 'package:first_project/controller/cartController.dart';
import 'package:first_project/extras/colors.dart';
import 'package:first_project/models/CartModel.dart';
import 'package:first_project/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:first_project/data/repository/popular_product_repo.dart';

class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList=[];
  List <dynamic> get popularProductLists => _popularProductList;
  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded=>_isLoaded;

  int _quantity=0;
  int get Quantity=>_quantity;
  int _cartItems=0;
  int get cartItems=>_cartItems+_quantity;

  Future <void> getPopularProductList()async{
    Response response= await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200){


      _popularProductList=[];
      _popularProductList.addAll(Product.fromJson(response.body).products );
      //print(_popularProductList);
      _isLoaded=true;
      update();
    }else {

    }
  }

  void quantity(bool isIncrement){
    if(isIncrement){
      _quantity =checkQuantity(_quantity+1);
      //print("number of items :"+_quantity.toString());
    }else{
      _quantity =checkQuantity(_quantity-1);
     // print("low"+_quantity.toString());
    }
    update();
  }
  int checkQuantity(int Quantity){
    if ((_cartItems+Quantity)<0) {
      Get.snackbar("Item count", "Sorry! Minimum items of ordering is 1",
      backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      if (_cartItems>0){
        _quantity = -_cartItems;
        return _quantity;
      }
      return 0;
    }
    else if ((_cartItems+Quantity)>20){
      Get.snackbar("Item count", "Sorry! Maximum items of ordering is 20",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
        return 20;
      }
    else{
      return Quantity;
    }
    }

    void initCraft(ProductModel product , CartController cart){
    _quantity=0;
    _cartItems=0;
    _cart=cart;
    var exist=false;
    exist = _cart.existInCart(product);
    //print("exisist or not :"+exist.toString());
    if(exist){
      _cartItems = _cart.getQuantity(product);
    }
      //print("the quantity in the cart is : "+_cartItems.toString());
    }

    void addItem(ProductModel product,) {

      _cart.addItems(product, _quantity);

      _quantity = 0;
      _cartItems =_cart.getQuantity(product);

      _cart.items.forEach((key, value) {
        print("The id is : " + value.id.toString() + " The quantity is : " +
            value.quantity.toString());
      });

    update();
    }


    int get totalItems{
    return _cart.totalItems;
    }
    List<CartModel> get getItems{
    return _cart.getItems;
    }
  }


