import 'package:first_project/extras/Dimentions.dart';
import 'package:flutter/cupertino.dart';

class AppIcon extends StatelessWidget {

  final IconData icon;
  final Color bgcolor;
  final Color iconcolor;
  final double size;
  final double iconSize;
 AppIcon({Key? key,
  required this.icon,
   this.bgcolor=const Color(0xffffffff),
   this.iconcolor=const Color(0xff5f5f5f),
   this.size=40,
   this.iconSize = 16,
 }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size/2),
        color: bgcolor,
      ),

      child: Icon(
        icon,color: iconcolor,
        size: iconSize,

      ),

    );
  }
}
