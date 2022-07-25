import 'package:first_project/extras/Dimentions.dart';
import 'package:first_project/extras/colors.dart';
import 'package:first_project/widgets/largeText.dart';
import 'package:first_project/widgets/smallText.dart';
import 'package:flutter/material.dart';


import 'ItemPage.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //---------------------------------------------------Header-------------------------------------------
          Container(

            child: Center(
              child: Container(
                margin: EdgeInsets.only(top: Dimentions.height45,bottom: Dimentions.height15),
                padding: EdgeInsets.only(left: Dimentions.width20,right: Dimentions.width20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
//-----------------------------------------country----------------------------------
                    // Column(
                    //   children: [
                    //     largeText(text:"Country" ,color: AppColors.mainColor),
                    //     Row(
                    //     children:[
                    //       smallText( text:"City",color: Colors.black54,),
                    //       Icon(Icons.arrow_drop_down_rounded),
                    //     ]
                    //   ),
                    // ],
                    // ),
//-----------------------------------------country----------------------------------
                    Center(
                      child: Container(
                        width: Dimentions.height45,
                        height: Dimentions.height45,
                        child: Icon(Icons.search,color: Colors.white,size: Dimentions.iconSize24,),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimentions.radius15),
                          color:AppColors.mainColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          //---------------------------------------------------Body-------------------------------------------
          Expanded(
              child: SingleChildScrollView(
                child: itemPage(),
            )
          )
        ],
      )
    );

  }
}
