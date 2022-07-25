import 'package:first_project/widgets/smallText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../extras/Dimentions.dart';
import '../extras/colors.dart';
import 'largeText.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        largeText(text: text,size: Dimentions.font26,),
        SizedBox(height: Dimentions.height10,),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Wrap(
                children:List.generate(5, (index) => Icon(Icons.star,color: AppColors.mainColor,size: 15,))
            ),
            SizedBox(width: 10,),
            smallText(text: "4.5"),
            SizedBox(width: 10,),
            smallText(text: "1278"),
            SizedBox(width: 10,),
            smallText(text: "Comments"),
          ],
        ),
        SizedBox(
          height: Dimentions.height10,
        ),
        smallText(text: "Rs.1350.00",size: Dimentions.font20,),
        SizedBox(
          height: Dimentions.height20,
        ),
        // ----------------------------------IconList----------------
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     IconAndTextWidgets(
        //       icon: Icons.circle_sharp,
        //       text: "Normal",
        //       iconcolor: AppColors.iconColor1,
        //     ),
        //
        //     IconAndTextWidgets(
        //       icon: Icons.location_on,
        //       text: "1.55 Km",
        //       iconcolor: AppColors.mainColor,
        //     ),
        //
        //     IconAndTextWidgets(
        //       icon: Icons.access_time_rounded,
        //       text: "1 hour",
        //       iconcolor: AppColors.iconColor2,
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
