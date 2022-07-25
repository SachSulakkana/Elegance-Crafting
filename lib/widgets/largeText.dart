import 'package:first_project/extras/Dimentions.dart';
import 'package:flutter/cupertino.dart';

class largeText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overflow;


   largeText({Key? key, this.color= const Color(0xFF332d2b),
    required this.text,
    this.size=20,
    this.overflow=TextOverflow.ellipsis//when text length goes long
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontFamily: 'Roboto',
        fontSize: size==0?Dimentions.font20:size,
          fontWeight:FontWeight.w400
      ),
    );
  }
}
