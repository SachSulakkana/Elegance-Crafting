import 'package:first_project/extras/Dimentions.dart';
import 'package:first_project/widgets/smallText.dart';
import 'package:flutter/cupertino.dart';

class IconAndTextWidgets extends StatelessWidget {
  final IconData icon;
  final String text;

  final Color iconcolor;
  const IconAndTextWidgets({Key? key,
    required this.icon,
    required this.text,

    required this.iconcolor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children:[
        Icon(icon,color: iconcolor,size: Dimentions.iconSize24,),
        SizedBox(width: 5,),
        smallText(text: text,),
      ],
    );

  }
}
