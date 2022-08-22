import 'package:dots_indicator/dots_indicator.dart';
import 'package:first_project/controller/PopularProductController.dart';
import 'package:first_project/controller/recommended_product_controller.dart';
import 'package:first_project/extras/app_constants.dart';
import 'package:first_project/extras/colors.dart';
import 'package:first_project/models/products_model.dart';
import 'package:first_project/pages/Items/MainPageItems.dart';
import 'package:first_project/widgets/i_and_t_widgets.dart';
import 'package:first_project/widgets/largeText.dart';
import 'package:first_project/widgets/smallText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../extras/Dimentions.dart';
import '../../routes/route_helper.dart';
import '../../widgets/app_column.dart';



class itemPage extends StatefulWidget {
  const itemPage({Key? key}) : super(key: key);
  @override
  State<itemPage> createState() => _footPageState();
}


class _footPageState extends State<itemPage> {

  PageController pageController=PageController(viewportFraction: 0.9);
  var _currentPageValue=0.0;
  double _scaleFactor =0.8;
  double _height=Dimentions.PageViewContainer;

  @override
  void initState(){

    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue=pageController.page!;

      });
      }
    );
  }

  @override
  void dispose(){
    pageController.dispose();
    super.dispose();
  }
//-----------------------main floating images-----------------------------------
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
//--------------------------------Slider part-----------------------------------
       GetBuilder<PopularProductController>(builder: (popularProducts){
         return popularProducts.isLoaded?Container(
           height: Dimentions.PageView,

             child: PageView.builder( 
                 controller: pageController,
                 itemCount:popularProducts.popularProductLists.length,
                 itemBuilder: (context, position){
                   return _buildPageItem(position,popularProducts.popularProductLists[position] );

                 }

             ),

         ):CircularProgressIndicator(
           color: AppColors.mainColor,
         );
       }) ,

    //-------------------------------Dots-------------------------

    GetBuilder<PopularProductController>(builder: (popularProducts){
      return DotsIndicator(
        dotsCount: popularProducts.popularProductLists.isEmpty?1:popularProducts.popularProductLists.length,
        position: _currentPageValue,
        decorator: DotsDecorator(
          activeColor:AppColors.navipink ,
          size: const Size.square(9.0),
          activeSize: const Size(18.0, 9.0),
          activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        ),
      );
    }),
//-------------------------------------Most viewed items------------------------
        SizedBox(height: Dimentions.height30,),
        Container(
          margin: EdgeInsets.only(left: Dimentions.width30),
          child:
          Row(
            children: [
              largeText(text: "Most Popular Crafts ..."),

            ],
          ),
        ),
//----------------------------------Recommended crafts--------------------------
//--------------------------List------------------------------------------------


        GetBuilder<RecommendedProductController>(builder:(recommendedProduct){
        return recommendedProduct.isLoaded?ListView.builder(
            shrinkWrap: true,
            physics:NeverScrollableScrollPhysics(),
            itemCount:recommendedProduct.recommendedProductLists.length ,
            itemBuilder: (context, index){
              return GestureDetector(
                onTap: (){
                  Get.toNamed(RouteHelper.getRecommendedCraft(index,"home"));
                },
                child: Container(
                  margin:EdgeInsets.only(left: Dimentions.width20,right: Dimentions.width20,bottom: Dimentions.height15),
                  child: Row(

                    children: [
//------------------------------images------------------------------------------

                      Container(
                        width: Dimentions.listViewimg,
                        height: Dimentions.listViewimg,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimentions.radius20),
                          color: Colors.white38,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                              image: NetworkImage(
                                  AppConstants.BASE_URL+AppConstants.UPLOAD_URL+recommendedProduct.recommendedProductLists[index].img!
                              )

                          ),
                        ),
                      ),

//------------------------------Details------------------------------------------
                      Expanded(
                        child: Container(

                          height: Dimentions.listViewtxt,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(Dimentions.radius20),
                              bottomRight: Radius.circular(Dimentions.radius20),
                            ),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: Dimentions.width10,right: Dimentions.width10),
                            child: Column(
                              crossAxisAlignment:CrossAxisAlignment.start ,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                largeText(text: recommendedProduct.recommendedProductLists[index].name!),


                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
        ):CircularProgressIndicator(
          color: AppColors.mainColor,
        );
        }),

    ],
    );
  }

  Widget _buildPageItem(int index,ProductModel popularProduct){

    Matrix4 matrix = new Matrix4.identity();
    if (index == _currentPageValue.floor()){
      var currentScale = 1-(_currentPageValue-index)*(1-_scaleFactor);
      var currentTrans = _height*(1-currentScale)/2;
      matrix = Matrix4.diagonal3Values(1, currentScale , 1)..setTranslationRaw(0, currentTrans, 0);
    }
    else if (index == _currentPageValue.floor()+1){
      var currentScale = _scaleFactor+(_currentPageValue-index)*(1-_scaleFactor);
      var currentTrans = _height*(1-currentScale)/2;
      matrix = Matrix4.diagonal3Values(1, currentScale , 1)..setTranslationRaw(0, currentTrans, 0);
    }

    else if (index == _currentPageValue.floor()-1){
      var currentScale = 1-(_currentPageValue-index)*(1-_scaleFactor);
      var currentTrans = _height*(1-currentScale)/2;
      matrix = Matrix4.diagonal3Values(1, currentScale , 1);
      matrix = Matrix4.diagonal3Values(1, currentScale , 1)..setTranslationRaw(0, currentTrans, 0);
    }
    else{
      var currentScale =0.8;
      matrix = Matrix4.diagonal3Values(1, currentScale , 1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 1);
    }


    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector(
          onTap: (){

            Get.toNamed(RouteHelper.getPopularCraft(index, "home"));
          },
            child: Container(
        height: Dimentions.PageViewContainer,
        margin:EdgeInsets.only(left: Dimentions.width10,right: Dimentions.width10),
        decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimentions.radius30),
              color: index.isEven?Color(0xFFf090b5):Color(0xFFdbbfca),
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      AppConstants.BASE_URL+AppConstants.UPLOAD_URL+popularProduct.img!
                  )
              )
        ),
      ),
          ),


          // ---------------------------details container--------------------------------------


          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimentions.PageViewTextContainer,
              margin:EdgeInsets.only(left: Dimentions.width30,right: Dimentions.width30,bottom: Dimentions.height30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimentions.radius20),
                  color:Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                       blurRadius: 5.0,
                      offset: Offset(0,5)
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5,0),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(5,0),
                    ),
                  ]
                  ),
              child:
              Container(
                  padding: EdgeInsets.only(top: Dimentions.height10,left: 25,right: 15),

                child: AppColumn(text: popularProduct.name!,),
                ),

              ),
            ),
        ],
      ),
    );
  }
}
